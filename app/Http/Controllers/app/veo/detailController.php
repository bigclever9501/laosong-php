<?php

namespace App\Http\Controllers\app\veo;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;

class detailController extends Controller
{
    public function index(Request $r)
    {
        // =========================
        // 1. 获取任务ID
        // =========================

        $taskId = $r['id'] ?? $r['task_id'] ?? '';
        if (empty($taskId)) {
            return $this->result(400, '缺少任务ID', '');
        }

        // =========================
        // 2. 校验用户 API Key
        // =========================

        $Authorization = $r->header('Authorization');
        if (empty($Authorization)) {
            return $this->result(400, '查单拒绝：未提供 API Key', '');
        }

        $user = DB::table('users')->where('api_key', $Authorization)->first();
        if (empty($user)) {
            return $this->result(400, '查单拒绝：无效的 API Key', '');
        }
        $user = (array)$user;

        // =========================
        // 3. 查本地数据库
        // =========================

        $info = DB::table('users_create_log')->where('task_id', $taskId)->first();
        if (empty($info)) {
            return $this->result(400, '任务不存在', '');
        }
        $info = (array)$info;

        // 防止越权
        if ($info['user_id'] != $user['id']) {
            return $this->result(400, '越权访问：无权查看此任务', '');
        }

        // =========================
        // 4. 本地是进行中时，主动去问上游
        // =========================

        if ((int)$info['task_status'] == 0) {
            // 读取上游 API Key
            $apiConfig = (array)DB::table('api_config')->first();
            $yijia_key = $apiConfig['yijia_api_key'] ?? '';

            if (empty($yijia_key)) {
                return $this->result(500, '系统尚未配置 yijia_api_key', '');
            }

            // 通用视频任务查询接口
            $url = 'https://ai.yijiarj.cn/v1/videos/' . $taskId;

            $ch = curl_init();
            curl_setopt($ch, CURLOPT_URL, $url);
            curl_setopt($ch, CURLOPT_HTTPHEADER, [
                'Authorization: Bearer ' . $yijia_key,
                'Content-Type: application/json'
            ]);
            curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
            curl_setopt($ch, CURLOPT_TIMEOUT, 60);

            $response = curl_exec($ch);

            if (curl_errno($ch)) {
                $curlError = curl_error($ch);
                curl_close($ch);
                return $this->result(500, '查询上游任务失败：' . $curlError, '');
            }

            $httpCode = curl_getinfo($ch, CURLINFO_HTTP_CODE);
            curl_close($ch);

            if ($httpCode != 200) {
                $upstream = json_decode($response, true);
                $upstreamMsg = $upstream['error']['message'] ?? ('查询上游任务失败，HTTP状态码：' . $httpCode);
                return $this->result(500, $upstreamMsg, '');
            }

            $result = json_decode($response, true);

            // =========================
            // 5. 解析上游状态
            // =========================

            // 兼容多种状态字段写法
            $api_state = $result['status'] ?? ($result['data']['status'] ?? 'queued');

            // -------------------------
            // 情况 A：上游说完成了
            // -------------------------
            if (in_array($api_state, ['completed', 'succeeded', 'success'])) {

                // 兼容多种可能的视频链接字段
                $video_url = '';

                if (!empty($result['video_url'])) {
                    $video_url = $result['video_url'];
                } elseif (!empty($result['url'])) {
                    $video_url = $result['url'];
                } elseif (!empty($result['data']['video_url'])) {
                    $video_url = $result['data']['video_url'];
                } elseif (!empty($result['data']['url'])) {
                    $video_url = $result['data']['url'];
                } elseif (!empty($result['result']['video_url'])) {
                    $video_url = $result['result']['video_url'];
                } elseif (!empty($result['result']['url'])) {
                    $video_url = $result['result']['url'];
                } elseif (!empty($result['output']['video_url'])) {
                    $video_url = $result['output']['video_url'];
                } elseif (!empty($result['output']['url'])) {
                    $video_url = $result['output']['url'];
                }

                DB::transaction(function () use ($info, $user, $result, $video_url) {
                    // 更新订单为成功
                    DB::table('users_create_log')->where('id', $info['id'])->update([
                        'task_status' => 1,
                        'res_content' => json_encode($result, 320),
                        'res_url'     => $video_url,
                        'handle_time' => time()
                    ]);

                    // 扣除冻结积分，计入已消费
                    DB::table('users')->where('id', $user['id'])->update([
                        'used_point'   => $user['used_point'] + $info['consume_point'],
                        'freeze_point' => $user['freeze_point'] - $info['consume_point'],
                    ]);
                });
            }

            // -------------------------
            // 情况 B：上游说失败了
            // -------------------------
            elseif (in_array($api_state, ['failed', 'error', 'cancelled'])) {
                DB::transaction(function () use ($info, $user, $result, $api_state) {
                    DB::table('users_create_log')->where('id', $info['id'])->update([
                        'task_status' => 2,
                        'error_msg'   => $result['message']
                            ?? ($result['error']['message'] ?? ('上游任务失败，状态：' . $api_state)),
                        'res_content' => json_encode($result, 320),
                        'handle_time' => time()
                    ]);

                    // 退款
                    DB::table('users')->where('id', $user['id'])->update([
                        'available_point' => $user['available_point'] + $info['consume_point'],
                        'freeze_point'    => $user['freeze_point'] - $info['consume_point'],
                    ]);
                });
            }

            // 更新完后重新查一次数据库
            $info = (array)DB::table('users_create_log')->where('task_id', $taskId)->first();
        }

        // =========================
        // 6. 标准化输出给前端
        // =========================

        $res = [
            'id' => $info['task_id'],
        ];

        if ((int)$info['task_status'] == 1) {
            $res['state'] = 'succeeded';

            // 先取数据库里已经存好的结果链接
            $video_url = $info['res_url'] ?? '';

            // 如果 res_url 为空，说明可能是旧代码只写了 res_content，没写 res_url
            if (empty($video_url) && !empty($info['res_content'])) {
                $savedResult = json_decode($info['res_content'], true);

                if (!empty($savedResult['video_url'])) {
                    $video_url = $savedResult['video_url'];
                } elseif (!empty($savedResult['url'])) {
                    $video_url = $savedResult['url'];
                } elseif (!empty($savedResult['data']['video_url'])) {
                    $video_url = $savedResult['data']['video_url'];
                } elseif (!empty($savedResult['data']['url'])) {
                    $video_url = $savedResult['data']['url'];
                } elseif (!empty($savedResult['result']['video_url'])) {
                    $video_url = $savedResult['result']['video_url'];
                } elseif (!empty($savedResult['result']['url'])) {
                    $video_url = $savedResult['result']['url'];
                } elseif (!empty($savedResult['output']['video_url'])) {
                    $video_url = $savedResult['output']['video_url'];
                } elseif (!empty($savedResult['output']['url'])) {
                    $video_url = $savedResult['output']['url'];
                }

                // 如果成功解析到了链接，顺手把数据库补齐
                if (!empty($video_url)) {
                    DB::table('users_create_log')->where('id', $info['id'])->update([
                        'res_url' => $video_url
                    ]);
                }
            }

            $res['data'] = $video_url;
        } elseif ((int)$info['task_status'] == 2) {
            $res['state'] = 'error';
            $res['data']  = '';
            $res['error_msg'] = $info['error_msg'] ?? '生成失败';
        } else {
            $res['state'] = 'pending';
            $res['data']  = '';
        }

        return $this->result(200, 'success', $res);
    }
}