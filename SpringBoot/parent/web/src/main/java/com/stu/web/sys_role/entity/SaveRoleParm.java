package com.stu.web.sys_role.entity;

import lombok.Data;

import java.util.List;

@Data
public class SaveRoleParm {
    private Long roleId;
    private List<Long> list;
}
