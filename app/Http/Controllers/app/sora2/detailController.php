<?php

namespace App\Http\Controllers\app\sora2;

use App\Http\Controllers\admin\footprint\footprintController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;
use App\Models\Tool;
use Log;

class detailController extends Controller
{

    public function index(Request $r)
    {// 根据外部传进来的 id (对应数据库里的 task_id)，去日志表里找这条订单
        $info = DB::table('users_create_log')->where('task_id',$r['id'])->first();
        if(!empty($info)){// 如果找到了这条记录（防止别人瞎填一个ID来查）
            // 判断是否是生成中状态
            if($info['task_status'] == 1){// 判断是否是生成中状态，如果本地状态是 1 (已成功)
                $res = $info['res_content'];// 取出当时存下来的完整上游返回的JSON字符串
                $res = json_decode($res,true);// 转成数组
                $res['data']= $res['data']['videos'][0]['url'];// 提取出视频真实的播放链接
            }
            if($info['task_status'] == 2){// 如果本地状态是 2 (已失败)
                $res = $info['res_content'];
                $res = json_decode($res,true);
                $res['state'] = 'error';// 强制把状态改成 error 告诉前端
                $res['data']= '';// 失败了自然没有链接
            }
            if($info['task_status'] == 0){// 如果本地状态是 0 (进行中)


                // $key = 'tutNgGaCLONpHSF0SZhfxZwVnn';
                $key = 'KkcoP6onwNjJZrl5Gz5Dzwedpt';
                $url = 'https://duomiapi.com/v1/videos/tasks/' . $r['id'];// 把任务ID拼在URL后面
                $headers = array('Authorization: '.$key);
                // 使用 Tool 里的 curlPost 去发请求 (实际上这里多米要求用 GET，但 Tool 可能兼容了或者多米没拦截)
                $result = Tool::curlPost($url,array(),$headers);
                $result = json_decode($result,true);
                if(!empty($result['code']) && $result['code'] == 403){// 如果上游说 API Key 欠费了或者没权限 (code 403)，直接报错返回
                    return $this->result(400, $result, '');
                }
                // 查出这个任务是谁下的，准备结账用
                $user = DB::table('users')->where('id',$info['user_id'])->first();
                
                // 如果本地是 0，但上游返回的结果里说 state 是 'succeeded' (成功了)
                if(!empty($info) && ($info['task_status'] == 0 && $result['state'] == 'succeeded')){
                    DB::table('users_create_log')->where('id',$info['id'])->update([// 动作1：改订单状态为 1，存入视频链接，记录处理时间
                        'task_status'=>1,
                        'res_content'=>json_encode($result,320),
                        'res_url'=>$result['data']['videos'][0]['url'],
                        'handle_time'=>time()
                    ]);// 动作2：扣钱！(扣掉冻结款，增加已使用积分) -> 注意：这里没用 DB::transaction，有隐患！
                    DB::table('users')->where('id',$user['id'])->update([
                        'used_point'=>$user['used_point'] + $info['consume_point'],
                        'freeze_point'=>$user['freeze_point'] - $info['consume_point'],
                    ]);
                }
                // 如果本地是 0，但上游返回的结果里说 state 是 'error' (失败了)
                if(!empty($info) && ($info['task_status'] == 0 && $result['state'] == 'error')){
                    DB::table('users_create_log')->where('id',$info['id'])->update([// 动作1：改订单状态为 2，记录上游给的报错原因
                        'task_status'=>2,
                        'error_msg'=>$result['message'],
                        'handle_time'=>time()
                    ]);// 动作2：退钱！(把冻结的钱退回到可用余额里)
                    DB::table('users')->where('id',$user['id'])->update([
                        'available_point'=>$user['available_point'] + $info['consume_point'],
                        'freeze_point'=>$user['freeze_point'] - $info['consume_point'],
                    ]);
                }
// 无论刚才有没有更新数据库，为了稳妥，再从数据库里查一次最新的状态
                $info2 = DB::table('users_create_log')->where('task_id',$r['id'])->first();
                if($info2['task_status'] == 1){// 如果最新状态是 1，把链接塞进 $res['data']
                    $res = $info2['res_content'];
                    $res = json_decode($res,true);
                    $res['data']= $res['data']['videos'][0]['url'];
                }// 如果最新状态是 2，把状态设为 error
                if($info2['task_status'] == 2){
                    $res = $info2['res_content'];
                    $res = json_decode($res,true);
                    $res['state'] = 'error';
                    $res['data']= '';
                }// 如果上面查了一圈，上游也说还是进行中，那就告诉前端 'pending'，让前端继续转圈圈
                if($info2['task_status'] == 0){
                    $res['id'] = $info2['task_id'];
                    $res['state'] = 'pending';
                    $res['data'] = '';
                    $res['action'] = 'generate';
                }
                
            }// 结束 if(status == 0)
            // 最后，通过 Controller 自带的 result() 方法，包装成标准的格式返回给外面
            return $this->result(200, '', $res);
        }else{// 最开始那个 if，如果连查都查不到这个 task_id，说明有人在搞破坏，直接返回错误
            return $this->result(400, 'ID错误', '');
        }
        
        
        // return $res;
    }
}
