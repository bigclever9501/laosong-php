<?php

namespace App\Http\Controllers\site\index;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;
use App\Models\Tool;
use Log;

class indexController extends Controller
{

    public function index(Request $r)
    {
        return $this->result(2,'','');
    }
}
