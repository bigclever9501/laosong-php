<?php

namespace App\Http\Controllers\site\user;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;
use App\Models\Tool;
use Log;

class soraContrller extends Controller
{

    // sora 列表
    public function index(Request $r)
    {
        $uid = $r->header('uid');

        $where = "user_id = " . $uid;
        // if ($r['keyword']) {
        //     $where .= " and title LIKE  concat('%','" . $r['keyword'] . "','%')";
        // }
        $res['list'] = DB::table('users_create_log')
            ->whereRaw($where)
            ->orderBy('id', 'desc')
            ->offset(($r['page'] - 1) * $r['pagesize'])
            ->limit($r['pagesize'])
            ->get()->toArray();
        $res['total'] = DB::table('users_create_log')
            ->whereRaw($where)
            ->count();
        if ($res['list']) {
            foreach ($res['list'] as &$v) {
                $v['create_time'] = Tool::time($v['create_time']);
                $v['handle_time'] = $v['handle_time'] ? Tool::time($v['handle_time']) : '';
            }
        }

        return $this->result(2,'',$res);
    }
}