package com.stu.web.school_class.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;
import com.stu.web.school_class.entity.SchoolClass;
import com.stu.web.school_class.entity.SchoolClassParm;


public interface SchoolClassService extends IService<SchoolClass> {
    IPage<SchoolClass> getList(SchoolClassParm parm);
}
