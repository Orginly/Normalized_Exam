<?php

namespace app\http\middleware;
use think\Controller;

class adminLoginCheck extends Controller
{
    public function handle($request, \Closure $next)
    {
        if(!session('admin.username')){
            return $this->error('你还未登录，禁止访问！','/admin/login');
        }
        return $next($request);
    }
}
