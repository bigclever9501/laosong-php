<?php

namespace App\Http\Controllers\app\grok;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;
use Log;

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

        // 只允许这两个模型，防止前端乱传模型名
        $allowModels = [
            'grok-imagine-1.0-video',
            'grok-imagine-1.0-video-super'
        ];

        // 如果传入的模型不在允许范围内，直接报错
        if (!in_array($r['model'], $allowModels)) {
            return $this->result(400, '模型参数错误', '');
        }

        // =========================
        // 3. 视频参数校验
        // =========================

        // 允许的分辨率
        $allowResolutions = ['480p', '720p'];
        $resolution = $r['resolution'] ?? '480p';

        if (!in_array($resolution, $allowResolutions)) {
            return $this->result(400, 'resolution 只允许传 480p 或 720p', '');
        }

        // 允许的时长
        $allowDurations = [6, 10, 15];
        $duration = (int)($r['duration'] ?? 5);

        if (!in_array($duration, $allowDurations)) {
            return $this->result(400, 'duration 只允许传 5、10、15', '');
        }

        // 允许的画幅比例
        $allowRatios = ['16:9', '9:16', '1:1', '4:3', '3:4'];
        $ratio = $r['ratio'] ?? '16:9';

        if (!in_array($ratio, $allowRatios)) {
            return $this->result(400, 'ratio 参数错误', '');
        }
        // 允许的视频风格
        $allowPresets = ['fun', 'normal', 'spicy', 'custom'];

        // 默认风格为 normal
        $preset = $r['preset'] ?? 'normal';

        // 校验 preset 是否合法
        if (!in_array($preset, $allowPresets)) {
            return $this->result(400, 'preset 参数错误，只允许 fun、normal、spicy、custom', '');
        }
        // 普通模型限制：只允许 480p + 6秒
        if ($r['model'] != 'grok-imagine-1.0-video-super') {
            if ($resolution == '720p' || in_array($duration, [10, 15])) {
                return $this->result(400, '当前模型只支持 480p 且时长为 6 秒，请改用 grok-imagine-1.0-video-super', '');
            }
        }

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

        // 按模型区分价格：普通模型 0.5 点，高级模型 1 点
        if ($r['model'] == 'grok-imagine-1.0-video-super') {
            $price = 1.00;
        } else {
            $price = 0.50;
        }

        // 判断用户可用积分是否足够
        if ($user['available_point'] < $price) {
            return $this->result(400, '可用点数不足', '');
        }

        // =========================
        // 6. 读取系统配置中的上游 API KEY
        // =========================

        $apiConfig = (array)DB::table('api_config')->first();
        $yijia_key = $apiConfig['yijia_api_key'] ?? '';

        if (empty($yijia_key)) {
            return $this->result(500, '系统尚未配置 yijia_api_key', '');
        }

        // =========================
        // 7. 先在本地生成一个任务ID，方便记录数据库
        // =========================

        // 因为这个上游接口不是先返回 task_id，再 detail 查询
        // 所以我们自己先生成一个本地 task_id，作为订单号
        $localTaskId = md5(uniqid('grok_', true));

        // =========================
        // 8. 先写入一条“进行中”的生成记录
        // =========================

        DB::table('users_create_log')->insert([
            'user_id'         => $user['id'],
            'user_input_json' => json_encode($r->post(), 320),
            'task_id'         => $localTaskId,
            'task_status'     => 0, // 0 = 进行中
            'consume_point'   => $price,
            'model'           => $r['model'],
            'prompt'          => $r['prompt'],
            'create_time'     => time()
        ]);

        // 先冻结积分：可用积分减少，冻结积分增加
        DB::table('users')->where('id', $user['id'])->update([
            'available_point' => $user['available_point'] - $price,
            'freeze_point'    => $user['freeze_point'] + $price
        ]);

        // =========================
        // 9. 组装请求参数，发给上游 Grok 视频接口
        // =========================

        // 上游接口地址
        $url = 'https://apius.yijiarj.cn/v1/chat/completions';

        // 组装 messages
        // 按上游文档结构，content 使用对象数组
        $messages = [
            [
                'role'    => 'user',
                'content' => [
                    [
                        'type' => 'text',
                        'text' => $r['prompt']
                    ]
                ]
            ]
        ];

        // 组装 video_config
        // 按上游文档字段名来传
        $video_config = [
            // 视频时长
            'video_length'    => (string)$duration,

            // 画幅比例
            'aspect_ratio'    => $ratio,

            // 风格预设，使用前面校验后的值
            'preset'          => $preset,
            // 分辨率
            'resolution_name' => $resolution
        ];

        // 完整请求体
        $data = [
            'model'        => $r['model'],
            'messages'     => $messages,
            'video_config' => $video_config,
            'stream'       => true
        ];

        // 请求头
        $headers = [
            'Authorization: Bearer ' . $yijia_key,
            'Content-Type: application/json',
            'Accept: text/event-stream'
        ];

        // =========================
        // 10. 发起 CURL 请求，拿到 SSE 原始响应
        // =========================

        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch, CURLOPT_POST, true);
        curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($data, JSON_UNESCAPED_UNICODE));
        curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);

        // 超时时间适当放长，因为视频生成本身较慢
        curl_setopt($ch, CURLOPT_TIMEOUT, 180);

        $response = curl_exec($ch);

        // 获取上游返回的 HTTP 状态码
        $httpCode = curl_getinfo($ch, CURLINFO_HTTP_CODE);

        // 如果 CURL 本身报错，直接走失败退款逻辑
        if (curl_errno($ch)) {
            $curlError = curl_error($ch);
            curl_close($ch);

            DB::transaction(function () use ($user, $price, $localTaskId) {
                // 更新订单状态为失败
                DB::table('users_create_log')->where('task_id', $localTaskId)->update([
                    'task_status' => 2,
                    'handle_time' => time()
                ]);

                // 退款：把冻结积分退回可用积分
                DB::table('users')->where('id', $user['id'])->update([
                    'available_point' => $user['available_point'] + $price,
                    'freeze_point'    => $user['freeze_point'] - $price
                ]);
            });

            return $this->result(500, '上游请求失败：' . $curlError, '');
        }

        // 如果上游接口返回的 HTTP 状态码不是 200，也按失败处理
        if ($httpCode != 200) {
            curl_close($ch);

            DB::transaction(function () use ($user, $price, $localTaskId, $response) {
                // 更新任务状态为失败
                DB::table('users_create_log')->where('task_id', $localTaskId)->update([
                    'task_status' => 2,
                    'res_content' => $response,
                    'handle_time' => time()
                ]);

                // 退款：把冻结积分退回可用积分
                DB::table('users')->where('id', $user['id'])->update([
                    'available_point' => $user['available_point'] + $price,
                    'freeze_point'    => $user['freeze_point'] - $price
                ]);
            });

            return $this->result(500, '上游接口返回异常，HTTP状态码：' . $httpCode, [
                'http_code' => $httpCode,
                'upstream_response' => $response,
                'request_data' => $data
            ]);
        }

        curl_close($ch);

        // =========================
        // 11. 解析 SSE 流，提取最终视频地址
        // =========================

        $lines = explode("\n", $response);

        // 用来保存最终视频地址
        $videoUrl = '';

        // 用来保存解析出来的所有片段，方便后续排查问题
        $allChunks = [];

        foreach ($lines as $line) {
            $line = trim($line);

            // 只处理 data: 开头的行
            if (strpos($line, 'data: ') !== 0) {
                continue;
            }

            // 去掉前缀 data:
            $payload = substr($line, 6);

            // 跳过结束标记
            if ($payload === '[DONE]') {
                continue;
            }

            // 尝试把 JSON 解码
            $json = json_decode($payload, true);

            if (!empty($json)) {
                $allChunks[] = $json;

                // 按照 SSE 常见结构，去取 delta.content
                $content = $json['choices'][0]['delta']['content'] ?? '';

                // 如果 content 里面出现链接，就提取出来
                if ($content && preg_match('/https?:\/\/[^\s"\']+/i', $content, $m)) {
                    $videoUrl = $m[0];
                }
            }
        }

        // =========================
        // 12. 根据是否拿到视频地址，决定成功还是失败
        // =========================

        if (!empty($videoUrl)) {

            // 成功：更新订单、扣除冻结积分、计入已消费积分
            DB::transaction(function () use ($user, $price, $localTaskId, $videoUrl, $response) {
                // 更新任务状态为成功
                DB::table('users_create_log')->where('task_id', $localTaskId)->update([
                    'task_status' => 1,
                    'res_content' => $response,
                    'res_url'     => $videoUrl,
                    'handle_time' => time()
                ]);

                // 真正扣费：冻结积分扣掉，已使用积分增加
                DB::table('users')->where('id', $user['id'])->update([
                    'used_point'   => $user['used_point'] + $price,
                    'freeze_point' => $user['freeze_point'] - $price
                ]);
            });

            // 返回给前端
            return $this->result(200, 'success', [
                'id'    => $localTaskId,
                'state' => 'succeeded',
                'data'  => $videoUrl
            ]);
        } else {

            // 失败：更新订单状态，并退款
            DB::transaction(function () use ($user, $price, $localTaskId, $response) {
                // 更新任务状态为失败
                DB::table('users_create_log')->where('task_id', $localTaskId)->update([
                    'task_status' => 2,
                    'res_content' => $response,
                    'handle_time' => time()
                ]);

                // 退款：冻结积分退回可用积分
                DB::table('users')->where('id', $user['id'])->update([
                    'available_point' => $user['available_point'] + $price,
                    'freeze_point'    => $user['freeze_point'] - $price
                ]);
            });

            return $this->result(500, '生成失败：未解析到视频链接', '');
        }
    }
}
