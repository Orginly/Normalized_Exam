<?php

namespace app\home\controller;

use think\Controller;
use think\Request;

class News extends Controller
{
    public function index(Request $request){
        $newsModel = model('News');
        if(!$request->get('id')) {
            $data = $newsModel->select();
            foreach ($data as $item) {
                $item['createTime'] = date('Y-m-d H:m:s', $item['createTime']);
                $item['desc'] = mb_substr(strip_tags($item['content']), 0, 100);
            }
            return view('home@/News/news', ['data' => $data]);
        }
        /*如果有参数*/
        if($request->get('id')){
            $id = $request->get('id');
            $newsData = $newsModel->select();
            $data = $newsModel->where('id',$id)->find();
            return view('home@/News/index',['data'=> $data,'new' => $newsData]);
        }
    }
}
