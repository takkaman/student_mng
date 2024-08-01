package com.stu.web.sys_role_menu.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.stu.web.sys_role_menu.entity.SysRoleMenu;
import com.stu.web.sys_role_menu.mapper.SysRoleMenuMapper;
import com.stu.web.sys_role_menu.service.SysRoleMenuService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class SysRoleMenuServiceImpl extends ServiceImpl<SysRoleMenuMapper, SysRoleMenu> implements SysRoleMenuService {
    @Override
    @Transactional
    public void saveRoleMenu(Long roleId, List<Long> menuIds) {
        //思路：先删除，再插入
        QueryWrapper<SysRoleMenu> query = new QueryWrapper<>();
        query.lambda().eq(SysRoleMenu::getRoleId,roleId);
        this.baseMapper.delete(query);
        //插入
        this.baseMapper.saveRoleMenu(roleId,menuIds);
    }
}
