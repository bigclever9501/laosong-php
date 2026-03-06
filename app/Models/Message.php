<?php

namespace App\Models;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;

include_once app_path()."/Lib/aliyunsms/SignatureHelper.php"; //阿里云短信
// use SmsSingleSender;
use SignatureHelper;
use Log;


class Message extends Model
{

    /**
     * 发送短信
     * phone 手机号
     * data 发送数据数组
     */
    static function sendMessage($phone,$data,$action){
        $message = Db::table('sms_set')->first();
        if(!empty($message)){
			if($action == 'code'){
				$id = $message['code_id']; //验证码模板ID
				return Message::sendAliMessage($message,$phone,$data,$id);
			}
        }
    }


    //阿里云短信发送
    static function sendAliMessage($config, $phone, $data,$code) 
    {
		$params = array();
		// *** 需用户填写部分 ***
		// fixme 必填：是否启用https
		$security = false;
		// fixme 必填: 请参阅 https://ak-console.aliyun.com/ 取得您的AK信息
		$accessKeyId = $config['access_key_id'];
		$accessKeySecret = $config['access_key_secret'];
		// fixme 必填: 短信接收号码
		$params["PhoneNumbers"] = $phone;
		// fixme 必填: 短信签名，应严格按"签名名称"填写，请参考: https://dysms.console.aliyun.com/dysms.htm#/develop/sign
		$params["SignName"] = $config['sign'];
		// fixme 必填: 短信模板Code，应严格按"模板CODE"填写, 请参考: https://dysms.console.aliyun.com/dysms.htm#/develop/template
		$params["TemplateCode"] = $code;
		// fixme 可选: 设置模板参数, 假如模板中存在变量需要替换则为必填项
		$params['TemplateParam'] = $data;
		// *** 需用户填写部分结束, 以下代码若无必要无需更改 ***
		if (!empty($params["TemplateParam"]) && is_array($params["TemplateParam"])) {
			$params["TemplateParam"] = json_encode($params["TemplateParam"], JSON_UNESCAPED_UNICODE);
		}
		// 初始化SignatureHelper实例用于设置参数，签名以及发送请求
		$helper = new SignatureHelper();
		// 此处可能会抛出异常，注意catch
		$content = $helper->request(
			$accessKeyId,
			$accessKeySecret,
			"dysmsapi.aliyuncs.com",
			array_merge($params, array(
				"RegionId" => "cn-hangzhou",
				"Action" => "SendSms",
				"Version" => "2017-05-25",
			)),
			$security
		);
		return $content;
    }


    

}
