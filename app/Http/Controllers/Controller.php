<?php

namespace App\Http\Controllers;

use App\Models\Tool;
use App\Models\BaseModel;
use Illuminate\Foundation\Auth\Access\AuthorizesRequests;
use Illuminate\Foundation\Bus\DispatchesJobs;
use Illuminate\Foundation\Validation\ValidatesRequests;
use Illuminate\Routing\Controller as BaseController;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Redis;

class Controller extends BaseController
{
    use AuthorizesRequests, DispatchesJobs, ValidatesRequests;

    public function uniacid($request){
        return $request->header('uniacid');
    }

    /**
     * code 0弹出 msg错误信息 并且有loading
     * -3 弹出msg错误信息 没有loading
     *  1成功 弹出msg信息
     * -1跳转登录
     */
    public function result($code,$msg,$data,$uniacid = 0){
        // if($uniacid >0){
        //     $msg = $this->getLanguageContent($uniacid,'首页');
        // }

        $arr = [
            'code'=>$code,
            'msg'=>$msg,
            'data'=>$data
        ];
        return $arr;
    }
}
