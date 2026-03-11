<?php
namespace App\Http\Controllers\app\nanobanana;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;
use Log;

class submitController extends Controller
{
    public function index(Request $r)
    {
        // 1. 基础验证区 (严格按照 YAML 必填项)
        if (empty($r['prompt'])) {
            return $this->result(400, '提示词不能为空', '');
        }
        if (empty($r['model'])) {
            return $this->result(400, '必须指定模型名称', '');
        }

        // 2. 身份鉴权区 (验证用户的 API Key)
        $Authorization = $r->header('Authorization');
        if (empty($Authorization)) {
            return $this->result(400, '鉴权失败，请提供 API Key', '');
        }
        $user = DB::table('users')->where('api_key', $Authorization)->first();
        if (empty($user)) {
            return $this->result(400, 'API_KEY 错误', '');
        }
        $user = (array)$user;

        // 3. 计费与验资区 (暂定每次 0.5 个积分，可自己改)
        $price = 0.5;
        if ($user['available_point'] < $price) {
            return $this->result(400, '可用点数不足', '');
        }

        // 4. 【核心改动：从专属密码表读取多米密钥】
        $apiConfig = (array)DB::table('api_config')->first();
        $duomi_key = $apiConfig['duomi_api_key'] ?? '';
        if (empty($duomi_key) || $duomi_key == '这里替换成你真实的多米API_KEY') {
            return $this->result(500, '系统尚未配置多米API_KEY', '');
        }

        // 5. 准备向上游多米发请求
        $url = 'https://duomiapi.com/api/gemini/nano-banana';

        // 组装参数 (支持模型、提示词、比例、分辨率)
        $data = [
            'model' => $r['model'],
            'prompt' => $r['prompt'],
            'aspect_ratio' => $r['aspect_ratio'] ?? 'auto'
        ];
        // 仅 gemini-3-pro-image-preview 支持 image_size
        if (!empty($r['image_size']) && $r['model'] == 'gemini-3-pro-image-preview') {
            $data['image_size'] = $r['image_size'];
        }

        $headers = [
            'Authorization: ' . $duomi_key,
            'Content-Type: application/json'
        ];

        // 6. 发起 CURL 请求
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch, CURLOPT_POST, true);
        curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($data, JSON_UNESCAPED_UNICODE));
        curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        $response = curl_exec($ch);
        curl_close($ch);

        $res = json_decode($response, true);

        // 7. 核心逻辑：记录数据库 + 资金冻结
        // 根据 YAML 文档，成功时多米通常在 data 里返回数据
        $task_id = $res['data']['task_id'] ?? ($res['task_id'] ?? '');

        if (!empty($task_id)) {
            DB::table('users_create_log')->insert([
                'user_id'         => $user['id'],
                'user_input_json' => json_encode($r->post(), 320),
                'task_id'         => $task_id,
                'task_status'     => 0, // 0 表示排队中
                'consume_point'   => $price,
                'model'           => $r['model'], 
                'prompt'          => $r['prompt'],
                'create_time'     => time()
            ]);

            // 扣除可用积分，增加冻结积分
            DB::table('users')->where('id', $user['id'])->update([
                'available_point' => $user['available_point'] - $price,
                'freeze_point'    => $user['freeze_point'] + $price
            ]);
        } else {
            Log::error('Nano Banana 下单失败: ' . $response);
        }

        // 把多米的原样返回给 Coze/前端
        return $res;
    }
}