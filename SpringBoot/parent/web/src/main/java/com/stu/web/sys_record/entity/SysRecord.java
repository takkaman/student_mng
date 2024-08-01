package com.stu.web.sys_record.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import java.util.Date;

@Data
@TableName("sys_record")
public class SysRecord {
    @TableId(type = IdType.AUTO)
    private Long recordId;
    private String title;
    private String type; // 0: reward, 1: punish
    private String subType; // 0: scholarship, 1: certification, 2: match, 3:
    private String recordContent;
    private String year;
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss",timezone = "GMT+8")
    private Date createTime;
}
