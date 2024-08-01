package com.stu.web.record_feedback.entity;

import lombok.Data;

@Data
public class FeedbackListParm {
    private Long currentPage;
    private Long pageSize;
    private String type;
    private String title;
}
