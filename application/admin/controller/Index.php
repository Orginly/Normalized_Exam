<?php
namespace app\admin\controller;

use think\Request;

class Index
{
    public function index()
    {
        return view('admin@/Index/index');
    }
    public function paper(Request $request){
        /*获取所有试卷信息*/
        $paperModel = model('Paper');
        $ret = $paperModel
            ->alias('paper')
            ->field('paper.*,course.courseName')
            ->leftJoin('course','paper.belongCourseId = course.id')
            ->select();

        foreach ($ret as $val){
            $val['createTime'] = date('Y-m-d H:m:s',$val['createTime']);
        }

        //dump($ret);
        if($ret){
            return json(['msg' => '获取成功', 'data' => $ret],200);
        }else{
            return json(['msg' => '获取试卷列表失败'],203);
        }
    }
}
