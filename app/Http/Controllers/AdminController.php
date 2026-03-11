<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Admin;
use App\Models\Tool;

use Illuminate\Support\Facades\DB;

// use Qiniu\Auth;
// use Qiniu\Storage\UploadManager;
// use Qiniu\Storage\BucketManager; 
// use zgldh\QiniuStorage\QiniuStorage;
// use App\Lib\qiniu\autoload;
// use zgldh\QiniuStorage\QiniuStorage;


class AdminController extends Controller
{


    // protected $table = 'admins';
    public function result($code,$msg,$data){
        return Admin::result($code,$msg,$data);
    }
}
