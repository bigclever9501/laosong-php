<?php

namespace App\Http\Middleware;

use Illuminate\Auth\Middleware\Authenticate as Middleware;

class ApiVersionMiddleware extends Middleware
{
   
    
    public function handle($request, Closure $next)
{
    $action = app()->router->getCurrentRoute()->getActionName();

     dd(111111);
    //  returns "App\Http\Controllers\DemoController@store"
}


}
