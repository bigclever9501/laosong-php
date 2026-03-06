<?php

namespace App\Http\Controllers\task;
use Illuminate\Http\Request;
use App\Models\Tool;
use App\Models\Tasks;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;


class taskController extends Controller
{
    public function index(Request $r){
        Tasks::timer();
        return $this->result(1,'ok','');
    }

    
}
