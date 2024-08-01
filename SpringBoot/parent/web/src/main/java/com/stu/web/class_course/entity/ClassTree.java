package com.stu.web.class_course.entity;

import lombok.Data;

import java.util.ArrayList;
import java.util.List;

@Data
public class ClassTree {
    private Long classId;
    private String className;
    private String type;
    private String open;
    private List<ClassTree> children = new ArrayList<>();
}