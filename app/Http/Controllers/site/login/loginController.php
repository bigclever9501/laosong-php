<?php

namespace App\Http\Controllers\site\login;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;
use App\Models\Tool;
use App\Models\Message;
use Illuminate\Support\Facades\Redis;
use Log;

class loginController extends Controller
{

    public function index(Request $r)
    {
        // 检验手机号和验证码
        if(empty($r['phone'])){
            return $this->result(-3,'手机号不能为空','');
        }
        if(preg_match('/^1\d{10}$/', (string)$r['phone']) != 1){
            return $this->result(-3,'手机号格式错误','');
        }
        if(empty($r['yzm_code'])){
            return $this->result(-3,'验证码不能为空','');
        }
        $yzm_code = Redis::get('mobile_code_' . $r['phone']);
        if($yzm_code != $r['yzm_code']){
            return $this->result(-3,'验证码错误或验证码已过期','');
        }

        // 判断登录还是注册
        $phone = $r['phone'];
        $user = DB::table('users')->where('phone',$phone)->select('id','phone','reg_time','api_key','nickName')->first();
        if(empty($user)){
            DB::table('users')->insert([
                'phone'=>$phone,
                'salt'=>rand(100000, 999999),
                'reg_time'=>time(),
                'last_login_time'=>time(),
                'api_key'=>self::generateSecureApiKey(),
                'nickName'=>'用户_' . rand(100000, 999999)
            ]);
            $user = DB::table('users')->where('phone',$phone)->select('id','phone','reg_time','api_key','nickName')->first();
        }else{
            DB::table('users')->where('id',$user['id'])->update([
                'last_login_time'=>time()
            ]);
        }
        $user['token'] = self::getUserToken($user['id']);
        return $this->result(1,'登录成功',$user);
    }

    // 用户信息
    public function userInfo(Request $r){
        $user = DB::table('users')->where('id',$r->header('uid'))->select('id','phone','reg_time','api_key','nickName','available_point','freeze_point','used_point')->first();
        if(!empty($user)){
            DB::table('users')->where('id',$r->header('uid'))->update([
                'last_login_time'=>time()
            ]);
            $user['reg_time'] = Tool::time2($user['reg_time']);
        }
        return $this->result(2,'成功',$user);
    }

    // 发送验证码
    public function sendCode(Request $r)
    {
        if(empty($r['phone'])){
            return $this->result(-3,'手机号不能为空','');
        }
        if(preg_match('/^1\d{10}$/', (string)$r['phone']) != 1){
            return $this->result(-3,'手机号格式错误','');
        }
        $yzd_code =  rand(100000, 999999);
        Redis::setex('mobile_code_' . $r['phone'], 300, $yzd_code);
        $data['code'] = $yzd_code;
        $res = Message::sendMessage($r['phone'],$data,'code');
        return $this->result(1,'发送验证码成功',$res);
    }

    function generateSecureApiKey() {
        $data = openssl_random_pseudo_bytes(16);
        $data[6] = chr(ord($data[6]) & 0x0f | 0x40);
        $data[8] = chr(ord($data[8]) & 0x3f | 0x80);
        
        return vsprintf('%s%s-%s-%s-%s-%s%s%s', str_split(bin2hex($data), 4));
    }

    // 生成并获取用户token
    function getUserToken($user_id){

        if (Redis::get('mobile_login_token_' . $user_id)) {
            $token = Redis::get('mobile_login_token_' . $user_id);
        } else {
            $token = Tool::createToken();
            Redis::setex('mobile_login_token_' . $user_id, 86400 * 180, $token);
        }
        return $token;
    }
}
