package com.stu.web.sys_login.entity;

import lombok.Data;

@Data
public class UserInfo {
    private String name;
    private String avatar;  //https://wpimg.wallstcn.com/f778738c-e4f8-4870-b634-56703b4acafe.gif
    private String introduction;
    private Object[] roles;
    private String userNum;
    private String gender;
    private String userType;

}