package com.stu.web.record_student.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.stu.web.record_student.entity.RecordStudent;
import com.stu.web.record_student.mapper.RecordStudentMapper;
import com.stu.web.record_student.service.RecordStudentService;
import org.springframework.stereotype.Service;

@Service
public class RecordStudentServiceImpl extends ServiceImpl<RecordStudentMapper, RecordStudent> implements RecordStudentService {
}
