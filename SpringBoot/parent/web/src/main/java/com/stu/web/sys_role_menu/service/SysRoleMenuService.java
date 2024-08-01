package com.stu.web.sys_role_menu.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.stu.web.sys_role_menu.entity.SysRoleMenu;

import java.util.List;

public interface SysRoleMenuService extends IService<SysRoleMenu> {
     void saveRoleMenu(Long roleId, List<Long> menuIds);
}
