<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;
use App\Models\Tool;
// use App\Models\Order;

include_once app_path() . "/Lib/wxpay/wxpay.php";
include_once app_path() . "/Lib/wxpay/wxh5pay.php";
include_once app_path() . "/Lib/wxpay/wxpcpay.php";
include_once app_path() . "/Lib/nuomisdk/Autoloader.php";
include_once app_path() . "/Lib/ali/AopSdk.php";

use WeixinPay;
use WeixinH5Pay;
use WeixinPcPay;
use NuomiRsaSign;
use AopClient;
use AlipayTradeAppPayRequest;
use AlipayTradeWapPayRequest;
use AlipayTradePagePayRequest;


class Pay extends Model
{

    /**
     * 支付
     * pay_type 1微信支付 2支付宝支付
     * $orderType 订单类型 1充值订单
     * orderid 订单id
     */
    static function pay($pay_type, $orderType, $orderid)
    {
        if ($orderType == 1) { //充值订单
            $order = DB::table('order')->where('id', $orderid)->first();
            $body = '充值';
        }
        if ($pay_type == 1) { //PC微信支付
            // $pay['pay_ewm'] = '此处模拟微信支付二维码';
            $config = DB::table('pay_set')->where('type',1)->first();
            $pay = Pay::PcWxPay($order['out_trade_no'], $order['price'], $config,$body);
            $mch_id = $config['wx_mch_id'];
        }
        if ($pay_type == 2) { //PC支付宝支付
            $config = DB::table('pay_set')->where('type',2)->first();
            $pay = Pay::PcAliPay($order['out_trade_no'], $order['price'], $config,$body);
            
        }
        return $pay;
    }




    // PC微信支付
    // , $uniacid, , $url
    static function PcWxPay($out_trade_no, $price, $config,$body)
    {
        $body = Tool::cn_substr_utf8($body, 100, '...', 0);
        // $root = Tool::siteurl() . "public/index.php/api/callback/pcwxnotify";
        $root = Tool::siteurl() . "api/callback/pcwxnotify";
        $total_fee = floatval($price * 100);
        // $weixinpay = new WeixinPcPay($config['wx_appid'], $config['wx_mch_id'], $config['wx_key'], $out_trade_no, $body, $total_fee, $root, $config['pay_type'], $config, $url);
        // $result = $weixinpay->pay();
        $weixinpay = new WeixinPcPay($config['wx_appid'], $config['wx_mch_id'], $config['wx_key'], $out_trade_no, $body, $total_fee, $root, $config);
        $result = $weixinpay->pay();
        return array('pay_ewm' => $result, 'out_trade_no' => $out_trade_no);
    }

    // PC支付宝支付
    // $order['out_trade_no'], $order['price'], $config,$body
    static function PcAliPay($out_trade_no, $price, $config, $body)
    {
        $body = Tool::cn_substr_utf8($body, 100, '...', 0);
        /** 初始化 **/
        $aop = new AopClient();
        /** 支付宝网关 **/
        $aop->gatewayUrl = 'https://openapi.alipay.com/gateway.do';
        /** 应用id,如何获取请参考：https://opensupport.alipay.com/support/helpcenter/190/201602493024 **/
        $aop->appId = $config['alipay_app_id'];
        /** 密钥格式为pkcs1，如何获取私钥请参考：https://opensupport.alipay.com/support/helpcenter/207/201602469554  **/
        $aop->rsaPrivateKey = str_replace(PHP_EOL, '', $config['alipay_app_private_key']); //支付宝应用私钥alipay_private_key
        /** 支付宝公钥，如何获取请参考：https://opensupport.alipay.com/support/helpcenter/207/201602487431 **/
        $aop->alipayrsaPublicKey = str_replace(PHP_EOL, '', $config['alipay_public_key']); //支付宝公钥alipay_public_key
        /** 签名算法类型 **/
        $aop->signType = 'RSA2';
        /** 请求使用的编码格式 **/
        $aop->postCharset = 'utf-8';
        /** 仅支持JSON  **/
        $aop->format = 'json';
        /** 实例化具体API对应的request类，类名称和接口名称对应，当前调用接口名称：alipay.trade.wap.pay（手机网站支付接口）**/
        $request = new  AlipayTradeWapPayRequest();
        /** 设置业务参数 **/
        $request->setBizContent("{"
            /** 商户订单号，商户自定义，需保证在商户端不重复，如：20150320010101001 **/
            . "\"out_trade_no\": \"" . $out_trade_no . "\","
            /** 销售产品码,固定值：QUICK_WAP_WAY **/
            . "\"product_code\":\"FAST_INSTANT_TRADE_PAY\","
            /** 订单金额，精确到小数点后两位 **/
            . "\"total_amount\": \"" . $price . "\","
            /** 订单标题 **/
            . "\"subject\": \"" . $body . "\","
            /** 订单描述 **/
            . "\"body\": \"" . $body . "\","
            . "\"qr_pay_mode\": \"" . "1" . "\","
            . "}");

        // $notify_url = $root = Tool::siteurl() . "public/index.php/api/callback/pcalinotify";
        $notify_url = $root = Tool::siteurl() . "api/callback/pcalinotify";
        $request->setNotifyUrl($notify_url);
        $result = $aop->pageExecute($request, 'get');
        return array('pay_ewm' => Tool::qrcode($result, 5), 'out_trade_no' => $out_trade_no);
    }

}
