<?php

namespace app\admin\controller;

use think\Controller;
use think\Request;

class Users extends Controller
{
    public function student()
    {
        return view('admin@/Users/student');
    }

    /*学生数据*/
    public function studentData(Request $request)
    {
        $studentModel = model('Student');
        if ($request->isGet()) {
            $studentData = $studentModel
                ->alias('student')
                ->field('student.*,class.className')
                ->leftJoin('class', 'student.belongClassId = class.id')
                ->select();
            if (!$studentData) {
                return json(['msg' => '获取数据失败'], 203);
            }
            /*格式化时间戳*/
            foreach ($studentData as $value) {
                $value['createTime'] = date('Y-m-d H:m:s', $value['createTime']);
                $value['lastTime'] = date('Y-m-d H:m:s', $value['lastTime']);
            }
            return json(['msg' => '获取学生数据成功', 'data' => $studentData], 200);

            /*添加学生*/
        } else if ($request->isPost()) {
            $data = $request->post();
            if (empty($data['studentId']) || empty($data['username']) || empty($data['className']) || empty($data['password'])) {
                return json(['msg' => '所填数据不能为空'], 203);
            }
            $data['password'] = md5(md5($data['password']));
            $data['createTime'] = time();
            $data['lastTime'] = time();
            //查询所属班级
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
            $data['belongClassId'] = $belongClassId;


            //查询数据库中是否存在用户
            $student = $studentModel
                ->where('studentId', $data['studentId'])
                ->find();
            if ($student) {
                return json(['msg' => '学号已存在!'], 203);
            }
            $result = $studentModel->save($data);
            if (!$result) {
                return json(['msg' => '注册失败!'], 200);
            }
            return json(['msg' => '注册成功!'], 200);

            /*修改数据*/
        } else if ($request->isPut()) {
            $data = $request->put();
            if (!empty($data['password'])) {
                $data['password'] = md5(md5($data['password']));
            }
            /*检查数据*/
            if (empty($data['studentId']) || empty($data['username']) || empty($data['className'])) {
                return json(['msg' => '所填数据不能为空'], 203);
            }
            /*通过id查找更新用户数据*/
            $result = $studentModel->save($data, ['id' => $data['id']]);
            if (!$result) {
                return json(['msg' => '修改失败!'], 203);
            }
            return json(['msg' => '修改成功!'], 200);

            /*删除数据*/
        } else if ($request->isDelete()) {
            $id = $request->delete('id');
            $result = $studentModel
                ->where('id', $id)
                ->delete();
            if (!$result) {
                return json(['msg' => '删除失败!'], 203);
            }
            return json(['msg' => '删除成功!'], 204);
        }
    }

    public function teacher()
    {
        return view('admin@/Users/teacher');
    }
    public function teacherData(Request $request)
    {
        $teacherModel = model('Teacher');
        if ($request->isGet()) {
            $teacherData = $teacherModel
                ->alias('teacher')
                ->field('teacher.*,class.className')
                ->leftJoin('class', 'teacher.belongClassId = class.id')
                ->select();
            if (!$teacherData) {
                return json(['msg' => '获取数据失败'], 203);
            }
            /*格式化时间戳*/
            foreach ($teacherData as $value) {
                $value['lastTime'] = date('Y-m-d H:m:s', $value['lastTime']);
            }
            return json(['msg' => '获取学生数据成功', 'data' => $teacherData], 200);

            /*添加学生*/
        } else if ($request->isPost()) {
            $data = $request->post();
            if (empty($data['teacherName']) || empty($data['username']) || empty($data['className']) || empty($data['password'])) {
                return json(['msg' => '所填数据不能为空'], 203);
            }
            $data['password'] = md5(md5($data['password']));
            $data['createTime'] = time();
            $data['lastTime'] = time();
            //查询所属班级
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
            $data['belongClassId'] = $belongClassId;

            //查询数据库中是否存在用户
            $student = $teacherModel
                ->where('username', $data['username'])
                ->find();
            if ($student) {
                return json(['msg' => '用户名已存在!'], 203);
            }
            $result = $teacherModel->save($data);
            if (!$result) {
                return json(['msg' => '新增失败!'], 200);
            }
            return json(['msg' => '新增成功!'], 201);

            /*修改数据*/
        } else if ($request->isPut()) {
            $data = $request->put();
            if (!empty($data['password'])) {
                $data['password'] = md5(md5($data['password']));
            }
            /*检查数据*/
            if (empty($data['teacherName']) || empty($data['username']) || empty($data['className'])) {
                return json(['msg' => '所填数据不能为空'], 203);
            }
            /*通过id查找更新用户数据*/
            $result = $teacherModel->save($data, ['id' => $data['id']]);
            if (!$result) {
                return json(['msg' => '修改失败!'], 203);
            }
            return json(['msg' => '修改成功!'], 200);

            /*删除数据*/
        } else if ($request->isDelete()) {
            $id = $request->delete('id');
            $result = $teacherModel
                ->where('id', $id)
                ->delete();
            if (!$result) {
                return json(['msg' => '删除失败!'], 203);
            }
            return json(['msg' => '删除成功!'], 204);
        }
    }
}
