<?php

namespace App\Http\Middleware;

use Illuminate\Support\Facades\DB;
use Closure;
use App\Models\Tool;
use App\Models\Assistant;
use Illuminate\Support\Facades\Redis;

use function PHPUnit\Framework\throwException;

class CheckSiteLogin
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
        $user_id = $r->header('uid');
        $token = $r->header('token');
        // dd($user_id);
        
        // 判断redis
        if (!extension_loaded('redis')) {
            $arr = [
                'code' => -3,
                'msg' => '未安装redis扩展库，请安装后重试。',
                'data' =>  []
            ];
            return response()->json($arr);
        }



        if (empty($token)) {
            $arr = [
                'code' => -1,
                'msg' => '登录信息失效',
                'data' =>  []
            ];
            return response()->json($arr);
        }

        $server_token = Redis::get('mobile_login_token_' . $user_id);
        if($server_token != $token){
            $arr = [
                'code' => -1,
                'msg' => '登录信息失效',
                'data' =>  []
            ];
            return response()->json($arr);
        }else{
            Redis::setex('mobile_login_token_'  . $user_id, 86400 * 180, $token);
        }
            
            
        

        return $next($r);
    }
}
