package com.stu.web.sys_role.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;
import com.stu.web.sys_role.entity.AssignParm;
import com.stu.web.sys_role.entity.AssignVo;
import com.stu.web.sys_role.entity.RoleParm;
import com.stu.web.sys_role.entity.SysRole;

public interface SysRoleService extends IService<SysRole> {
    IPage<SysRole> list(RoleParm parm);
    //角色权限的回显
    AssignVo getAssignShow(AssignParm parm);
}
