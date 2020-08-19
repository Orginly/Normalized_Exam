<?php

namespace app\home\controller;

use think\Controller;
use think\Db;
use think\Request;

class Paper extends Controller
{
    public function index($id)
    {
        /*通过id获取到试卷*/
        $paperModel = model('Paper');
        $singleModel = model('Single');
        $multipleModel = model('multiple');
        $judgmentModel = model('judgment');

        /*获取id = $id的试卷*/
        $paperData = $paperModel
            ->alias('paper')
            ->where('id', $id)
            ->find();

        /*获取到id = $id 的选择题*/
        $single = $singleModel
            ->where('belongPaperId', $id)
            ->select();


        foreach ($single as $key => $item) {
            $item['option'] = json_decode($item['option']);
        }

        $multiple = $multipleModel
            ->where('belongPaperId', $id)
            ->select();

        foreach ($multiple as $key => $item) {
            $item['option'] = json_decode($item['option']);
        }

        $judgment = $judgmentModel
            ->where('belongPaperId', $id)
            ->select();


        $singleCount   = count($single);
        $singleTotal   = !empty($single) ? count($single) * $single[0]['score'] : 0;
        $judgmentCount = count($judgment);
        $judgmentTotal = !empty($judgment) ? count($judgment) * $judgment[0]['score'] : 0;
        $multipleCount = count($multiple);
        $multipleTotal = !empty($multiple) ? count($multiple) * $multiple[0]['score'] : 0;


        $data = [
            'paper' => $paperData,
            'single' => $single,
            'multiple' => $multiple,
            'judgment' => $judgment,
            'singleCount' => $singleCount,
            'singleTotal' => $singleTotal,
            'judgmentCount' => $judgmentCount,
            'judgmentTotal' => $judgmentTotal,
            'multipleCount' => $multipleCount,
            'multipleTotal' => $multipleTotal,

        ];


        return view('home@/Paper/paper', $data);
    }

    /*处理表单提交的数据*/
    public function submit(Request $request, $id)
    {
        $data = $request->post();

        $singleModel = model('Single');
        $multipleModel = model('Multiple');
        $judgmentModel = model('Judgment');
        $gradeModel = model('Grade');
        $paperModel = model('Paper');
        $courseModel = model('Course');

        /*初始化总分数*/
        $singleScore = 0;
        $multipleScore = 0;
        $judgmentScore = 0;
        $singleErr   = 0;         //错题数量
        $multipleErr   = 0;         //错题数量
        $judgmentErr   = 0;         //错题数量
        $questErr   = 0;         //错题数量
        $totalTime   = $data['totalTime'];         //考试已用时间
        $totalScore = 0;

        if(empty($data['singleOption']) || empty($data['judgmentOption']) || empty($data)){
            return $this->error('调皮？不能交空卷！');
        }


        /*获取到single 用户答案 下标为题目id*/
        $single = $data['singleOption'];
        $judgment = $data['judgmentOption'];
        unset($data['singleOption']);
        unset($data['judgmentOption']);
        unset($data['totalTime']);
        $multiple = $data;

        /*获取到单选题的正确答案*/
        $singleData = $singleModel
            ->where('belongPaperId', $id)
            ->select();


        /*验证单选题是否正确*/
        foreach ($singleData as $itemTrue) {
            foreach ($single as $key => $item) {
                /*找到下标id 与 数据题目id相等的 然后判断数据是否正确*/
                if ($key == $itemTrue['id']){
                    /*如果数据和数据库中的数据相等 维护成绩单表*/
                    if($itemTrue['optionTrue'] == $item) {
                        $singleScore += $itemTrue['score'];
                    }else{
                        $singleErr += 1;
                    }
                }
            }
        }


        /*验证判断题是否正确*/
        $judgmentData = $judgmentModel
            ->where('belongPaperId',$id)
            ->select();
        foreach ($judgmentData as $itemTrue){
            foreach ($judgment as $key => $item){
                if($itemTrue['id'] == $key){
                    if($item == $itemTrue['optionTrue']){
                        $judgmentScore += $itemTrue['score'];
                    }else{
                        $judgmentErr += 1;
                    }
                }

            }
        }

        //验证多选题是否正确
        $multipleData = $multipleModel
            ->where('belongPaperId',$id)
            ->select();

        /*先把正确答案json格式化*/
        foreach($multipleData as $itemTrue){
            $itemTrue['optionTrue'] = json_decode($itemTrue['optionTrue']);
            /*循环用户输入的数据*/
            foreach ($multiple as $key => $item){
                /*使用正则表达式获取数组名中的数字*/
                $reg='/\d+/';
                preg_match_all($reg,$key,$multipleId);
                $multipleId =  implode($multipleId[0]);
                if($itemTrue['id'] == $multipleId){
                    /*使用array.diff函数来比较数组 如果完全匹配返回空数组*/
                   $result = array_diff($itemTrue['optionTrue'],$item);
                   if(!$result){
                       $multipleScore += $itemTrue['score'];
                   }else{
                       $multipleErr += 1;
                   }
                }
            }
        }
       // dump($multiple);

        //获取试卷数据
        $paperData = $paperModel->where('id',$id)->find();

        /*获取到所属试卷的科目*/
        $courseName = $courseModel->where('id',$paperData['belongCourseId'])->find();

        $grade = [
            'belongPaperId' => $id,
            'paperName' => $paperData['paperName'],
            'courseName' => $courseName['courseName'],
            'studentId' => session('studentId'),
            'singleScore'=> $singleScore,
            'singleCount'=> count($singleData),
            'multipleScore'=> $multipleScore,
            'multipleCount'=> count($multipleData),
            'judgmentScore'=> $judgmentScore,
            'judgmentCount'=> count($judgmentData),
            'singleErr' => $singleErr,
            'multipleErr' => $multipleErr,
            'judgmentErr' => $judgmentErr,
            'questErr' => $singleErr + $multipleErr + $judgmentErr,
            'totalTime' => $totalTime,
            'totalScore' => $singleScore + $multipleScore + $judgmentScore,
            'accuracy' => ((count($singleData) + count($multipleData) + count($judgmentData)) - ($singleErr + $judgmentErr + $multipleErr)) / (count($singleData) + count($multipleData) + count($judgmentData)) * 100 //正确率  正确数量 / 总题数
        ];


        /*验证成功保存考试记录到数据库*/

        $gradeRet = $gradeModel
            ->save($grade);
        $gradeId = $gradeModel->id;

        /*试卷考试次数加一
        inc自加*/
       Db::table('tp_paper')
           ->where('id',$id)
           ->inc('examCount')
           ->update();


        return view('home@/Exam/grade',$grade);

    }
}
