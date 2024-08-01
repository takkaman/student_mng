package com.stu.web.school_course.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;
import com.stu.web.school_course.entity.CourseListParm;
import com.stu.web.school_course.entity.SchoolCourse;

public interface SchoolCourseService extends IService<SchoolCourse> {
     IPage<SchoolCourse> getCourseList(CourseListParm parm);
}
