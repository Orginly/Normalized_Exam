<?php
/*
 * @Descripttion: 
 * @version: 
 * @Author: Orginly
 * @Date: 2020-08-19 22:02:20
 * @LastEditors: Orginly
 * @LastEditTime: 2020-08-27 20:03:20
 */

namespace app\home\validate;

use think\Validate;

class RegisterValidate extends Validate
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
        'username' => 'require',
        'confirm_password' => 'confirm:password',
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
        'username.require' => '名字不能为空',
        'password.require' => '密码不能为空',
        'confirm_password.confirm' => '两次密码输入不一致',
        'captcha' => '验证码错误'
    ];
}
