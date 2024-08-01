package com.stu.web.stu_points.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.math.BigDecimal;

@Data
@TableName("stu_points")
public class StuPoints {
    @TableId(type = IdType.AUTO)
    private Long pointId;
    private Long stuId;
    private Long courseId;
    private Long classId;
    private BigDecimal point;
}
