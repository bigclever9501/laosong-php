<?php

namespace App\Http\Controllers\site\common;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;
use App\Models\Tool;
use Log;

class configController extends Controller
{

    public function index(Request $r)
    {
        $res = DB::table('sys')->first();
        unset($res['id']);
        return $this->result(2,'',$res);
    }
}
