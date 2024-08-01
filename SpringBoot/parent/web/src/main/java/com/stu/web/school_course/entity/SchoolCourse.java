package com.stu.web.school_course.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

@Data
@TableName("school_course")
public class SchoolCourse {
    @TableId(type = IdType.AUTO)
    private Long courseId;
    @TableField(exist = false)
    private Long teacherId;
    @TableField(exist = false)
    private String teacherName;
    private String courseName;
    private String credit;
    private String duration;
    private String courseDesc;
}
