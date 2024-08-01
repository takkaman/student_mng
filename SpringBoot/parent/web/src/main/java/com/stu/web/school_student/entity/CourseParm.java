package com.stu.web.school_student.entity;

import lombok.Data;

@Data
public class CourseParm {
    private Long currentPage;
    private Long pageSize;
    private Long stuId;
    private String courseName;
}
