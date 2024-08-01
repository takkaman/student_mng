package com.stu.web.stu_points.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.stu.web.stu_points.entity.StuPoints;
import com.stu.web.stu_points.mapper.StuPointsMapper;
import com.stu.web.stu_points.service.StuPointsService;
import org.springframework.stereotype.Service;

@Service
public class StuPointsServiceImpl extends ServiceImpl<StuPointsMapper, StuPoints> implements StuPointsService {

}
