package com.stu.web.school_major.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

@Data
@TableName("school_major")
public class SchoolMajor {
    @TableId(type = IdType.AUTO)
    private Long majorId;
    private Long collegeId;
    private String majorName;
    //排除学院名称
    @TableField(exist = false)
    private String collegeName;
    private Integer orderNum;
}
