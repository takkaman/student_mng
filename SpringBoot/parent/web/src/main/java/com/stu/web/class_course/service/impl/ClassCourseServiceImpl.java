package com.stu.web.class_course.service.impl;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.stu.web.class_course.entity.ClassCourse;
import com.stu.web.class_course.entity.ClassCourseVo;
import com.stu.web.class_course.entity.ParmListVo;
import com.stu.web.class_course.entity.TeacherCourseVo;
import com.stu.web.class_course.mapper.ClassCourseMapper;
import com.stu.web.class_course.service.ClassCourseService;
import org.springframework.stereotype.Service;

@Service
public class ClassCourseServiceImpl extends ServiceImpl<ClassCourseMapper, ClassCourse> implements ClassCourseService {
    @Override
    public IPage<ClassCourseVo> getCourseList(ParmListVo parm) {
        //构造分页对象
        IPage<ClassCourseVo> page = new Page<>(parm.getCurrentPage(),parm.getPageSize());
        return this.baseMapper.getCourseList(page,parm);
    }

    @Override
    public IPage<ClassCourse> getTeacherCourse(TeacherCourseVo parm) {
        //构造分页对象
        IPage<ClassCourse> page = new Page<>(parm.getCurrentPage(),parm.getPageSize());

        return this.baseMapper.getTeacherCourse(page,parm);
    }
}
