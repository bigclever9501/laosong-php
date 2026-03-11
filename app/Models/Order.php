<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;
use App\Models\Tool;
use Illuminate\Support\Facades\Redis;

use Cache;
use Log;


class Order extends Model
{   // 定义静态方法，接收三个参数：订单号(logno)，支付方式，第三方交易号
    // payType 1微信 2支付宝
    static function notify($logno, $pay_type, $pay_trade_no = '')
    {
        $cache = Cache::get($logno);// 1. 查缓存：看看这个订单号是不是“正在处理中”？
        if (!empty($cache)) {// 2. 如果缓存里有值，说明刚才已经有另一个请求在处理这笔订单了
            exit;// 直接退出程序，防止重复加钱（这是第一道防线）
        } else {// 3. 如果缓存是空的，赶紧写入一个标记，有效期默认较短
            Cache::put($logno, time());// 意思是：“这笔订单我接手了，别人别动！”
        }

        
        // 优化订单ID查询(查询两天前的订单)
        $oneDaysAgoMidnight = strtotime('midnight -1 days');// 4. 计算时间：获取“昨天凌晨0点”的时间戳，目的：为了缩小查库范围，只查最近两天的订单
            
        // 充值订单
        $init_where_recharge_order_id = (int)Redis::get('init_where_recharge_order_id') ?? 0;// 5. 这是一个 Redis 优化技巧：获取“昨天第一笔订单的ID”，只要知道了昨天的起始ID，数据库查询时就不用扫描全表（几十万条数据），只扫最后一点点
        if(empty($init_where_recharge_order_id)){// 6. 如果 Redis 里没存这个 ID，就去数据库现查一次
            $recharge_order = DB::table('order')->select('id')->where('submit_time', '>=', $oneDaysAgoMidnight)->first();// 查库：找昨天的第一笔订单
            if(empty($recharge_order)){// 如果没找到（可能昨天没单），就找最新的一笔
                $recharge_order = DB::table('order')->select('id')->orderByDesc('id')->first();
            }
            $init_where_recharge_order_id = $recharge_order ? (int)$recharge_order['id'] : 0;// 拿到 ID
            Redis::setex('init_where_recharge_order_id', 86400, $init_where_recharge_order_id);// 存入 Redis，管一天（86400秒），这样接下来一天都不用再查库算这个起始位置了
        }
        // 7. 正式查订单：条件1：ID 必须大于昨天那个起始ID（极大提升速度）；条件2：商户订单号（logno）必须匹配
        $rechargeOrder = DB::table('order')->where('id','>=',$init_where_recharge_order_id)->where('out_trade_no', $logno)->first(); //订单
        if (!empty($rechargeOrder) && $rechargeOrder['is_pay'] == 0) {// 8. 【最关键的判断】：必须找到了订单，并且 订单状态必须是 0 (未支付)；这就是“幂等性”检查：如果状态已经是 1，说明钱加过了，直接跳过
            // 9. 准备要更新的数据
            $order_data['is_pay'] = 1; //状态改为已支付
            $order_data['pay_type'] = $pay_type; //记录是用微信还是支付宝
            $order_data['pay_time'] = time(); //记录支付时间
            $order_data['pay_trade_no'] = $pay_trade_no;// 记录微信/支付宝那边的流水号

            DB::table('order')->where('id', $rechargeOrder['id'])->update($order_data); //更新订单状态
            // 给用户充值点数
            $user = DB::table('users')->where('id', $rechargeOrder['user_id'])->first();// 11. 查用户：看看这个订单是谁下的
            DB::table('users')->where('id', $rechargeOrder['user_id'])->update([// 12. 【加钱】：给用户余额加上充值的点数
                'available_point' => $user['available_point'] + $rechargeOrder['points']// 逻辑：新余额 = 老余额 + 订单点数
            ]);


           

           
        }

        Cache::forget($logno);// 13. 解锁：处理完了，把缓存里的“正在施工”标记删掉
    }


}
