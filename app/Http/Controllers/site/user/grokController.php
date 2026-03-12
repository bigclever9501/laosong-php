<?php

namespace App\Http\Controllers\site\user;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;

class grokController extends Controller
{
    public function index(Request $r)
    {
        // =========================
        // 1. 获取当前登录用户
        // =========================

        // 前端站点接口通常通过请求头里的 uid 标识当前用户
        $uid = $r->header('uid');

        // 如果没有 uid，直接返回错误
        if (empty($uid)) {
            return $this->result(-3, '获取用户信息失败', '');
        }

        // =========================
        // 2. 获取分页参数
        // =========================

        // 当前页，默认第 1 页
        $page = (int)($r['page'] ?? 1);

        // 每页条数，默认 10 条
        $limit = (int)($r['limit'] ?? 10);

        if ($page < 1) {
            $page = 1;
        }

        if ($limit < 1) {
            $limit = 10;
        }

        // 计算分页偏移量
        $offset = ($page - 1) * $limit;

        // =========================
        // 3. 查询 Grok 历史记录
        // =========================

        // 这里只查当前用户，并且模型名以 grok 开头的记录
        $query = DB::table('users_create_log')
            ->where('user_id', $uid)
            ->where('model', 'like', 'grok%');

        // 总条数
        $count = $query->count();

        // 分页列表
        $list = DB::table('users_create_log')
            ->where('user_id', $uid)
            ->where('model', 'like', 'grok%')
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