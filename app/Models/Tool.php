<?php

namespace App\Models;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;

include_once app_path()."/Lib/php_poster/phpQrcode.class.php";
use QRcode;


class Tool extends Model
{

    static public function result($code,$msg,$data){
        $arr = [
            'code'=>$code,
            'msg'=>$msg,
            'data'=>$data
        ];
        return $arr;
    }

    // 根目录
    static public function siteurl(){
        // return $_SERVER['REQUEST_SCHEME']. "://" .$_SERVER['SERVER_NAME'] . "/";
        if ( (! empty($_SERVER['REQUEST_SCHEME']) && $_SERVER['REQUEST_SCHEME'] == 'https') || (! empty($_SERVER['HTTPS']) && $_SERVER['HTTPS'] == 'on') || (! empty($_SERVER['SERVER_PORT']) && $_SERVER['SERVER_PORT'] == '443') ) {
            $_SERVER['REQUEST_SCHEME'] = 'https';
        } else {
            $_SERVER['REQUEST_SCHEME'] = 'http';
        }
        return $_SERVER['REQUEST_SCHEME']. "://" .$_SERVER['SERVER_NAME'] . "/";
    }

    static function qrcode($value,$size = 10){
        $value = $value; //二维码内容
		$errorCorrectionLevel = 'L';//容错级别
		$matrixPointSize = $size;//生成图片大小
		//生成二维码图片
        $QR = QRcode::png($value,false, $errorCorrectionLevel, $matrixPointSize, 2);
        // $newName = str_replace(':', '', $value);
        // $newName = str_replace('/', '', $newName);
        // $newName = str_replace('?', '', $newName);
        // $newName = str_replace('=', '', $newName);
		// $img_url = "storage/app/qrCode/pcpay"  . time() . ".jpeg";
        $url = "storage/app/qrCode/pcpay"  . time() . ".jpeg";
        $img_url = "public/".$url;
        $file = fopen(Tool::root() . $img_url,"w");//打开文件准备写入
        fwrite($file,$QR);//写入,$res为图片二进制内容
		fclose($file);//关闭
        return Tool::siteurl().$url;
    }

    // 服务器目录
    static public function root(){
        return substr(app_path(),0,-3);
    }
    static public function root2(){
        return substr(app_path(),0,-4);
    }

    // 返回指定长度随机字符串
    static function GetRandStr($length){
        $str = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
        $len = strlen($str)-1;
        $randstr = '';
        for ($i=0;$i<$length;$i++) {
         $num=mt_rand(0,$len);
         $randstr .= $str[$num];
        }
        return $randstr;
    }

    static function createToken() {
        $randLength = 12;
        $chars = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
        $len = strlen($chars);
        $randStr = '';
        for ($i = 0; $i < $randLength; $i++) {
            $randStr.=$chars[rand(0, $len - 1)];
        }
        $token = $randStr . time();

        return $token;
    }  
    

    // 字符串转时间
    static function time($time){
        return date("Y-m-d H:i",$time);
    }

    static function time2($time){
        return date("Y-m-d H:i:s",$time);
    }

    static function time3($time){
        return date("Y-m-d",$time);
    }

    //请求调用
    static function httpRequest($url, $data = null)
    {
        $curl = curl_init();
        curl_setopt($curl, CURLOPT_URL, $url);
        curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, false);
        curl_setopt($curl, CURLOPT_SSL_VERIFYHOST, false);
        if (!empty($data)) {
            curl_setopt($curl, CURLOPT_POST, 1);
            curl_setopt($curl, CURLOPT_POSTFIELDS, $data);
        }

        curl_setopt($curl, CURLOPT_RETURNTRANSFER, 1);
        //执行
        $output = curl_exec($curl);
        curl_close($curl);
        return $output;
    }

    static function curlPost($url,$params=array(),$headers=[]){
        // dd($headers);
        // $params  = json_encode($params,320);  
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch,CURLOPT_HEADER,0);
        // curl_setopt($ch,CURLOPT_HEADER,1);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
        curl_setopt($ch, CURLOPT_CONNECTTIMEOUT, 5);
        curl_setopt($ch, CURLOPT_POST, 1); 
        curl_setopt($ch, CURLOPT_POSTFIELDS, $params);
        curl_setopt($ch,CURLOPT_HTTPHEADER,$headers);
        //ssl false
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, FALSE);
        curl_setopt($ch, CURLOPT_SSL_VERIFYHOST,FALSE);
        $output = curl_exec($ch);

        curl_close($ch);

        // dd($output);
        return $output;
    }

    //utf-8中文截取，单字节截取模式 
    static function cn_substr_utf8($str,$length,$append='...',$start=0){ 
        if(strlen($str)<$start+1){ 
            return ''; 
        } 
        preg_match_all("/./su",$str,$ar); 
        $str2=''; 
        $tstr=''; 
        for($i=0;isset($ar[0][$i]);$i++){ 
            
            if(strlen($tstr)<$start){ 
                $tstr.=$ar[0][$i]; 
            }else{ 
                if(strlen($str2)<$length + strlen($ar[0][$i])){ 
                    $str2.=$ar[0][$i]; 
                }else{ 
                    break; 
                } 
            } 
        } 
        return $str == $str2 ? $str2 : $str2.$append; 
    } 

     //将数组转换为xml格式
    static function array2xml($arr, $bool = false)
    {
        $xml = "<xml>";
        foreach ($arr as $key => $val) {
            if ($bool) {
                $xml .= "<" . $key . ">" . $val . "</" . $key . ">";
            } else{
                $xml .= "<" . $key . "><![CDATA[" . $val . "]]></" . $key . ">";
            }
        }
        $xml .= "</xml>";
        return $xml;
    }

    
    




}
