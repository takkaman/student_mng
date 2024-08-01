package com.stu.web.course_teacher.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.stu.web.course_teacher.entity.CourseTeacher;
import com.stu.web.course_teacher.mapper.CourseTeacherMapper;
import com.stu.web.course_teacher.service.CourseTeacherService;
import org.springframework.stereotype.Service;

@Service
public class CourseTeacherServiceImpl extends ServiceImpl<CourseTeacherMapper, CourseTeacher> implements CourseTeacherService {
}
