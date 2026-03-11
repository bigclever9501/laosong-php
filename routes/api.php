<?php

use Illuminate\Http\Request;
/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/



Route::post('/sora2/submit', 'app\sora2\submitControlle@index');//sora生图接口
Route::get('/sora2/detail', 'app\sora2\detailController@index');//sora查询接口

Route::get('/wanxiang/detail', 'app\wanxiang\detailController@index');//wanxiang查询接口
Route::post('/wanxiang/submit', 'app\wanxiang\submitController@index');// 万相2.6 生图接口

Route::post('/nanobanana/submit', 'app\nanobanana\submitController@index');//Nano Banana 生图接口
Route::get('/nanobanana/detail', 'app\nanobanana\detailController@index');//Nano Banana 查询接口

Route::post('/grok/submit', 'app\grok\submitController@index');//grok生视频接口
Route::get('/grok/detail', 'app\grok\detailController@index');//grok从数据库查询结果

Route::post('/site/config', 'site\common\configController@index');//全局
Route::post('/site/login', 'site\login\loginController@index');//登录注册
Route::post('/site/sendCode', 'site\login\loginController@sendCode');//发送验证码

// 登录后才可以访问的接口
Route::group(['middleware' => ['CheckSiteLogin']], function () {
    Route::post('/site/userInfo', 'site\login\loginController@userInfo');//用户信息
    Route::post('/site/index', 'site\index\indexController@index');//首页信息
    Route::post('/site/recharge', 'site\recharge\rechargeController@index');//充值
    Route::post('/site/restApiKey', 'site\user\userController@restApiKey');//重置apikey
    Route::post('/site/updateUserInfo', 'site\user\userController@updateUserInfo');//修改资料
    Route::post('/site/submitRechargeOrder', 'site\recharge\orderController@submitRechargeOrder');//提交充值订单
    Route::post('/site/getOrderStatus', 'site\recharge\orderController@getOrderStatus');//获取订单支付状态
    Route::post('/site/getUserRechargeList', 'site\user\rechargeContrller@index');//充值记录
    Route::post('/site/getSoraList', 'site\user\soraContrller@index');//sora 历史列表
    Route::post('/site/getWanxiangList', 'site\user\wanxiangController@index');// 万相历史列表：给 Vue 前端用
    Route::post('/site/getNanobananaList', 'site\user\nanobananaController@index');//Nano Banana 历史列表：给 Vue 前端用
    
    
});


Route::any('callback/pcwxnotify', 'callback\notify\notifyController@pcwxnotify'); //pc 微信支付回调
Route::any('callback/pcalinotify', 'callback\notify\notifyController@pcalinotify'); //pc 支付回调
Route::any('callback/sora', 'callback\notify\notifyController@sora'); //sora
Route::any('callback/wanxiang', 'callback\notify\notifyController@wanxiang');// 万相回调通知：接收阿里云 EventBridge 消息
