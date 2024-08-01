package com.stu.web.sys_record.entity;

import lombok.Data;

@Data
public class RecordListParm {
    private Long currentPage;
    private Long pageSize;
    private String title;
    private String type;
    private String subType;
    private String year;
    private String stuId;
}
