package com.stu.web.sys_notice.entity;

import lombok.Data;

@Data
public class NoticeListParm {
    private Long currentPage;
    private Long pageSize;
    private String title;
}
