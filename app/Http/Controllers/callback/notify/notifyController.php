<?php

namespace App\Http\Controllers\callback\notify;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;
use Log;

class notifyController extends Controller
{
    /**
     * 万相回调处理
     */
    public function wanxiang(Request $r)
    {
        // 读取原始请求内容，方便记录日志排查问题
        $raw = file_get_contents("php://input");
        Log::info('【万相回调原始数据】' . $raw);

        // 把回调内容转成数组
        $notifyData = json_decode($raw, true);

        // 如果回调数据为空，直接返回
        if (empty($notifyData)) {
            Log::info('【万相回调】回调数据为空');
            return response('fail');
        }

        // 获取任务ID
        $task_id = $notifyData['output']['task_id'] ?? '';
        if (empty($task_id)) {
            Log::info('【万相回调】task_id 为空');
            return response('fail');
        }

        // 查询本地任务记录
        $log = DB::table('users_create_log')->where('task_id', $task_id)->first();
        if (empty($log)) {
            Log::info('【万相回调】本地未找到任务：' . $task_id);
            return response('fail');
        }
        $log = (array)$log;

        // 如果任务已经处理过了，就不重复处理
        if ((int)$log['task_status'] !== 0) {
            Log::info('【万相回调】任务已处理，无需重复处理：' . $task_id);
            return response('success');
        }

        // 查询用户信息，后面成功/失败时要更新积分
        $user = DB::table('users')->where('id', $log['user_id'])->first();
        if (empty($user)) {
            Log::info('【万相回调】未找到用户信息，user_id：' . $log['user_id']);
            return response('fail');
        }
        $user = (array)$user;

        // 再向阿里云查询一次任务状态，拿最终结果
        $api_result = $this->queryAliyunTask($task_id);

        Log::info('【万相回调】阿里云查询结果：' . json_encode($api_result, JSON_UNESCAPED_UNICODE));

        // 如果阿里云返回成功，并且任务状态为 SUCCEEDED
        if (
            !empty($api_result) &&
            isset($api_result['output']['task_status']) &&
            $api_result['output']['task_status'] === 'SUCCEEDED'
        ) {
            // 取最终图片地址
            $res_url = $api_result['output']['results'][0]['url'] ?? '';

            // 开启事务，保证数据库一致性
            DB::transaction(function () use ($log, $user, $res_url, $api_result) {
                // 更新任务状态为成功
                DB::table('users_create_log')->where('task_id', $log['task_id'])->update([
                    'task_status' => 1,
                    'res_url'     => $res_url,
                    'res_content' => json_encode($api_result, JSON_UNESCAPED_UNICODE),
                    'handle_time' => time()
                ]);

                // 扣除冻结积分，增加已使用积分
                DB::table('users')->where('id', $user['id'])->update([
                    'used_point'   => $user['used_point'] + $log['consume_point'],
                    'freeze_point' => $user['freeze_point'] - $log['consume_point']
                ]);
            });

            Log::info('【万相回调】任务成功处理完成：' . $log['task_id']);
            return response('success');
        }

        // 如果没有成功，则按失败处理
        DB::transaction(function () use ($log, $user, $api_result) {
            // 获取失败原因
            $error_msg = $api_result['output']['message'] ?? '阿里云生成失败';

            // 更新任务状态为失败
            DB::table('users_create_log')->where('task_id', $log['task_id'])->update([
                'task_status' => 2,
                'error_msg'   => $error_msg,
                'res_content' => json_encode($api_result, JSON_UNESCAPED_UNICODE),
                'handle_time' => time()
            ]);

            // 退款：冻结积分退回可用积分
            DB::table('users')->where('id', $user['id'])->update([
                'available_point' => $user['available_point'] + $log['consume_point'],
                'freeze_point'    => $user['freeze_point'] - $log['consume_point']
            ]);
        });

        Log::info('【万相回调】任务失败处理完成：' . $log['task_id']);
        return response('success');
    }

    /**
     * 查询阿里云任务状态
     * 这里统一从 api_config 表中读取 aliyun_api_key
     */
    private function queryAliyunTask($task_id)
    {
        // =========================
        // 1. 从数据库读取阿里云 API KEY
        // =========================
        $apiConfig = DB::table('api_config')->first();

        // 如果配置表为空，直接返回错误
        if (empty($apiConfig)) {
            return [
                'output' => [
                    'message' => '未找到 api_config 配置表数据'
                ]
            ];
        }

        $apiConfig = (array)$apiConfig;
        $api_key = $apiConfig['aliyun_api_key'] ?? '';

        // 如果数据库里没有配置阿里云 key，直接返回错误
        if (empty($api_key)) {
            return [
                'output' => [
                    'message' => 'api_config 表中未配置 aliyun_api_key'
                ]
            ];
        }

        // =========================
        // 2. 拼接阿里云查询地址
        // =========================
        $url = 'https://dashscope.aliyuncs.com/api/v1/tasks/' . $task_id;

        // 请求头
        $headers = [
            'Authorization: Bearer ' . $api_key,
            'Content-Type: application/json'
        ];

        // =========================
        // 3. 发起 CURL 查询
        // =========================
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($ch, CURLOPT_TIMEOUT, 60);

        $response = curl_exec($ch);

        // 如果 CURL 报错，返回错误信息
        if (curl_errno($ch)) {
            $curlError = curl_error($ch);
            curl_close($ch);

            return [
                'output' => [
                    'message' => '查询阿里云任务失败：' . $curlError
                ]
            ];
        }

        curl_close($ch);

        // =========================
        // 4. 解析返回结果
        // =========================
        $result = json_decode($response, true);

        // 如果解析失败，返回原始响应内容
        if (empty($result)) {
            return [
                'output' => [
                    'message' => '阿里云返回结果解析失败',
                    'raw'     => $response
                ]
            ];
        }

        return $result;
    }
}