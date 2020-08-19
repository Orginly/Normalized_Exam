<?php

namespace app\home\controller;

use think\Controller;

class Course extends Controller
{
    public function index()
    {
        /*获取课程信息*/
        $courseModel = model('Course');
        $data  = $courseModel->select();
        return view('home@/Course/course',['course' => $data]);
    }
}
