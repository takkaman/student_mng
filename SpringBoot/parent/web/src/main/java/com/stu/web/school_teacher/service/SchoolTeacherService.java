package com.stu.web.school_teacher.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.stu.web.school_teacher.entity.SchoolTeacher;
import com.stu.web.school_teacher.entity.TeacherStatsVo;
import com.stu.web.stu_points.entity.StuPoints;

import java.util.List;

public interface SchoolTeacherService extends IService<SchoolTeacher> {
    void addTeacher(SchoolTeacher teacher);
    void editTeacher(SchoolTeacher teacher);
    void deleteTeacher(Long teacherId);
    void savePoint(List<StuPoints> list, Long classId, Long courseId);
    TeacherStatsVo getTeacherStats(Long teacherId);
    Long getAccCourseDuration(Long teacherId);
}
