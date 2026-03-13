<?php

namespace App\Http\Controllers\site\user;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;

class veoController extends Controller
{
    public function index(Request $r)
    {
        // =========================
        // 1. 获取当前登录用户
        // =========================
        $uid = $r->header('uid');
        if (empty($uid)) {
            return $this->result(-3, '获取用户信息失败', '');
        }

        // =========================
        // 2. 分页参数
        // =========================
        $page = (int)($r['page'] ?? 1);
        $limit = (int)($r['limit'] ?? 10);

        if ($page < 1) {
            $page = 1;
        }

        if ($limit < 1) {
            $limit = 10;
        }

        $offset = ($page - 1) * $limit;

        // =========================
        // 3. 查询 veo 历史记录
        // =========================
        $query = DB::table('users_create_log')
            ->where('user_id', $uid)
            ->where('model', 'like', 'veo%');
        
        $count = $query->count();

        $list = DB::table('users_create_log')
            ->where('user_id', $uid)
            ->where('model', 'like', 'veo%')
            ->orderBy('id', 'desc')
            ->offset($offset)
            ->limit($limit)
            ->get();

        // =========================
        // 4. 获取每个任务的上游状态
        // =========================
        foreach ($list as $task) {
            $taskId = $task->task_id;

            // 上游任务查询的URL
            $url = 'https://api.yourapi.com/v1/videos/' . $taskId;

            $ch = curl_init();
            curl_setopt($ch, CURLOPT_URL, $url);
            curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
            curl_setopt($ch, CURLOPT_TIMEOUT, 60);

            $response = curl_exec($ch);
            curl_close($ch);

            if ($response) {
                $result = json_decode($response, true);
                // 获取完成时间
                $completedAt = $result['completed_at'] ?? null;

                if ($completedAt) {
                    // 如果上游返回了完成时间，则更新数据库中的任务完成时间
                    DB::table('users_create_log')
                        ->where('task_id', $taskId)
                        ->update(['handle_time' => strtotime($completedAt)]);
                }
            }
        }

        // =========================
        // 5. 返回给前端
        // =========================
        return $this->result(2, '成功', [
            'list'  => $list,
            'count' => $count
        ]);
    }
}