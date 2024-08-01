package com.stu.web.school_student.entity;

import lombok.Data;

import java.math.BigDecimal;


@Data
public class MyCourseVo {
    private String courseName;
    private String teacherName;
    private String courseYear;
    private String type;
    private BigDecimal point;
    private String credit;
    private String duration;
}
