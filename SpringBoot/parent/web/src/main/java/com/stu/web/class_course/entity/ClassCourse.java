package com.stu.web.class_course.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

@Data
@TableName("class_course")
public class ClassCourse {
    @TableId(type = IdType.AUTO)
    private Long classCourseId;
    private Long courseId;
    private Long classId;
    private Long teacherId;
    private String courseYear;
    private String type;
    @TableField(exist = false)
    private String courseName;
    @TableField(exist = false)
    private String className;
    @TableField(exist = false)
    private String classYear;
}
