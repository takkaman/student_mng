package com.stu.web.school_student.entity;

import lombok.Data;

@Data
public class RecordParm {
    private Long currentPage;
    private Long pageSize;
    private Long stuId;
    private String title;
    private String type;
}
