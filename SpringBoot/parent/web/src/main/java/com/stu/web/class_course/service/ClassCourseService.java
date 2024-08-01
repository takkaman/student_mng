package com.stu.web.class_course.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;
import com.stu.web.class_course.entity.ClassCourse;
import com.stu.web.class_course.entity.ClassCourseVo;
import com.stu.web.class_course.entity.ParmListVo;
import com.stu.web.class_course.entity.TeacherCourseVo;


/**
 * @Author java实战基地
 * @Version 2383404558
 */
public interface ClassCourseService extends IService<ClassCourse> {
    IPage<ClassCourseVo> getCourseList(ParmListVo parm);
    IPage<ClassCourse> getTeacherCourse(TeacherCourseVo parm);
}
