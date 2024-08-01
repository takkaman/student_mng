package com.stu.web.class_course.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.stu.web.class_course.entity.ClassCourse;
import com.stu.web.class_course.entity.ClassCourseVo;
import com.stu.web.class_course.entity.ParmListVo;
import com.stu.web.class_course.entity.TeacherCourseVo;
import org.apache.ibatis.annotations.Param;

public interface ClassCourseMapper extends BaseMapper<ClassCourse> {
     IPage<ClassCourseVo> getCourseList(IPage<ClassCourseVo> page, @Param("parm") ParmListVo parm);
     IPage<ClassCourse> getTeacherCourse(IPage<ClassCourse> page, @Param("parm") TeacherCourseVo parm);
}
