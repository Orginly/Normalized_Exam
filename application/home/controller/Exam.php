<?php

namespace app\home\controller;

use think\Controller;
use think\Request;

class Exam extends Controller
{
    public function index()
    {

        $paperModel = model('Paper');
        $paperData = $paperModel
            ->alias('paper')
            ->field('paper.*,course.courseName')
            ->leftJoin('course','paper.belongCourseId = course.id')
            ->select();

        $data = [
          'paperData' => $paperData,
        ];

        return view('home@/Exam/exam',$data);
    }

    public function examRecord (Request $request){
        $gradeModel =  model('grade');
        $data = $gradeModel
            ->alias('grade')
            ->field('grade.*,paper.paperName,paper.examTime')
            ->where('studentId',session('studentId'))
            ->leftJoin('paper','grade.belongPaperId = paper.id')
            ->select();

        if(!$data){
            return json(['msg' => '获取考试记录失败'],203);
        }
        return json(['msg' => '获取考试记录成功', 'data' => $data],200);
    }
}
