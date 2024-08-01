package com.stu.web.school_course.entity;

import lombok.Data;

@Data
public class CourseListParm {
    private Long currentPage;
    private Long pageSize;
    private String courseName;
}
