<?php

namespace App\Http\Controllers\site\user;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;
use App\Models\Tool;
use Log;

class rechargeContrller extends Controller
{

    public function index(Request $r)
    {
        $uid = $r->header('uid');

        $where = "user_id = " . $uid . ' and is_pay = 1';
        $res['list'] = DB::table('order')
            ->whereRaw($where)
            ->orderBy('id', 'desc')
            ->offset(($r['page'] - 1) * $r['pagesize'])
            ->limit($r['pagesize'])
            ->get()->toArray();
        $res['total'] = DB::table('order')
            ->whereRaw($where)
            ->count();
        if ($res['list']) {
            foreach ($res['list'] as &$v) {
                $v['pay_time'] = Tool::time($v['pay_time']);
            }
        }

        return $this->result(2,'',$res);
    }
}
