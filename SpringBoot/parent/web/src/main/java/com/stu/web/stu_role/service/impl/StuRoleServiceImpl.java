package com.stu.web.stu_role.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.stu.web.stu_role.entity.StuRole;
import com.stu.web.stu_role.mapper.StuRoleMapper;
import com.stu.web.stu_role.service.StuRoleService;
import org.springframework.stereotype.Service;

@Service
public class StuRoleServiceImpl extends ServiceImpl<StuRoleMapper, StuRole> implements StuRoleService {
}
