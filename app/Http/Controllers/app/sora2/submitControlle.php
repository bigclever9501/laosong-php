<?php

namespace App\Http\Controllers\app\sora2;

use App\Http\Controllers\admin\footprint\footprintController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;
use App\Models\Tool;
use Log;

class submitControlle extends Controller
{

    public function index(Request $r)
    {// 基础验证区。检查模型名称：只允许 sora-2, sora-2-pro 等指定名字，其他的报错
        if(empty($r['model']) || ( $r['model'] != 'sora-2' && $r['model'] != 'sora-2-pro' && $r['model'] != 'sora-2-temporary' )){
            return $this->result(400, '模型错误', '');
        }
        if(empty($r['prompt']) || $r['prompt'] == ''){// 检查提示词：不能是空的
            return $this->result(400, '提示词不能为空', '');
        }// 检查比例：必须是 16:9 或 9:16，其他比例不支持
        if(empty($r['aspect_ratio']) || ( $r['aspect_ratio'] != '16:9' && $r['aspect_ratio'] != '9:16' )){
            return $this->result(400, '比例错误', '');
        }// 检查时长：必须是 10秒, 15秒, 25秒之一
        if(empty($r['duration']) || ( $r['duration'] != '10' && $r['duration'] != '15' && $r['duration'] != '25' )){
            return $this->result(400, '时长错误', '');
        }//身份鉴权区
        if(empty($r->header('Authorization'))){// 获取 HTTP 请求头里的 'Authorization' 字段（也就是 API Key）
            return $this->result(400, '鉴权失败', '');
        }
        $Authorization = $r->header('Authorization');
        $user = DB::table('users')->where('api_key',$Authorization)->first();// 去数据库 users 表查，有没有在这个 api_key 的人？
        if(empty($user)){// 查不到人，说明 Key 是假的
            return $this->result(400, 'API_KEY错误', '');
        }

        // 计算所需费用（价格计算区）
        if(($r['model'] == 'sora-2' || $r['model'] == 'sora-2-temporary') && $r['duration'] == '10'){
            $price = 1;// 根据模型和时长定价格。如果是普通版 且 10秒 => 1积分
        }elseif(($r['model'] == 'sora-2' || $r['model'] == 'sora-2-temporary') && $r['duration'] == '15'){
            $price = 2.5;// 如果是普通版 且 15秒 => 2.5积分
        }elseif(// 如果是 Pro 版 => 5积分
            ($r['model'] == 'sora-2-pro' && $r['duration'] == '10') || 
            ($r['model'] == 'sora-2-pro' && $r['duration'] == '15') || 
            ($r['model'] == 'sora-2-pro' && $r['duration'] == '25')
        ){
            $price = 5;
        }else{
            return $this->result(400, '参数不匹配', '');
        }
        if($user['available_point'] < $price ){// 【核心风控】：检查用户余额(available_point)够不够付钱？不够直接踢飞
            return $this->result(400, '可用点数不足', '');
        }
        
        //向上游发起请求
        // 设置上游 API 的密钥（注意：这是你作为代理商去调多米API的密钥，不是用户的）
        $key = 'tutNgGaCLONpHSF0SZhfxZwVnn';
        // $key = 'KkcoP6onwNjJZrl5Gz5Dzwedpt';
        $url = 'https://duomiapi.com/v1/videos/generations';// 上游接口地址
        $data = [// 组装包裹：把用户想要的东西，按照上游要求的格式打包
            'prompt'=>$r['prompt'],
            "model"=>$r['model'],
            "aspect_ratio"=> $r['aspect_ratio'],
            "duration"=>$r['duration'],
            // "callback_url" => Tool::siteurl() . "public/index.php/api/callback/sora"
            "callback_url" => Tool::siteurl() . "api/callback/sora"// 【最关键的一行】：告诉上游“做果好了之后，请把结发到这个网址”。Tool::siteurl() 会获取你的域名（如 https://bslabai.com/
        ];
        $headers = array('Authorization:'.$key);// 把你的商家密钥放在请求头里

        $res = Tool::curlPost($url,$data,$headers);// 调用 Tool 工具类里的 curlPost 方法，真正把数据发出去！
        //处理结果与扣款
        $res = json_decode($res,true);// 解析上游返回的结果
        if(!empty($res['id'])){// 如果返回结果里有 'id'，说明下单成功了！(这个id就是 task_id)
            DB::table('users_create_log')->insert([// 动作A：在日志表里记一笔“排队中(status=0)”
                'user_id'=>$user['id'],
                'user_input_json'=>json_encode($r->post(),320),// 存一下原始参数方便查错
                'task_id'=>$res['id'],// 存下这个最重要的任务ID
                'task_status'=>0,// 0 代表进行中/排队
                'consume_point'=>$price,// 记录这单花了多少钱
                'model'=>$r['model'],// ... 记录其他参数
                'aspect_ratio'=>$r['aspect_ratio'],
                'duration'=>$r['duration'],
                'prompt'=>$r['prompt'],
                'create_time'=>time()
            ]);
            DB::table('users')->where('id',$user['id'])->update([// 动作B：扣款
                'available_point'=> $user['available_point'] - $price,// 逻辑：可用余额 - 价格，冻结金额 + 价格
                'freeze_point'=> $user['freeze_point'] + $price// 为什么是冻结？因为任务还没失败，如果失败了还要从冻结里退回来。
            ]);
        }
        return $res;// 把上游的结果（含 task_id）直接扔回给前端，让前端转圈圈去
    }
}
