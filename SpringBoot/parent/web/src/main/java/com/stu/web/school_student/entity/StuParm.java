package com.stu.web.school_student.entity;

import lombok.Data;

@Data
public class StuParm {
    private Long currentPage;
    private Long pageSize;
    private String classId;
    private String collegeId;
    private String majorId;
    private String collegeName;
    private String majorName;
    private String className;
    private String stuName;
}
