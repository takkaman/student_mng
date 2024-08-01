package com.stu.web.record_feedback.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.util.Date;

@Data
@TableName("record_feedback")
public class RecordFeedback {
    @TableId(type = IdType.AUTO)
    private Long recordFeedbackId;
    private Long stuId;
    private Long recordId;
    private String type;
    private int status; // 0: processing 1: approved 2: rejected
    private String studentFeedback;
    private String adminFeedback;
    private Date createTime;
    private Date updateTime;
}
