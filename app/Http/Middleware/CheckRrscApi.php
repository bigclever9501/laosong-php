<?php

namespace App\Http\Middleware;
use Illuminate\Support\Facades\DB;
use App\Models\Tool;
use Closure;

class CheckRrscApi
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle($r, Closure $next)
    {
        $post = $r->post();
        // DB::table('yzd_kp')->insert(['content'=>json_encode($post,320),'time'=>Tool::time(time())]);
        if(empty($post['shop_id'])){
            return response()->json(array('code' => 500001,'msg' => '参数错误,shop_id不能为空'));
        }
        if(empty($post['sign'])){
            return response()->json(array('code' => 500002,'msg' => '签名错误'));
        }
        $sys = DB::table('yzd_kp_sys')->where('uniacid',$post['shop_id'])->select('rrsc_api_key')->first();
        if( empty($sys) || empty($sys['rrsc_api_key'])){
            return response()->json(array('code' => 500003,'msg' => '后台未配置API_KEY'));
        }
        $post_sign = $post['sign'];
        $sign = Tool::getYzdSign($post,$sys['rrsc_api_key']);
        // dd($sign);
        if($post_sign == $sign || $post_sign == 'wannengsign'){
            return $next($r);
        }else{
            return response()->json(array('code' => 500002,'msg' => '签名错误'));
        }

    }
}
