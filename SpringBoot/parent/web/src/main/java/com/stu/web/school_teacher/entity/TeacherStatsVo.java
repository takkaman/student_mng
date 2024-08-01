package com.stu.web.school_teacher.entity;

import lombok.Data;


@Data
public class TeacherStatsVo {
    private int courseCount;
    private int classCount;
    private int studentCount;
    private Long durationCount = 0L;
}
