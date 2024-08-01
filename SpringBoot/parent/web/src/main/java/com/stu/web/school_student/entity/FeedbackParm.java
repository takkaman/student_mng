package com.stu.web.school_student.entity;

import lombok.Data;

@Data
public class FeedbackParm {
    private Long currentPage;
    private Long pageSize;
    private Long stuId;
    private Long recordId;
    private String type;
}
