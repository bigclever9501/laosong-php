<?php

namespace App\Http\Controllers\callback\notify;

use Illuminate\Http\Request;
use App\Models\Tool;
use App\Models\Order;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;
use Log;

include_once app_path() . "/Lib/nuomisdk/Autoloader.php";
include_once app_path() . "/Http/Controllers/callback/notify/aesutil.php";

use AesUtil;

use NuomiRsaSign;

class notifyController extends Controller
{

    // PC微信支付
    public function pcwxnotify(Request $r)
    {
        $input = file_get_contents('php://input');// 1. 伸手接住微信扔过来的数据包（XML格式）
        if (!empty($input)) {// 2. 把XML格式的包裹拆开，转换成PHP能看懂的数组格式
            $obj = simplexml_load_string($input, 'SimpleXMLElement', LIBXML_NOCDATA);
            $res = $data = json_decode(json_encode($obj), true);
            if (empty($data)) {// 3. 如果包裹是空的，告诉微信“失败(FAIL)”，并停止运行
                $result = array(
                    'return_code' => 'FAIL',
                    'return_msg' => '',
                );
                echo Tool::array2xml($result);
                exit;
            }
            if ($data['result_code'] != 'SUCCESS' || $data['return_code'] != 'SUCCESS') {// 4. 检查微信发来的状态。如果微信说“这笔交易失败了”，那我们也就记录失败，并停止运行
                $result = array(
                    'return_code' => 'FAIL',
                    'return_msg' => empty($data['return_msg']) ? $data['err_code_des'] : $data['return_msg'],
                );
                echo Tool::array2xml($result);
                exit;
            }
            $get = $data;// 暂存数据
        }
        if ($res['return_code'] == 'SUCCESS' && $res['result_code'] == 'SUCCESS') {// 只有当微信说“交易成功”时，才进行后续操作
            $sys = DB::table('pay_set')->where('type',1)->first();// 1. 去数据库查一下自己的“商户密钥”(Key)。这个Key只有自己和微信知道，就像接头暗号。
            foreach ($res as $k => $v) {// 2. 把微信发来的数据整理一下，去掉其中原本的“签名”字段（因为要重新算一遍来比对）
                if ($k == 'sign') {
                    $xmlSign = $res[$k];// 把微信发来的签名存起来，一会用来对比
                    unset($res[$k]);// 从数据里剔除
                }
            }
            $sign = http_build_query($res);// 3. 把剩下的数据按顺序排好，拼成字符串
            $sign = md5($sign . '&key=' . $sys['wx_key']);// 4. 【核心安全逻辑】把数据字符串 + 数据库密钥 拼在一起，进行 MD5 加密
            $sign = strtoupper($sign);// 5. 把算出来的结果转成大写
            if ($sign != $xmlSign) {// 6. 【关键时刻】比对！算出来的签名($sign) vs 微信发来的签名($xmlSign)
                echo '签名错误!';
                exit;
            }
            $logno = trim($res['out_trade_no']);// 1. 提取订单号（Out Trade No）
            if (empty($logno)) {
                exit;
            }
            Order::notify($logno, 1,$res['transaction_id']); //真正的回调；2. 【核心业务调用】Order::notify，这句话的意思是：“告诉订单中心，这就叫 $logno 的订单，用户已经付了钱，流水号是 xxx，赶紧给他发积分！
            $result = array(// 1. 准备回执内容：告诉微信“SUCCESS”（我收到了，处理很顺利）
                'return_code' => 'SUCCESS',
                'return_msg' => 'OK',
            );
            echo Tool::array2xml($result);// 2. 把回执转换成 XML 格式发回去
            exit;
        } else {
            //订单已经处理过了
            $result = array(
                'return_code' => 'SUCCESS',
                'return_msg' => 'OK',
            );
            echo Tool::array2xml($result);
            exit;
        }
    }
    // PC支付宝支付
    public function pcalinotify(Request $r)
    {
        if ($_POST['trade_status'] == 'TRADE_SUCCESS') {
            //业务处理
            Order::notify($_POST['out_trade_no'], 2, $_POST['trade_no']); //真正的回调
            echo 'success';
        } else {
            echo 'fail';
        }
    }

    // sora
    public function sora(Request $r){

        $input = file_get_contents('php://input');// 1. 接住 Sora 扔过来的数据包（JSON格式）
        // Log::info($input);
        $input = json_decode($input,true);// 2. 把 JSON 翻译成 PHP 能看懂的数组

        if(!empty($input) && $input['id']){// 3. 检查：数据包里有没有“任务ID”？如果没有ID，那就是垃圾短信，不理它。
            $task_id = $input['id'];// 4. 拿到任务ID (这是之前的取货凭证)
            $log = DB::table('users_create_log')->where('task_id',$task_id)->first();// 1. 去 `users_create_log` 表里查：谁拥有这个 task_id？
            if(!empty($log)){
                $user = DB::table('users')->where('id',$log['user_id'])->first();// 2. 顺藤摸瓜，查出这个订单属于哪个用户 (user_id)
                // 成功
                if(!empty($log) && ($log['task_status'] == 0 && $input['state'] == 'succeeded')){// 条件：订单必须是 0 (排队中) 且 Sora 说 'succeeded' (成功)
                    DB::table('users_create_log')->where('id',$log['id'])->update([// 动作1：更新订单表 (Log)
                        'task_status'=>1,// 状态改为 1 (成功)
                        'res_content'=>json_encode($input,320),// 把Sora发来的原始数据存个底（留证据）
                        'res_url'=>$input['data']['videos'][0]['url'],// 【重点】把视频链接存进去，前端就靠这个显示视频！
                        'handle_time'=>time()// 记录结账时间
                    ]);
                    DB::table('users')->where('id',$user['id'])->update([// 动作2：更新用户钱包 (Users) —— 资金结算
                        'used_point'=>$user['used_point'] + $log['consume_point'],// 已消费 = 原来的已消费 + 这单的费用
                        'freeze_point'=>$user['freeze_point'] - $log['consume_point'],// 冻结款 = 原来的冻结款 - 这单的费用 (注意：这里不扣余额，因为下单时已经扣过了)
                    ]);
                }
                // 失败
                if(!empty($log) && ($log['task_status'] == 0 && $input['state'] == 'error')){// 条件：订单是 0 (排队中) 且 Sora 说 'error' (失败)
                    DB::table('users_create_log')->where('id',$log['id'])->update([// 动作1：更新订单表，标记失败
                        'task_status'=>2,// 状态改为 2 (失败)
                        'error_msg'=>$input['message'],// 记下Sora说的失败原因（比如违禁词）
                        'handle_time'=>time()
                    ]);
                    DB::table('users')->where('id',$user['id'])->update([// 动作2：退款！(Users)
                        'available_point'=>$user['available_point'] + $log['consume_point'],// 余额 = 原来的余额 + 这单的费用 (钱退回口袋)
                        'freeze_point'=>$user['freeze_point'] - $log['consume_point'],// 冻结款 = 原来的冻结款 - 这单的费用 (解除冻结)
                    ]);
                }
            }
        }

    }

    // --- 【修正版】万相 2.6 回调入口 ---
    public function wanxiang(Request $r)
    {
        $input = file_get_contents('php://input');
        // Log::info('万相回调原始数据: ' . $input); 
        
        $event = json_decode($input, true);
        $payload = isset($event['data']) ? $event['data'] : [];
        
        // 校验 TaskID
        if (empty($payload) || empty($payload['task_id'])) {
            return 'SUCCESS'; 
        }

        $task_id = $payload['task_id'];
        $event_status = isset($payload['task_status']) ? $payload['task_status'] : '';

        // 查本地账本
        $log = DB::table('users_create_log')->where('task_id', $task_id)->first();

        // 只有订单处于 0 (排队中) 才处理
        if (!empty($log) && $log['task_status'] == 0) {
            
            $user = DB::table('users')->where('id', $log['user_id'])->first();

            // 1. 【关键】主动反查阿里云接口，获取图片 URL
            $api_result = $this->queryAliyunTask($task_id); 
            
            // 2. 根据反查结果判断成功失败（以反查结果为准）
    if ($api_result['status'] == 'SUCCEEDED') {
        
        // === 成功逻辑 ===
        DB::transaction(function () use ($log, $user, $api_result) {
            
            // 【修正】万相 2.6 的取图路径比较深，请严格照抄这里：
            $img_url = '';
            // 先尝试从 choices 里拿（这是万相2.6的标准文档结构）
            if (isset($api_result['output']['choices'][0]['message']['content'][0]['image'])) {
                $img_url = $api_result['output']['choices'][0]['message']['content'][0]['image'];
            } 
            // 保险起见，也可以兼容一下旧格式（可选）
            elseif (isset($api_result['output']['results'][0]['url'])) {
                $img_url = $api_result['output']['results'][0]['url'];
            }

            // A. 更新日志
            DB::table('users_create_log')->where('id', $log['id'])->update([
                'task_status' => 1,
                'res_content' => json_encode($api_result, 320), // 存完整报文，以后查错用
                'res_url'     => $img_url, // 存正确的图片链接
                'handle_time' => time()
            ]);

                    // B. 资金结算：移除冻结，增加消费
                    DB::table('users')->where('id', $user['id'])->update([
                        'used_point'   => $user['used_point'] + $log['consume_point'],
                        'freeze_point' => $user['freeze_point'] - $log['consume_point'],
                    ]);
                });

            } else {
                
                // === 失败逻辑 (FAILED 或其他) ===
                DB::transaction(function () use ($log, $user, $api_result) {
                    // A. 更新日志
                    DB::table('users_create_log')->where('id', $log['id'])->update([
                        'task_status' => 2,
                        'error_msg'   => $api_result['output']['message'] ?? '阿里云生成失败',
                        'handle_time' => time()
                    ]);

                    // B. 资金回滚
                    DB::table('users')->where('id', $user['id'])->update([
                        'available_point' => $user['available_point'] + $log['consume_point'],
                        'freeze_point'    => $user['freeze_point'] - $log['consume_point'],
                    ]);
                });
            }
        }

        return 'SUCCESS';
    }
    // --- 【必须补充】内部私有方法：反查阿里云任务详情 ---
    // 这个方法就像你的“跑腿小弟”，专门跑去阿里云问：“那张图到底画好没？”
    private function queryAliyunTask($task_id) {
        
        // 1. 获取你的阿里云 API Key
        // 记得去根目录的 .env 文件里加一行：ALIYUN_DASHSCOPE_KEY=sk-xxxxxx
        $api_key = env('ALIYUN_DASHSCOPE_KEY'); 
        
        // 2. 拼接查询地址
        $url = "https://dashscope.aliyuncs.com/api/v1/tasks/" . $task_id;
        
        // 3. 准备请求头
        $headers = [
            "Authorization: Bearer " . $api_key,
            "Content-Type: application/json"
        ];

        // 4. 发起 HTTP GET 请求 (使用 CURL)
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        
        // 如果你的服务器 SSL 证书报错，可以临时把下面两行注释打开（不推荐生产环境用）
        // curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
        // curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, false);
        
        $response = curl_exec($ch);
        curl_close($ch);

        // 5. 解析结果
        $result = json_decode($response, true);
        
        // 6. 整理一下格式，方便外面的 wanxiang 方法使用
        // 阿里云的状态字段通常在 output.task_status
        return [
            'status' => $result['output']['task_status'] ?? 'UNKNOWN', // 拿到 SUCCEEDED 或 FAILED
            'output' => $result['output'] ?? [], // 这里面藏着 image_url
            'raw'    => $result // 把原始数据也带上，以防万一
        ];
    }


}
