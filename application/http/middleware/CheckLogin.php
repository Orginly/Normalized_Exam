<?php

namespace app\http\middleware;

use think\Controller;
class CheckLogin extends Controller
{
    public function handle($request, \Closure $next)
    {
        if(!session('studentId')){
            return $this->error('你的未登录！');
        }
        return $next($request);
    }
}
