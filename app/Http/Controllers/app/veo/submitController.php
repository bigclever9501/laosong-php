<?php

namespace App\Http\Controllers\app\veo;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;

class submitController extends Controller
{
    public function index(Request $r)
    {
        // =========================
        // 1. 基础参数校验
        // =========================

        // 提示词不能为空
        if (empty($r['prompt'])) {
            return $this->result(400, '提示词不能为空', '');
        }

        // 模型不能为空
        if (empty($r['model'])) {
            return $this->result(400, '必须指定模型名称', '');
        }

        // =========================
        // 2. 模型白名单校验
        // =========================

        // 只允许这几个 veo 模型，防止前端乱传模型名
        $allowModels = [
            'veo_3_1-4K',
            'veo_3_1-components-4K',
            'veo_3_1-fast-fl',
            'veo_3_1-fast',
            'veo3.1-fast'
        ];

        // 取模型名
        $model = $r['model'];

        // 如果传入的模型不在允许范围内，直接报错
        if (!in_array($model, $allowModels)) {
            return $this->result(400, '模型参数错误', '');
        }

        // =========================
        // 3. 参数处理
        // =========================

        // 尺寸参数，可选，默认给 1920x1080
        $size = $r['size'] ?? '1920x1080';

        // 参考图参数，可选，多张图可用 | 拼接
        $input_reference = $r['input_reference'] ?? '';

        // =========================
        // 4. 用户身份鉴权
        // =========================

        // 从请求头里拿 Authorization
        $Authorization = $r->header('Authorization');
        if (empty($Authorization)) {
            return $this->result(400, '鉴权失败，请提供 API Key', '');
        }

        // 根据 api_key 查用户
        $user = DB::table('users')->where('api_key', $Authorization)->first();
        if (empty($user)) {
            return $this->result(400, 'API_KEY 错误', '');
        }
        $user = (array)$user;

        // =========================
        // 5. 计费与验资
        // =========================

        // 按模型区分价格
        $priceMap = [
            'veo_3_1-4K'            => 2.00,
            'veo_3_1-components-4K' => 2.00,
            'veo_3_1-fast-fl'       => 1.00,
            'veo_3_1-fast'          => 1.00,
            'veo3.1-fast'           => 1.00,
        ];

        // 如果模型不在价格表里，直接报错
        if (!isset($priceMap[$model])) {
            return $this->result(400, '模型参数错误或暂未配置价格', '');
        }

        // 获取当前模型对应价格
        $price = $priceMap[$model];

        // 判断用户可用积分是否足够
        if ($user['available_point'] < $price) {
            return $this->result(400, '可用点数不足', '');
        }

        // =========================
        // 6. 读取系统配置中的上游 API KEY
        // =========================

        // 统一从 api_config 表中读取 yijia_api_key
        $apiConfig = (array)DB::table('api_config')->first();
        $yijia_key = $apiConfig['yijia_api_key'] ?? '';

        if (empty($yijia_key)) {
            return $this->result(500, '系统尚未配置 yijia_api_key', '');
        }

        // =========================
        // 7. 请求上游创建任务
        // =========================

        // 上游创建任务接口
        $url = 'https://apius.yijiarj.cn/v1/videos';

        // 组装请求体
        $data = [
            'prompt' => $r['prompt'],
            'model'  => $model,
            'size'   => $size
        ];

        // 如果传了参考图，再带上 input_reference
        if (!empty($input_reference)) {
            $data['input_reference'] = $input_reference;
        }

        // 请求头
        $headers = [
            'Authorization: Bearer ' . $yijia_key,
            'Content-Type: application/json'
        ];

        // 发起 CURL 请求
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch, CURLOPT_POST, true);
        curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($data, JSON_UNESCAPED_UNICODE));
        curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($ch, CURLOPT_TIMEOUT, 120);

        $response = curl_exec($ch);
        $httpCode = curl_getinfo($ch, CURLINFO_HTTP_CODE);

        // 如果 CURL 本身报错
        if (curl_errno($ch)) {
            $curlError = curl_error($ch);
            curl_close($ch);

            return $this->result(500, '上游请求失败：' . $curlError, '');
        }

        curl_close($ch);

        // 如果上游接口返回的 HTTP 状态码不是 200
        if ($httpCode != 200) {
            $upstream = json_decode($response, true);
            $upstreamMsg = $upstream['error']['message'] ?? ('上游接口返回异常，HTTP状态码：' . $httpCode);

            return $this->result(500, $upstreamMsg, '');
        }

        // 解析上游返回
        $res = json_decode($response, true);

        // =========================
        // 8. 提取任务 ID
        // =========================

        // 上游创建成功后，返回 id、status=queued 等字段
        $task_id = $res['id'] ?? '';

        if (empty($task_id)) {
            return $this->result(500, '上游返回异常：未获取到任务ID', '');
        }

        // =========================
        // 9. 写入本地任务记录
        // =========================

        DB::table('users_create_log')->insert([
            'user_id'         => $user['id'],
            'user_input_json' => json_encode($r->post(), 320),
            'task_id'         => $task_id,
            'task_status'     => 0, // 0 = 进行中
            'consume_point'   => $price,
            'model'           => $model,
            'prompt'          => $r['prompt'],
            'create_time'     => time()
        ]);

        // =========================
        // 10. 冻结积分
        // =========================

        DB::table('users')->where('id', $user['id'])->update([
            'available_point' => $user['available_point'] - $price,
            'freeze_point'    => $user['freeze_point'] + $price
        ]);

        // =========================
        // 11. 返回给前端
        // =========================

        return $this->result(200, 'success', [
            // 返回任务ID，后续 detail 查询时继续使用
            'id'    => $task_id,

            // 初始状态统一按 pending 返回
            'state' => 'pending',

            // 创建任务时还没有最终视频地址
            'data'  => ''
        ]);
    }
}