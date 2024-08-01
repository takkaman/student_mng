package com.stu.web.school_college.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.stu.web.school_college.entity.SchoolCollege;
import com.stu.web.school_college.mapper.SchoolCollegeMapper;
import com.stu.web.school_college.service.SchoolCollegeService;
import org.springframework.stereotype.Service;

@Service
public class SchoolCollegeServiceImpl extends ServiceImpl<SchoolCollegeMapper, SchoolCollege> implements SchoolCollegeService {
}
