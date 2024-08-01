package com.stu.web.sys_menu.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.stu.web.sys_menu.entity.MakeTree;
import com.stu.web.sys_menu.entity.SysMenu;
import com.stu.web.sys_menu.mapper.SysMenuMapper;
import com.stu.web.sys_menu.service.SysMenuService;
import org.springframework.stereotype.Service;

import java.util.Arrays;
import java.util.List;

@Service
public class SysMenuServiceImpl extends ServiceImpl<SysMenuMapper, SysMenu> implements SysMenuService {
    @Override
    public List<SysMenu> getList() {
        //查询所有的菜单
        QueryWrapper<SysMenu> query = new QueryWrapper<>();
        query.lambda().orderByAsc(SysMenu::getOrderNum);
        List<SysMenu> menuList = this.baseMapper.selectList(query);

        //组装树
        List<SysMenu> sysMenus = MakeTree.makeMenuTree(menuList, 0L);
        return sysMenus;
    }

    @Override
    public List<SysMenu> getParentList() {
        //查询目录和菜单
        String[] types = {"0","1"};
        QueryWrapper<SysMenu> query = new QueryWrapper<>();
        query.lambda().in(SysMenu::getType, Arrays.asList(types));
        List<SysMenu> menuList = this.baseMapper.selectList(query);
        //构造加一个顶级菜单
        SysMenu menu = new SysMenu();
        menu.setParentId(-1L);
        menu.setMenuId(0L);
        menu.setTitle("顶级菜单");
        menuList.add(menu);
        //构造树数据
        List<SysMenu> list = MakeTree.makeMenuTree(menuList, -1L);
        return list;
    }

    @Override
    public List<SysMenu> getMenuByUserId(Long userId) {
        return this.baseMapper.getMenuByUserId(userId);
    }

    @Override
    public List<SysMenu> getMenuByRoleId(Long roleId) {
        return this.baseMapper.getMenuByRoleId(roleId);
    }

    @Override
    public List<SysMenu> getMenuByStuId(Long userId) {
        return this.baseMapper.getMenuByStuId(userId);
    }

    @Override
    public List<SysMenu> getMenuByTeacherId(Long userId) {
        return this.baseMapper.getMenuByTeacherId(userId);
    }
}
