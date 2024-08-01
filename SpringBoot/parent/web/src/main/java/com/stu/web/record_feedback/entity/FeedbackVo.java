package com.stu.web.record_feedback.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import java.util.Date;

/**
 * @ClassName: RecordVO
 * @Description: Description of the class file
 * @author: Yansomia
 * @date: 2024/4/14 15:49
 */
@Data
public class FeedbackVo {
    private Long recordFeedbackId;
    private Long recordId;
    private String title;
    private String type; // 0: reward, 1: punish
    private String subType; // 0: scholarship, 1: certification, 2: match, 3:
    private String recordContent;
    private String stuId;
    private String stuName;
    private String year;
    private String studentFeedback;
    private String adminFeedback;
    private int status;
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    private Date createTime;
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    private Date updateTime;
}
