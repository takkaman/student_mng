package com.stu.web.record_student.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

@Data
@TableName("record_student")
public class RecordStudent {
    @TableId(type = IdType.AUTO)
    private Long recordStudentId;
    private Long stuId;
    private Long recordId;
}
