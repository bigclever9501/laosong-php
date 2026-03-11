<?php
namespace App\Http\Controllers\app\nanobanana;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;
use Log;

class detailController extends Controller
{
    public function index(Request $r)
    {
        $taskId = $r['task_id'] ?? $r['id'];
        if (empty($taskId)) {
            return $this->result(400, '缺少任务ID', '');
        }

        // 1. 【防盗门】校验用户 API Key [cite: 729-738]
        $Authorization = $r->header('Authorization');
        if (empty($Authorization)) {
            return $this->result(400, '查单拒绝：未提供 API Key', '');
        } 
        $user = DB::table('users')->where('api_key', $Authorization)->first();
        if (empty($user)) {
            return $this->result(400, '查单拒绝：无效的 API Key', '');
        }
        $user = (array)$user;

        // 2. 查本地数据库
        $info = DB::table('users_create_log')->where('task_id', $taskId)->first();
        if (empty($info)) {
            return $this->result(400, '任务不存在', '');
        }
        $info = (array)$info;

        // 【防盗门】防止越权 [cite: 744-748]
        if ($info['user_id'] != $user['id']) {
            return $this->result(400, '越权访问：无权查看此任务', '');
        }

        // 3. 核心业务逻辑：本地是进行中，需要【主动去问多米】
        if ($info['task_status'] == 0) {
            
            // 从专属密码表读取多米密钥
            $apiConfig = (array)DB::table('api_config')->first();
            $duomi_key = $apiConfig['duomi_api_key'] ?? '';

            // 根据 YAML 文档发起 GET 查询请求
            $url = 'https://duomiapi.com/api/gemini/nano-banana/' . $taskId;

            $ch = curl_init();
            curl_setopt($ch, CURLOPT_URL, $url);
            curl_setopt($ch, CURLOPT_HTTPHEADER, ['Authorization: ' . $duomi_key]);
            curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
            $response = curl_exec($ch);
            curl_close($ch);

            $result = json_decode($response, true);
            // 提取多米返回的 state 字段 (pending, running, succeeded, error)
            $api_state = $result['data']['state'] ?? 'pending';

            // 情况 A：多米说成功了！
            if ($api_state == 'succeeded') {
                // 根据多米 YAML 文档提取图片，层级为：data -> data -> images -> -> url
                // 【修改这里】：加上 取第一张图，并且做个双重保险防报错
                $img_url = '';
                if (!empty($result['data']['data']['images'][0]['url'])) {
                    $img_url = $result['data']['data']['images'][0]['url'];
                } elseif (!empty($result['data']['images'][0]['url'])) {
                    $img_url = $result['data']['images'][0]['url'];
                }

                DB::transaction(function () use ($info, $user, $result, $img_url) {
                    // 更新订单为成功
                    DB::table('users_create_log')->where('id', $info['id'])->update([
                        'task_status' => 1,
                        'res_content' => json_encode($result, 320),
                        'res_url'     => $img_url,
                        'handle_time' => time()
                    ]);
                    // 扣除冻结款，记为已消费
                    DB::table('users')->where('id', $user['id'])->update([
                        'used_point'   => $user['used_point'] + $info['consume_point'],
                        'freeze_point' => $user['freeze_point'] - $info['consume_point'],
                    ]);
                });
            }
            // 情况 B：多米说失败了！
            elseif ($api_state == 'error') {
                DB::transaction(function () use ($info, $user, $result) {
                    // 更新为失败并记录原因
                    DB::table('users_create_log')->where('id', $info['id'])->update([
                        'task_status' => 2,
                        'error_msg'   => $result['data']['msg'] ?? '上游生成失败',
                        'handle_time' => time()
                    ]);
                    // 退款！解冻积分，退回可用余额
                    DB::table('users')->where('id', $user['id'])->update([
                        'available_point' => $user['available_point'] + $info['consume_point'],
                        'freeze_point'    => $user['freeze_point'] - $info['consume_point'],
                    ]);
                });
            }

            // 更新完之后，重新查一次数据库拿最新状态，准备返回给前端
            $info = (array)DB::table('users_create_log')->where('task_id', $taskId)->first();
        }

        // 4. 标准化输出给 Coze / 前端 (返回一层平铺的干净数据)
        $res = [
            'id' => $info['task_id'],
        ];

        if ($info['task_status'] == 1) {
            $res['state'] = 'succeeded';
            $res['data']  = $info['res_url']; // 直接从自家数据库拿图片
        } elseif ($info['task_status'] == 2) {
            $res['state'] = 'error';
            $res['data']  = '';
            $res['error_msg'] = $info['error_msg'] ?? '生成失败';
        } else {
            $res['state']  = 'pending';
            $res['data']   = '';
        }

        return $this->result(200, 'success', $res);
    }
}