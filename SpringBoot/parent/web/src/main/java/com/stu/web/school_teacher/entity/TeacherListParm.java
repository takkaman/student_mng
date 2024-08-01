package com.stu.web.school_teacher.entity;

import lombok.Data;


@Data
public class TeacherListParm {
    private Long currentPage;
    private Long pageSize;
    private String teacherName;
}
