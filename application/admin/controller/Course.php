<?php

namespace app\admin\controller;

use think\Controller;
use think\Db;
use think\Image;
use think\Request;

class Course extends Controller
{
    public function index()
    {
        return view('admin@/Course/course');
    }

    public function course(Request $request)
    {
        $courseModel = model('Course');
        $teacherModel = model('Teacher');
        //如果是get请求
        if ($request->isGet()) {
            //需要获取的数据 科目名 所属老师 所属班级
            /*使用field指定字段
              使用alias设置别名
              leftJoin 即使右表没有匹配也返回左表所有行
            */
            $data = $courseModel
                ->alias('course')
                ->field('course.id,courseName,teacherName,className')
                ->leftJoin('teacher', 'course.belongTeacherId = teacher.id')
                ->leftJoin('class', 'course.belongClassId = class.id')
                ->select();
            return json(['msg' => '获取科目成功', 'courseData' => $data], 200);
        } else if ($request->isPost()) {
            /*如果是post请求*/
            $data = $request->post();
            /*插入数据库*/
            if (empty($data['courseName']) || empty($data['teacherName']) || empty($data['logo']) ||empty($data['className'])) {
                return json(['msg' => '所有选项不得为空！'], 203);
            }
            /*获取班级id*/
            $belongClassId = model('ClassModel')
                ->field('id')
                ->where('className', $data['className'])
                ->find();
            /*如果班级id不存在*/
            if (!$belongClassId) {
                $belongClassId = model('ClassModel')
                    ->insertGetId(['className' => $data['className']]);
            }
            /*获取教师名称的id*/
            $belongTeacherId = $teacherModel
                ->field('id')
                ->where('teacherName', $data['teacherName'])
                ->find();
            if (!$belongTeacherId) {
                return json(['msg' => '教师名称错误 或 不存在'], 203);
            }

            /*获取到数据后新增科目表*/
            $courseData = [
                'courseName' => $data['courseName'],
                'belongClassId' => $belongClassId['id'],
                'belongTeacherId' => $belongTeacherId['id'],
                'logo' =>$data['logo']
            ];

            $result = $courseModel->save($courseData);
            if (!$result) {
                return json(['msg' => '新增失败'], 203);
            }
            return json(['msg' => '新增科目成功'], 200);


        } else if ($request->isPut()) {
            $data = $request->put();
            $belongTeacherId = $teacherModel
                ->field('id')
                ->where('teacherName', $data['teacherName'])
                ->find()['id'];
            /*获取班级id*/
            $belongClassId = model('ClassModel')
                ->field('id')
                ->where('className', $data['className'])
                ->find()['id'];
            /*如果班级id不存在*/
            if (!$belongClassId) {
                $belongClassId = model('ClassModel')
                    ->insertGetId(['className' => $data['className']]);
            }

            $courseData = [
                'courseName' => $data['courseName'],
                'belongTeacherId' => $belongTeacherId,
                'belongClassId' => $belongClassId,
            ];

            $result = $courseModel->save($courseData, ['id' => $data['id']]);
            if (!$result) {
                return json(['msg' => '新增失败'], 203);
            }
            return json(['msg' => '修改成功'], 200);

            /*删除数据*/
        } else if ($request->isDelete()) {
            $id = $request->delete('id');
            $result = $courseModel->where('id', $id)->delete();
            if (!$result) {
                return json(['msg' => '删除失败'], 203);
            }
            return json(['msg' => '删除成功'], 204);
        }
        return 0;
    }

    /*显示新建试卷的界面*/
    public function examName()
    {
        return view('admin@/Course/examname');
    }

    /*通过科目名获取id*/
    public function getCourse(Request $request){
        /*通过试卷名获取到科目id 如果没有则需要创建*/
        /*获取科目id*/
        $belongCourseId = model('Course')
            ->field('id')
            ->where('courseName', $request->post('courseName'))
            ->find()['id'];
        /*如果科目id不存在*/
        if (!$belongCourseId) {
            return false;
        }
         return $belongCourseId;
    }

    /*创建试卷*/
    public function paperAdd(Request $request){
        $data = $request->post();
        $data['createTime'] = time();
        /*获取科目id*/
        $belongCourseId =  $this->getCourse($request);
        if($belongCourseId){
            $data['belongCourseId'] = $belongCourseId;
        }else{
            return json(['msg' => '科目不存在，请先添加科目'],203);
        }
        /*新建试卷 返回试卷id*/
        $paperModel = model('Paper');
        $result = $paperModel->save($data);
        if(!$result){
            return json(['msg' => '试卷创建失败'],203);
        }
        $paperId =  $paperModel->id;
        return json(['msg' => '创建成功，请添加试题', 'data' => $paperId],200);
    }

    /*编辑试卷处理*/
    public function paperEdit(Request $request){
        if($request->isPut()){
            $data = $request->put();
            $data['createTime'] = time();
            /*获取科目id*/
            $belongCourseId =  $this->getCourse($request);
            if($belongCourseId){
                $data['belongCourseId'] = $belongCourseId;
            }else{
                return json(['msg' => '科目不存在，请先添加科目'],203);
            }
            /*新建试卷 返回试卷id*/
            $paperModel = model('Paper');
            $result = $paperModel->save($data,['id' => $data['id']]);
            if(!$result){
                return json(['msg' => '试卷修改失败'],203);
            }
            $paperId =  $paperModel->id;
            return json(['msg' => '试卷修改成功', 'data' => $paperId],200);
        }

        if($request->isDelete()){
            $id = $request->delete('id');
            $ret = model('Paper')->where('id',$id)->delete();
            if(!$ret){
                return json(['msg' => '试卷删除失败'],203);
            }
            return json(['msg' => '删除成功'],200);
        }
    }

    /*题目*/
    /*处理选择题*/
    public function singleAdd(Request $request){
        $data  =  $request->post();

        foreach($data as  $key => $item)
        {
            /*获取当前的题目的id*/
            $reg = '/\d+/';
            preg_match_all($reg,$key,$arr);
            $id = implode($arr[0]);

            /*判断标题是否为空*/
            if($item['title'] == ''){
                return json(['msg' => '选择题第'.$id.' 题标题不能为空'],203);
            }

            /*判断选项是否为空 因为选项是数组所以需要循环*/
            foreach($item['option'] as $optionVal){
                if($optionVal === ''){
                    return json(['msg' => '选择题第 '.$id.' 题选项不能为空'],203);
                }
            }
            /*判断正确选项是否为空*/
            if($item['optionTrue'] == ''){
                return json(['msg' => '选择题第'.$id.' 题正确选项不能为空'],203);
            }

            /*转成json数据*/
            $data[$key]['option'] = json_encode($item['option']);
        }
        //批量保存数据到数据库
        $singleModel = model('Single');
        $result = $singleModel->saveAll($data);
        if(!$result){
            return json(['msg' => '选择题创建失败'],203);
        }
        return json(['msg' => '选择题创建成功'],200);
    }

    /*多选题*/
    public function multipleAdd(Request $request){
        $data  =  $request->post();
        foreach($data as  $key => $item)
        {

            /*h获取到当前题目id*/
            preg_match_all('/\d+/',$key,$arr);
            $id = implode($arr[0]);

            foreach ($item['optionTrue'] as $key2 => $val){
                $item['optionTrue'][$key2] = substr($val,-1);
            }


            /*验证标题*/
            if(empty($item['title'])){
                return json(['msg' => '多择题第'.$id.' 题标题不能为空'],203);
            }

            /*判断选项是否为空 因为选项是数组所以需要循环*/
            foreach($item['option'] as $optionVal) {
                if ($optionVal === '') {
                    return json(['msg' => '多择题第 ' . $id . ' 题选项不能为空'], 203);
                }
            }

            /*验证正确选项是否为空*/
            if(empty($item['optionTrue'])){
                return json(['msg' => '多择题第'.$id.' 题正确选项不能为空'],203);
            }

            $data[$key]['option'] = json_encode($item['option']);
            $data[$key]['optionTrue'] = json_encode($item['optionTrue']);
        }

        //批量保存数据到数据库
        $multipleModel = model('multiple');
        $result = $multipleModel->saveAll($data);
        if(!$result){
            return json(['msg' => '多选题创建失败'],203);
        }
        return json(['msg' => '多择题创建成功'],200);
    }
    /*判断题*/
    public function judgmentAdd(Request $request){
        $data  =  $request->post();
        //批量保存数据到数据库
        $judgmentModel = model('judgment');

        foreach ($data as $key => $item) {
            /*使用正则获取id*/
            preg_match_all('/\d+/', $key,$arr);
            $id = implode($arr[0]);

            /*验证标题*/
            if(empty($item['title'])){
                return json(['msg' => '判断题第'.$id.' 题目不能为空'],203);
            }
            /*验证选项*/
            if(empty($item['optionTrue'])){
                return json(['msg' => '判断题第'.$id.' 正确选项不能为空'],203);
            }
        }
        $result = $judgmentModel->saveAll($data);
        if(!$result){
            return json(['msg' => '判断题创建失败'],203);
        }
        return json(['msg' => '判断题创建成功'],200);
    }

    /*处理试卷事件*/
    public function examAdd(Request $request)
    {
        if ($request->isPost()) {
            /*获取到全部数据*/
            $data = $request->post();

            return view('admin@/Course/examAdd', $data);
        }

    }

    /*上传科目logo 返回logo路径*/
    public function  upload(Request $request){
        $image =  Image::open($request->file('file'));
        $fileName = '/static/home/images/courseLogo/'.time().'.jpg';
        $image->save('.'.$fileName);
        return  json($fileName);
    }
}
