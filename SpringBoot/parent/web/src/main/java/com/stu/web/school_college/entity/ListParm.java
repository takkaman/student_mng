package com.stu.web.school_college.entity;

import lombok.Data;

@Data
public class ListParm {
    private Long currentPage;
    private Long pageSize;
    private String collegeName;
}
