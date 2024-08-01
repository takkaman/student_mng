package com.stu.web.sys_role.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.stu.web.sys_menu.entity.MakeTree;
import com.stu.web.sys_menu.entity.SysMenu;
import com.stu.web.sys_menu.service.SysMenuService;
import com.stu.web.sys_role.entity.AssignParm;
import com.stu.web.sys_role.entity.AssignVo;
import com.stu.web.sys_role.entity.RoleParm;
import com.stu.web.sys_role.entity.SysRole;
import com.stu.web.sys_role.mapper.SysRoleMapper;
import com.stu.web.sys_role.service.SysRoleService;
import com.stu.web.sys_user.entity.SysUser;
import com.stu.web.sys_user.service.SysUserService;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

//实现类
@Service
public class SysRoleServiceImpl extends ServiceImpl<SysRoleMapper, SysRole> implements SysRoleService {
    @Autowired
    private SysUserService sysUserService;
    @Autowired
    private SysMenuService sysMenuService;
    @Override
    public IPage<SysRole> list(RoleParm parm) {
        //构造分页对象
        IPage<SysRole> page = new Page<>();
        page.setSize(parm.getPageSize());
        page.setCurrent(parm.getCurrentPage());
        //构造查询条件
        QueryWrapper<SysRole> query = new QueryWrapper<>();
        if(StringUtils.isNotEmpty(parm.getRoleName())){
            query.lambda().like(SysRole::getRoleName,parm.getRoleName());
        }
        return this.baseMapper.selectPage(page,query);
    }

    @Override
    public AssignVo getAssignShow(AssignParm parm) {
        //根据用户id查询用户信息
        SysUser user = sysUserService.getById(parm.getUserId());
        List<SysMenu> list = null;
        //判断用户是否是超级管理员
        if(user.getIsAdmin().equals("1")){ //如果是1,说明是超级管理员,拥有所有的权限
            QueryWrapper<SysMenu> query = new QueryWrapper<>();
            query.lambda().orderByAsc(SysMenu::getOrderNum);
            //查询菜单
            list =  sysMenuService.list(query);
        }else { //不是超级管理员，根据用户id查询菜单
            list = sysMenuService.getMenuByUserId(parm.getUserId());
        }
        //组装菜单树
        List<SysMenu> menuList = MakeTree.makeMenuTree(list, 0L);
        //查询角色原来的菜单
        List<SysMenu> roleList = sysMenuService.getMenuByRoleId(parm.getRoleId());
        //过滤出菜单id
        List<Long> ids = new ArrayList<>();
        Optional.ofNullable(roleList).orElse(new ArrayList<>())
                .stream()
                .filter(item -> item != null)
                .forEach(item ->{
                    ids.add(item.getMenuId());
                });
        //组装返回值
        AssignVo vo = new AssignVo();
        vo.setMenuList(menuList);
        vo.setCheckList(ids.toArray());
        return vo;
    }
}
