<?php
// +----------------------------------------------------------------------
// | ThinkPHP [ WE CAN DO IT JUST THINK ]
// +----------------------------------------------------------------------
// | Copyright (c) 2006~2018 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: liu21st <liu21st@gmail.com>
// +----------------------------------------------------------------------
use think\facade\Route;


Route::get('/','home/Index/index')->name('index');
Route::group('index',function () {
    Route::get('','home/Index/index')->name('index');
    Route::get('news', 'home/News/index')->name('news');
    Route::get('course', 'home/Course/index')->name('course')->middleware('CheckLogin');
    Route::get('exam', 'home/Exam/index')->name('exam')->middleware('CheckLogin');
    Route::get('examRecord', 'home/Exam/examRecord')->name('exam')->middleware('CheckLogin');

    Route::get('paper/:id','home/Paper/index')->middleware('CheckLogin');
    Route::post('paper/:id','home/Paper/submit')->middleware('CheckLogin');

    Route::post('register','home/Login/register')->name('register');
    Route::post('login','home/Login/login')->name('login');
    Route::get('logout','home/Login/logout')->name('logout')->middleware('CheckLogin');

    /*验证码*/
    Route::get('verify','home/Login/verify')->name('verify');
});

Route::group('admin',function (){
    Route::get('login','admin/Login/index')->name('admin/login');
    Route::post('login','admin/Login/login');
    Route::get('logout','admin/Login/logout')->middleware('adminLoginCheck');
    Route::get('','admin/Index/index')->name('admin/index')->middleware('adminLoginCheck');
    Route::get('index','admin/Index/index')->name('admin/index')->middleware('adminLoginCheck');
    Route::get('course','admin/Course/index')->name('admin/course')->middleware('adminLoginCheck');
    Route::get('coursedata','admin/Course/course')->middleware('adminLoginCheck');
    Route::post('coursedata','admin/Course/course')->middleware('adminLoginCheck');
    Route::put('coursedata','admin/Course/course')->middleware('adminLoginCheck');
    Route::delete('coursedata','admin/Course/course')->middleware('adminLoginCheck');
    Route::post('courseUpload','admin/Course/upload')->middleware('adminLoginCheck');

    Route::get('paper','admin/Index/paper')->name('admin/paper')->middleware('adminLoginCheck');
    Route::put('paperEdit','admin/Course/paperEdit')->name('admin/paper')->middleware('adminLoginCheck');
    Route::delete('paperEdit','admin/Course/paperEdit')->name('admin/paper')->middleware('adminLoginCheck');
    Route::post('paper','admin/Index/paper')->name('admin/paper')->middleware('adminLoginCheck');

    Route::get('examAdd','admin/Course/examAdd')->name('admin/examAdd')->middleware('adminLoginCheck');
    Route::post('examAdd','admin/Course/examAdd')->middleware('adminLoginCheck');
    Route::get('examname','admin/Course/examName')->name('admin/examName')->middleware('adminLoginCheck');
    Route::post('getCourse','admin/Course/getCourse')->middleware('adminLoginCheck');
    Route::post('paperAdd','admin/Course/paperAdd')->middleware('adminLoginCheck');
    Route::post('singleAdd','admin/Course/singleAdd')->middleware('adminLoginCheck');
    Route::post('multipleAdd','admin/Course/multipleAdd')->middleware('adminLoginCheck');
    Route::post('judgmentAdd','admin/Course/judgmentAdd')->middleware('adminLoginCheck');
    Route::post('questionPost','admin/Course/questionPost')->middleware('adminLoginCheck');



    Route::get('student','admin/Users/student')->name('admin/student')->middleware('adminLoginCheck');
    Route::get('studentdata','admin/Users/studentdata')->middleware('adminLoginCheck');
    Route::post('studentdata','admin/Users/studentdata')->middleware('adminLoginCheck');
    Route::put('studentdata','admin/Users/studentdata')->middleware('adminLoginCheck');
    Route::delete('studentdata','admin/Users/studentdata')->middleware('adminLoginCheck');

    Route::get('teacher','admin/Users/teacher')->name('admin/teacher')->middleware('adminLoginCheck');
    Route::get('teacherdata','admin/Users/teacherdata')->middleware('adminLoginCheck');
    Route::post('teacherdata','admin/Users/teacherdata')->middleware('adminLoginCheck');
    Route::put('teacherdata','admin/Users/teacherdata')->middleware('adminLoginCheck');
    Route::delete('teacherdata','admin/Users/teacherdata')->middleware('adminLoginCheck');

    Route::get('news','admin/News/index')->name('admin/news')->middleware('adminLoginCheck');
    Route::get('newAdd','admin/News/addShow')->name('admin/addShow')->middleware('adminLoginCheck');
    Route::get('getCourse','admin/News/getCourse')->middleware('adminLoginCheck');
    Route::post('news','admin/News/news')->middleware('adminLoginCheck');
    Route::put('news','admin/News/news')->middleware('adminLoginCheck');
    Route::delete('news','admin/News/news')->middleware('adminLoginCheck');
    Route::get('getnews','admin/News/news')->middleware('adminLoginCheck');

    Route::get('newsedit/:id','admin/News/newsEditShow')->middleware('adminLoginCheck');
    Route::get('newseditdata/:id','admin/News/newsEdit')->middleware('adminLoginCheck');
    Route::put('newseditdata','admin/News/newsEdit')->middleware('adminLoginCheck');

    /*验证码*/
    Route::get('verify','admin/Login/verify')->name('verify');
});
