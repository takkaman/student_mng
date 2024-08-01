package com.stu.web.school_teacher.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.stu.web.school_teacher.entity.SchoolTeacher;
import com.stu.web.school_teacher.entity.TeacherStatsVo;
import org.apache.ibatis.annotations.Param;

public interface SchoolTeacherMapper extends BaseMapper<SchoolTeacher> {
    TeacherStatsVo getTeacherStats(@Param("teacherId") Long teacherId);
    Long getAccCourseDuration(@Param("teacherId") Long teacherId);
}
