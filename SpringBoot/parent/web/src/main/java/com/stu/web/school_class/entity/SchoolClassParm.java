package com.stu.web.school_class.entity;

import lombok.Data;

@Data
public class SchoolClassParm {
    private Long currentPage;
    private Long pageSize;
    private String collegeName;
    private String majorName;
    private String className;
}
