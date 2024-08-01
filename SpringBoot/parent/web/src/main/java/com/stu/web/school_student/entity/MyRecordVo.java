package com.stu.web.school_student.entity;

import lombok.Data;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * @ClassName: RecordVO
 * @Description: Description of the class file
 * @author: Yansomia
 * @date: 2024/4/14 15:49
 */
@Data
public class MyRecordVo {
    private Long recordId;
    private String title;
    private String type; // 0: reward, 1: punish
    private String subType; // 0: scholarship, 1: certification, 2: match, 3:
    private String recordContent;
    private String year;
    private Date createTime;
    private List<String> studentNames = new ArrayList<>();
}
