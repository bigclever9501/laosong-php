<?php

namespace App\Http\Controllers\app\wanxiang;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;

class detailController extends Controller
{
    public function index(Request $r)
    {
        // 1. 兼容性接收参数：有些前端传 id，有些传 task_id，我们都接住
        $taskId = $r['task_id'] ?? $r['id'];

        if (empty($taskId)) {
            return $this->result(400, '缺少任务ID', '');
        }
        // ======== 【新增1：校验 API Key 防线】 ========
        $Authorization = $r->header('Authorization');
        if (empty($Authorization)) {
            return $this->result(400, '查单拒绝：未提供 API Key', '');
        }
        $user = DB::table('users')->where('api_key', $Authorization)->first();
        if (empty($user)) {
            return $this->result(400, '查单拒绝：无效的 API Key', '');
        }
        $user = (array)$user; // 转成数组方便后续使用
        // ==============================================

        // 2. 【核心】只读操作：去自家数据库查这条任务
        $info = DB::table('users_create_log')->where('task_id', $taskId)->first();

        // 没查到，说明任务不存在
        if (empty($info)) {
            return $this->result(400, '任务不存在或ID错误', '');
        }

        // 将对象强制转为数组，方便后续取值（防御性编程）
        $info = (array)$info; 
        // ======== 【新增2：防止越权偷窥防线】 ========
        // 必须是当前 API Key 对应的用户自己建的任务，才允许查询
        if ($info['user_id'] != $user['id']) {
            return $this->result(400, '越权访问：无权查看此任务', '');
        }
        // ==============================================

        // 3. 组装标准化的返回格式给 Coze / 前端
        $res = [
            'id' => $info['task_id'], // 任务号
        ];

        // 4. 根据本地数据库的状态，直接返回结果
        if ($info['task_status'] == 1) {
            // === 状态 1：已成功 ===
            $res['state'] = 'succeeded';
            // 妙处：我们在 notifyController 里已经提取了真实图片 URL 并存入了 res_url 字段！
            // 所以这里直接拿出来用就行，不需要再去解析复杂的 JSON 了。
            $res['data']  = $info['res_url']; 

        } elseif ($info['task_status'] == 2) {
            // === 状态 2：已失败 ===
            $res['state'] = 'error';
            $res['data']  = '';
            $res['error_msg'] = $info['error_msg'] ?? '阿里云生成失败，已退款';

        } elseif ($info['task_status'] == 0) {
            // === 状态 0：进行中 ===
            $res['state']  = 'pending';
            $res['data']   = '';
            $res['action'] = 'generate'; // 告诉前端继续等
        }

        // 5. 将结果包装好，发给外面
        return $this->result(200, 'success', $res);
    }
}