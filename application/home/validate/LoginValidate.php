<?php

namespace app\home\validate;

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
	    'studentId' => 'require|min:8|max:32|number',
        'password' => 'require',
        'captcha|验证码' => 'require|captcha'
    ];
    
    /**
     * 定义错误信息
     * 格式：'字段名.规则名'	=>	'错误信息'
     *
     * @var array
     */	
    protected $message = [
        'studentId.require' => '学号不能为空',
        'studentId.min' => '学号不能小于 8 个数字',
        'studentId.max' => '学号不能小大于32个数字',
        'studentId.number' => '学号只能是数字',
        'password.require' => '密码不能为空',
        'captcha' => '验证码错误'
    ];
}
