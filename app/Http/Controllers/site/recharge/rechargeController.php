<?php

namespace App\Http\Controllers\site\recharge;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;
use App\Models\Tool;
use Log;

class rechargeController extends Controller
{

    public function index(Request $r)
    {
        $list = DB::table('recharge_sku')->orderByRaw('sort asc')->get()->toArray();
        return $this->result(2,'',$list);
    }
}
