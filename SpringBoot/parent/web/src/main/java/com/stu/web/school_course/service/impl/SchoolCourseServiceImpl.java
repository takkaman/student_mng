package com.stu.web.school_course.service.impl;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.stu.web.school_course.entity.CourseListParm;
import com.stu.web.school_course.entity.SchoolCourse;
import com.stu.web.school_course.mapper.SchoolCourseMapper;
import com.stu.web.school_course.service.SchoolCourseService;
import org.springframework.stereotype.Service;

@Service
public class SchoolCourseServiceImpl extends ServiceImpl<SchoolCourseMapper, SchoolCourse> implements SchoolCourseService {
    @Override
    public IPage<SchoolCourse> getCourseList(CourseListParm parm) {
        //构造分页对象
        IPage<SchoolCourse> page = new Page<>(parm.getCurrentPage(),parm.getPageSize());
        return this.baseMapper.getCourseList(page,parm);
    }
}
