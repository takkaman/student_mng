package com.stu.web.sys_login.entity;

import lombok.Data;

@Data
public class LoginResult {
    private Long userId;
    private String username;
    private String token;
    private String userType;
}