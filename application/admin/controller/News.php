<?php

namespace app\admin\controller;

use think\Controller;
use think\Request;

class News extends Controller
{
    public function index(){
        return view('admin@/News/index');
    }
    public function addShow(){
        return view('admin@/News/add');
    }

    /*获取科目信息*/
    public function getCourse(){
       return json(['msg' =>'获取成功', 'data' =>  model('Course')->select()]);
    }

    /*添加删除*/
    public function news(Request $request){
        /*获取所有要点数据*/
        if($request->isGet())
        {
            $newsModel = model('News');
            $data = $newsModel
                ->alias('news')
                ->field('news.*,course.courseName')
                ->leftJoin('course','course.id = news.belongCourseId')
                ->select();

            if(!$data){
                return json(['msg' => '获取文章失败'],204);
            }
            return json(['msg' => '获取文章成功','data' => $data],200);
        }

        /*添加要点*/
        if($request->isPost()){
            $data = $request->post();
            $data['createTime'] = time();
            /*保存数据到数据库*/
            $newsModel = model('News');
            $ret = $newsModel->save($data);
            if(!$ret){
                return json(['msg' => '发布文章失败'],204);
            }
            return json(['msg' => '发布文章成功'],201);
        }

        if($request->isDelete()){
            $id = $request->delete('id');
            $newsModel = model('News');
            $ret = $newsModel->where('id',$id)->delete();
            if(!$ret){
                return json(['msg' => '删除文章失败'],204);
            }
            return json(['msg' => '删除文章成功'],200);
        }
    }


    /*显示修改文章页面 并复制id 到 vueData中*/
    public function newsEditShow($id){
        return view('admin@/News/edit',['id' => $id]);
    }

    public function newsEdit(Request $request,$id){
        $newsModel = model('News');
        if($request->isGet()) {
            /*获取原文章*/
            $rawData = $newsModel->where('id', $id)->find();
            if (!$rawData) {
                return json(['msg' => '获取文章失败'], 204);
            }
            return json(['msg' => '获取文章成功', 'data' => $rawData], 200);
        }

        if($request->isPut()){
            $data = $request->put();
            /*保存修改的数据*/
            $ret = $newsModel->save($data,['id' => $data['id']]);
            if(!$ret){
                return json(['msg' => '修改文章失败'],204);
            }
            return json(['msg' => '修改文章成功'],200);
        }
    }

}
