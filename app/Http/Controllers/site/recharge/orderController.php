<?php

namespace App\Http\Controllers\site\recharge;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;
use App\Models\Tool;
use App\Models\Pay;
use Log;

class orderController extends Controller
{

    public function submitRechargeOrder(Request $r)
    {
        $recharge_sku = DB::table('recharge_sku')->where('id',$r['recharge_id'])->first();
        if(empty($recharge_sku)){
            return $this->result(-3,'规格不存在','');
        }
        if($r['pay_type'] != 1 && $r['pay_type'] != 2){
            return $this->result(-3,'支付方式选择错误','');
        }
        $user_id = $r->header('uid');
        $code = 'RO'.date("YmdHi") . Tool::GetRandStr(5).substr($user_id,-1);//订单号

        $data['user_id'] = $user_id;
        $data['ordercode'] = $code;
        $data['out_trade_no'] = $code;
        $data['price'] = $recharge_sku['price'];
        $data['points'] = $recharge_sku['points'];
        $data['submit_time'] = time();
        $data['pay_type'] = $r['pay_type'];
        $order_id = DB::table('order')->insertGetId($data);

        $res = Pay::pay($r['pay_type'],1,$order_id);

        return $this->result(2,'',$res);
    }

    public function getOrderStatus(Request $r){

        $order = DB::table('order')->where('out_trade_no',$r['out_trade_no'])->select('is_pay')->first();
        return $this->result(2,'',$order);

    }

}
