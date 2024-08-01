package com.stu.web.sys_role.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.util.Date;

@Data //自动生成get和set方法
@TableName("sys_role")//表明这个实体类对应这个表
public class SysRole {
    @TableId(type = IdType.AUTO)//设置主键自动递增
    private Long roleId;
    private String roleName;
    private String roleType;
    private String remark;
    private Date createTime;
    private Date updateTime;
}
