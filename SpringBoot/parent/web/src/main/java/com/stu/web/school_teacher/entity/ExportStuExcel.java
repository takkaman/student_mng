package com.stu.web.school_teacher.entity;


import cn.afterturn.easypoi.excel.annotation.Excel;
import lombok.Data;

import java.math.BigDecimal;

@Data
public class ExportStuExcel {
    @Excel(name = "学号", orderNum = "1", width=30)
    private String stuNum;
    @Excel(name = "姓名", orderNum = "2", width=30)
    private String stuName;
    @Excel(name = "成绩", orderNum = "3", width=15)
    private BigDecimal points;
}