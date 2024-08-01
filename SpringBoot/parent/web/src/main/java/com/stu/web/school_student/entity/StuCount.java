package com.stu.web.school_student.entity;

import lombok.Data;

import java.util.ArrayList;
import java.util.List;

@Data
public class StuCount {
    List<Integer> count = new ArrayList<>();
    List<String> names = new ArrayList<>();
}
