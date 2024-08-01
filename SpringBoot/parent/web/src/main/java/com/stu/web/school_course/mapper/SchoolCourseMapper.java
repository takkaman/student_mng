package com.stu.web.school_course.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.stu.web.school_course.entity.CourseListParm;
import com.stu.web.school_course.entity.SchoolCourse;
import org.apache.ibatis.annotations.Param;

public interface SchoolCourseMapper extends BaseMapper<SchoolCourse> {
    IPage<SchoolCourse> getCourseList(IPage<SchoolCourse> page,@Param("parm") CourseListParm parm);
}
