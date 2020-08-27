<?php

namespace app\home\controller;

use app\home\validate\LoginValidate;
use app\home\validate\RegisterValidate;
use think\Controller;
use think\Request;
use think\captcha\Captcha;

class Login extends Controller
{
    public function login(Request $request)
    {
        $data = $request->post();
        $validate = new LoginValidate();
        if (!$validate->check($data)) {
            return json(['msg' => $validate->getError()], 203);
        }
        $studentModel = model('Student');
        /*查询学号是否存在*/
        $studentId = $studentModel
            ->where('studentId', $data['studentId'])
            ->find();
        if (!$studentId) {
            return json(['msg' => '学号不存在，请检查是否正确'], 203);
        }
        $result = $studentModel
            ->where('studentId', $data['studentId'])
            ->where('password', md5(md5($data['password'])))
            ->find();
        if (!$result) {
           return json(['msg' => '账号密码错误，请重新输入！'],203);
        }
        /*验证成功存入session*/
        session('studentId', $data['studentId']);
        session('username', $result['username']);
        return json([
            'username' => $result['username'],
            'msg' => '登录成功'
        ], 200);
    }

    public function logout()
    {
        session('studentId', null);
        session('username', null);
        return json(['msg' => '注销成功'], 200);
    }

    public function register(Request $request)
    {
        //获取到ajax请求的数据
        $data = $request->post();
       
        //创建验证控制器
        $validate = new RegisterValidate();
        if (!$validate->check($data)) {
            return json(['msg' => $validate->getError()], 203);
        }

        $data['password'] = md5(md5($data['password']));
        $data['confirm_password'] = md5(md5($data['confirm_password']));
        $data['createTime'] = time();
        $data['lastTime'] = time();

        //新建模型
        $studentModel = model('Student');
        //查询数据库中是否存在用户
        $student = $studentModel->where('studentId', $data['studentId'])->find();
        if ($student) {
            return json('学号已存在，请咨询老师', 203);
        }
        $result = $studentModel->save($data);
        if ($result) {
            session('studentId', $data['studentId']);
            session('username', $data['username']);

        }
        return json('注册成功', 200);
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
            'useNoise'    =>    false,
        ];
        $captcha = new Captcha($config);
        return $captcha->entry();
    }
}
