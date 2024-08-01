package com.stu.web.class_course.entity;


import lombok.Data;

@Data
public class ClassCourseVo {
    private Long classCourseId;
    private Long classId;
    private Long courseId;
    private String className;
    private String courseName;
    private String courseYear;
    private String type;
}