package com.stu.web.school_class.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

@Data
@TableName("school_class")
public class SchoolClass {
    @TableId(type = IdType.AUTO)
    private Long classId;
    private Long majorId;
    private String className;
    private String classYear;
    private Integer orderNum;
    @TableField(exist = false)
    private String collegeName;
    @TableField(exist = false)
    private String majorName;
    @TableField(exist = false)
    private Long collegeId;
}
