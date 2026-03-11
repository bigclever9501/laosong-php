<?php

namespace App\Http\Controllers\app\grok;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;

class detailController extends Controller
{
    public function index(Request $r)
    {
        // =========================
        // 1. 用户身份鉴权
        // =========================

        // 从请求头中获取 Authorization
        $Authorization = $r->header('Authorization');

        // 如果没有传 API Key，直接返回错误
        if (empty($Authorization)) {
            return $this->result(400, '鉴权失败，请提供 API Key', '');
        }

        // 根据 API Key 查询用户信息
        $user = DB::table('users')->where('api_key', $Authorization)->first();

        // 如果没有查到用户，说明 API Key 不正确
        if (empty($user)) {
            return $this->result(400, 'API_KEY 错误', '');
        }

        // 把对象转成数组，方便后面使用
        $user = (array)$user;

        // =========================
        // 2. 获取任务 ID
        // =========================

        // 兼容两种传法：
        // 1）前端传 id
        // 2）前端传 task_id
        $taskId = $r['id'] ?? $r['task_id'] ?? '';

        // 如果任务 ID 为空，直接返回错误
        if (empty($taskId)) {
            return $this->result(400, '任务ID不能为空', '');
        }

        // =========================
        // 3. 查询本地数据库中的任务记录
        // =========================

        // 只查询当前用户自己的任务，避免越权查看别人的生成结果
        $log = DB::table('users_create_log')
            ->where('task_id', $taskId)
            ->where('user_id', $user['id'])
            ->first();

        // 如果没有找到任务记录，返回任务不存在
        if (empty($log)) {
            return $this->result(404, '任务不存在', '');
        }

        // 把对象转成数组，方便后面读取字段
        $log = (array)$log;

        // =========================
        // 4. 根据任务状态返回不同结果
        // =========================

        // 状态 0：处理中
        if ((int)$log['task_status'] === 0) {
            return $this->result(200, '处理中', [
                // 任务 ID，前端后续轮询时继续用这个 ID
                'id'    => $log['task_id'],

                // 当前状态：处理中
                'state' => 'processing',

                // 处理中时先不返回视频地址
                'data'  => ''
            ]);
        }

        // 状态 1：生成成功
        if ((int)$log['task_status'] === 1) {
            return $this->result(200, 'success', [
                // 任务 ID
                'id'    => $log['task_id'],

                // 当前状态：成功
                'state' => 'succeeded',

                // 返回最终视频地址
                'data'  => !empty($log['res_url']) ? $log['res_url'] : ''
            ]);
        }

        // 状态 2：生成失败
        if ((int)$log['task_status'] === 2) {
            return $this->result(200, '生成失败', [
                // 任务 ID
                'id'    => $log['task_id'],

                // 当前状态：失败
                'state' => 'failed',

                // 失败时没有视频地址
                'data'  => ''
            ]);
        }

        // =========================
        // 5. 兜底返回
        // =========================

        // 如果任务状态不是 0/1/2，返回未知状态
        return $this->result(200, '未知状态', [
            // 任务 ID
            'id'    => $log['task_id'],

            // 当前状态：未知
            'state' => 'unknown',

            // 没有可返回的数据
            'data'  => ''
        ]);
    }
}