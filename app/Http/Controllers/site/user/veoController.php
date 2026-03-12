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

        // 这里用 model like 'veo%'，方便兼容多个 veo 模型
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
        // 4. 返回给前端
        // =========================

        return $this->result(2, '成功', [
            'list'  => $list,
            'count' => $count
        ]);
    }
}