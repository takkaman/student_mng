package com.stu.web.school_class.service.impl;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.stu.web.school_class.entity.SchoolClass;
import com.stu.web.school_class.entity.SchoolClassParm;
import com.stu.web.school_class.mapper.SchoolClassMapper;
import com.stu.web.school_class.service.SchoolClassService;
import org.springframework.stereotype.Service;

@Service
public class SchoolClassServiceImpl extends ServiceImpl<SchoolClassMapper, SchoolClass> implements SchoolClassService {
    @Override
    public IPage<SchoolClass> getList(SchoolClassParm parm) {
        //构造分页对象
        IPage<SchoolClass> page = new Page<>(parm.getCurrentPage(),parm.getPageSize());
        return this.baseMapper.getList(page,parm);
    }
}
