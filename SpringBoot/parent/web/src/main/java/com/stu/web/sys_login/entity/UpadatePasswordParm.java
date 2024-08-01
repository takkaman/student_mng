package com.stu.web.sys_login.entity;

import lombok.Data;

@Data
public class UpadatePasswordParm {
    private Long userId;
    private String userType;
    private String oldPassword;
    private String newPassword;
}
