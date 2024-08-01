package com.stu.web.school_class.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.stu.web.school_class.entity.SchoolClass;
import com.stu.web.school_class.entity.SchoolClassParm;
import org.apache.ibatis.annotations.Param;

public interface SchoolClassMapper extends BaseMapper<SchoolClass> {
    IPage<SchoolClass> getList(IPage<SchoolClass> page, @Param("parm") SchoolClassParm parm);
}
