package com.stu.web.school_student.entity;

import cn.afterturn.easypoi.excel.annotation.Excel;
import lombok.Data;

@Data
public class StuExcel {
    @Excel(name = "姓名", orderNum = "1", width=30)
    private String stuName;
    @Excel(name = "性别", replace = {"男_0","女_1"}, orderNum = "2", width=10)
    private String sex;
    @Excel(name = "电话", orderNum = "3", width=30)
    private String phone;
}