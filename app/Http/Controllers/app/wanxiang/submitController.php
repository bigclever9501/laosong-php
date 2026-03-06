<?php

namespace App\Http\Controllers\app\wanxiang;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;
use Log;

class submitController extends Controller
{
    public function index(Request $r)
    {
        // 1. 基础验证区
        if (empty($r['prompt']) || $r['prompt'] == '') {
            return $this->result(400, '提示词不能为空', '');
        }

        // 可以加上对 size 的验证 (wan2.6-t2i 支持自由尺寸，这里列几个常见的)
        if(!empty($r['size']) && !in_array($r['size'], ['1280*1280', '1104*1472', '1472*1104', '960*1696', '1696*960'])){
            return $this->result(400, '不支持的图片尺寸', '');
        }

        // 2. 身份鉴权区
        if (empty($r->header('Authorization'))) {
            return $this->result(400, '鉴权失败', '');
        }
        $Authorization = $r->header('Authorization');
        
        $user = DB::table('users')->where('api_key', $Authorization)->first();
        if (empty($user)) {
            return $this->result(400, 'API_KEY错误', '');
        }

        // 3. 计费与验资区 (暂定1次扣除1积分)
        $price = 1;
        if ($user['available_point'] < $price) {
            return $this->result(400, '可用点数不足', '');
        }

        // 4. 准备请求阿里云万相的参数
        $api_key = env('ALIYUN_DASHSCOPE_KEY'); 
        if (empty($api_key)) {
            return $this->result(500, '系统未配置阿里云密钥', '');
        }

        $url = 'https://dashscope.aliyuncs.com/api/v1/services/aigc/image-generation/generation';

        // 【修改点 1】模型名字改为 wan2.6-t2i，去掉多余的 parameters
        $data = [
            'model' => 'wan2.6-t2i', // 改为纯文生图模型
            'input' => [
                'messages' => [
                    [
                        'role' => 'user',
                        'content' => [
                            ['text' => $r['prompt']]
                        ]
                    ]
                ]
            ],
            'parameters' => [
                'size' => $r['size'] ?? '1280*1280', 
                'n' => 1,
                'watermark' => false
            ]
        ];

        $headers = [
            'Authorization: Bearer ' . $api_key,
            'Content-Type: application/json',
            'X-DashScope-Async: enable'
        ];

        // 5. 向上游发起请求
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch, CURLOPT_POST, true);
        curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($data, JSON_UNESCAPED_UNICODE));
        curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        // curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
        // curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, false);
        $response = curl_exec($ch);
        curl_close($ch);

        // 6. 处理结果与扣款
        $res = json_decode($response, true);

        if (!empty($res['output']['task_id'])) {
            $task_id = $res['output']['task_id'];

            // 【修改点 2】日志记录里的 model 也改为 wan2.6-t2i
            DB::table('users_create_log')->insert([
                'user_id'         => $user['id'],
                'user_input_json' => json_encode($r->post(), 320),
                'task_id'         => $task_id,
                'task_status'     => 0, 
                'consume_point'   => $price,
                'model'           => 'wan2.6-t2i', // 更新这里
                'prompt'          => $r['prompt'],
                'create_time'     => time()
            ]);

            DB::table('users')->where('id', $user['id'])->update([
                'available_point' => $user['available_point'] - $price,
                'freeze_point'    => $user['freeze_point'] + $price
            ]);
        } else {
            Log::error('万相生图下单失败: ' . $response);
        }

        return $res;
    }
}