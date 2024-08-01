package com.stu.web.class_course.entity;

import lombok.Data;

@Data
public class TeacherCourseVo {
    private Long currentPage;
    private Long pageSize;
    private Long teacherId;
    private String className;
    private String courseName;
    private String courseYear;
}
