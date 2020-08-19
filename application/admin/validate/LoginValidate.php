<?php

namespace app\admin\validate;

use think\Validate;

class LoginValidate extends Validate
{
    /**
     * 定义验证规则
     * 格式：'字段名'	=>	['规则1','规则2'...]
     *
     * @var array
     */	
	protected $rule = [
	    'username' => 'require|min:5|max:10',
        'password' => 'require|min:5|max:10',
        'captcha' => 'require|captcha'
    ];
    
    /**
     * 定义错误信息
     * 格式：'字段名.规则名'	=>	'错误信息'
     *
     * @var array
     */	
    protected $message = [
        'username.require' => '用户名不得为空',
        'password.require' => '密码不得为空',
        'username.min' => '用户名不得小于5个字符',
        'password.min' => '密码不得小于5个字符',
        'captcha.require' => '验证码不能为空',
        'captcha.captcha' => '验证码错误，请重新输入'
    ];
}
