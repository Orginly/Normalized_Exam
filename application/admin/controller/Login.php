<?php

namespace app\admin\controller;

use app\admin\validate\LoginValidate;
use think\captcha\Captcha;
use think\Controller;
use think\Request;

class Login extends Controller
{
    public function index(){
        return view('admin@/Login/login');
    }
    /*点击了登录按钮*/
    public function login(Request $request){
        $data = $request->post();
        $validate = new LoginValidate();
        if(!$validate->check($data)){
            return json(['msg' => $validate->getError()],203);
        }
        $data['password'] =   md5(md5($data['password']));
        /*查找数据库*/
        $teacherModel = model('teacher');
        $userData = $teacherModel->where('username',$data['username'])
            ->where('password',$data['password'])
            ->find();
        if(!$userData){
            return json(['msg' => '用户名或密码错误'],203);
        }
        session('admin.username',$data['username']);
        session('admin.level',$userData['level']);
        return json(['msg' => '登录成功'],200);

    }

    public function logout(){
        session('admin.username',null);
        session('admin.level',null);
        return $this->success('注销成功！','admin/login');
    }

    /*生成验证码*/
    public function verify()
    {
        $config =    [
            // 验证码字体大小
            'fontSize'    =>    70,
            // 验证码位数
            'length'      =>    4,
            // 关闭验证码杂点
            'useNoise'    =>    true,
        ];
        $captcha = new Captcha($config);
        return $captcha->entry();
    }
}
