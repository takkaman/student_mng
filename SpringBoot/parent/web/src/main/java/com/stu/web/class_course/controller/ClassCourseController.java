package com.stu.web.class_course.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.stu.utils.ResultUtils;
import com.stu.utils.ResultVo;
import com.stu.web.class_course.entity.ClassCourse;
import com.stu.web.class_course.entity.ClassCourseVo;
import com.stu.web.class_course.entity.ClassTree;
import com.stu.web.class_course.entity.ParmListVo;
import com.stu.web.class_course.service.ClassCourseService;
import com.stu.web.course_teacher.entity.CourseTeacher;
import com.stu.web.course_teacher.service.CourseTeacherService;
import com.stu.web.school_class.entity.SchoolClass;
import com.stu.web.school_class.service.SchoolClassService;
import com.stu.web.school_course.entity.SchoolCourse;
import com.stu.web.school_course.service.SchoolCourseService;
import com.stu.web.school_major.entity.SchoolMajor;
import com.stu.web.school_major.service.SchoolMajorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

@RestController
@RequestMapping("/api/classCourse")
public class ClassCourseController {
    @Autowired
    private SchoolMajorService schoolMajorService;
    @Autowired
    private SchoolClassService schoolClassService;
    @Autowired
    private SchoolCourseService schoolCourseService;

    @Autowired
    private ClassCourseService classCourseService;
    @Autowired
    private CourseTeacherService courseTeacherService;

    //删除
    @DeleteMapping("/{classCourseId}")
    public ResultVo delete(@PathVariable("classCourseId") Long classCourseId){
        classCourseService.removeById(classCourseId);
        return ResultUtils.success("删除成功");
    }

    //班级课程
    @GetMapping("/getClassCourse")
    public ResultVo getClassCourse(ParmListVo parmListVo){
        IPage<ClassCourseVo> list = classCourseService.getCourseList(parmListVo);
        return ResultUtils.success("查询成功",list);
    }

    //分配课程保存
    @PostMapping("/saveCourse")
    public ResultVo saveCourse(@RequestBody List<ClassCourse> list){
        for (int i=0;i<list.size();i++){
            QueryWrapper<CourseTeacher> query = new QueryWrapper<>();
            query.lambda().eq(CourseTeacher::getCourseId,list.get(i).getCourseId());
            CourseTeacher courseTeacher = courseTeacherService.getOne(query);
            list.get(i).setTeacherId(courseTeacher.getTeacherId());
        }
        classCourseService.saveBatch(list);
        return ResultUtils.success("分配成功!");
    }

    //查询课程列表
    @GetMapping("/getCourseList")
    public ResultVo getCourseList(){
        List<SchoolCourse> list = schoolCourseService.list();
        return ResultUtils.success("查询成功",list);
    }

    @GetMapping("/getClassTree")
    public ResultVo getClassTree(){
        //查询所有的专业
        QueryWrapper<SchoolMajor> qeury = new QueryWrapper<>();
        qeury.lambda().orderByAsc(SchoolMajor::getOrderNum);
        //专业列表
        List<SchoolMajor> majorList = schoolMajorService.list(qeury);
        //返回值
        List<ClassTree> vo = new ArrayList<>();
        if(majorList.size() >0){
            for (int i=0;i<majorList.size();i++){
                ClassTree tree = new ClassTree();
                Random random = new Random();
                tree.setClassId(majorList.get(i).getMajorId()+random.nextLong());
                tree.setClassName(majorList.get(i).getMajorName());
                tree.setType("0");
                //查询专业下面的班级
                QueryWrapper<SchoolClass> classqury = new QueryWrapper<>();
                classqury.lambda().eq(SchoolClass::getMajorId,majorList.get(i).getMajorId());
                List<ClassTree> children = new ArrayList<>();
                List<SchoolClass> classList = schoolClassService.list(classqury);
                if(classList.size()>0){
                    for (int j=0;j<classList.size();j++){
                        ClassTree treevo = new ClassTree();
                        treevo.setType("1");
                        treevo.setClassName(classList.get(j).getClassName());
                        treevo.setClassId(classList.get(j).getClassId());
                        children.add(treevo);
                    }
                }
                tree.setChildren(children);
                vo.add(tree);
            }
        }
        return ResultUtils.success("查询成功",vo);
    }
}
