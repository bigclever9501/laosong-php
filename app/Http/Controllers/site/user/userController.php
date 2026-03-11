<?php

namespace App\Http\Controllers\site\user;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;
use App\Models\Tool;
use Log;

class userController extends Controller
{

    // 重置apikey
    public function restApiKey(Request $r)
    {
        $uid = $r->header('uid');
        DB::table('users')->where('id',$uid)->update([
            'api_key'=>self::generateSecureApiKey()
        ]);
        return $this->result(1,'重置API_KEY成功，请妥善保管','');
    }

    // 修改资料
    public function updateUserInfo(Request $r)
    {
        $uid = $r->header('uid');
        DB::table('users')->where('id',$uid)->update([
            'nickName'=>$r['nickName']
        ]);
        return $this->result(1,'修改账户信息成功','');
    }

    

    function generateSecureApiKey() {
        $data = openssl_random_pseudo_bytes(16);
        $data[6] = chr(ord($data[6]) & 0x0f | 0x40);
        $data[8] = chr(ord($data[8]) & 0x3f | 0x80);
        
        return vsprintf('%s%s-%s-%s-%s-%s%s%s', str_split(bin2hex($data), 4));
    }
}
