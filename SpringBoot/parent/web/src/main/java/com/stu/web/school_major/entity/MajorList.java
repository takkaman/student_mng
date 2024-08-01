package com.stu.web.school_major.entity;

import lombok.Data;

@Data
public class MajorList {
   private Long currentPage;
   private Long pageSize;
   private String collegeName;
   private String majorName;
}
