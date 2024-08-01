package com.stu.web.class_course.entity;

import lombok.Data;

@Data
public class ParmListVo {
    private Long currentPage;
    private Long pageSize;
    private String courseName;
    private String courseYear;
    private String type;
    private String classId;
}