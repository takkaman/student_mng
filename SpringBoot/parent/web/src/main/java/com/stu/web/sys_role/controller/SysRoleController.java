package com.stu.web.sys_role.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.stu.utils.ResultUtils;
import com.stu.utils.ResultVo;
import com.stu.web.sys_role.entity.*;
import com.stu.web.sys_role.service.SysRoleService;
import com.stu.web.sys_role_menu.service.SysRoleMenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Date;

@RestController
@RequestMapping("/api/role")
public class SysRoleController {
    @Autowired
    private SysRoleService sysRoleService;
    @Autowired
    private SysRoleMenuService sysRoleMenuService;

    //新增角色
    @PostMapping
    public ResultVo addRole(@RequestBody SysRole role){
        //判断学生角色是否存在
        QueryWrapper<SysRole> query = new QueryWrapper<>();
        query.lambda().eq(SysRole::getRoleType,"2");
        SysRole one = sysRoleService.getOne(query);
        if(one != null && role.getRoleType().equals("2")){
            return ResultUtils.error("学生角色已经存在!");
        }
        role.setCreateTime(new Date());
        boolean save = sysRoleService.save(role);
        if(save){
            return ResultUtils.success("新增成功!");
        }
        return ResultUtils.error("新增失败!");
    }

    //编辑角色
    @PutMapping
    public ResultVo editRole(@RequestBody SysRole role){
         //判断学生角色是否存在
        QueryWrapper<SysRole> query = new QueryWrapper<>();
        query.lambda().eq(SysRole::getRoleType,"2");
        SysRole one = sysRoleService.getOne(query);
        if(one != null && role.getRoleType().equals("2") && !role.getRoleId().equals(one.getRoleId())){
            return ResultUtils.error("学生角色已经存在!");
        }
        role.setUpdateTime(new Date());
        boolean save = sysRoleService.updateById(role);
        if(save){
            return ResultUtils.success("编辑成功!");
        }
        return ResultUtils.error("编辑失败!");
    }

    //删除角色
    @DeleteMapping("/{roleId}")
    public ResultVo deleteRole(@PathVariable("roleId") Long roleId){
        boolean b = sysRoleService.removeById(roleId);
        if(b){
            return ResultUtils.success("删除成功!");
        }
        return ResultUtils.error("删除失败!");
    }

    //角色列表
    @GetMapping("/list")
    public ResultVo getList(RoleParm parm){
        IPage<SysRole> list = sysRoleService.list(parm);
        return ResultUtils.success("查询成功",list);
    }

    //分配权限数据回显
    @GetMapping("/getAssingShow")
    public ResultVo getAssingShow(AssignParm parm){
        AssignVo show = sysRoleService.getAssignShow(parm);
        return ResultUtils.success("查询成功",show);
    }

    //分配权限保存
    @PostMapping("/saveRoleMenu")
    public ResultVo saveRoleMenu(@RequestBody SaveRoleParm parm){
        sysRoleMenuService.saveRoleMenu(parm.getRoleId(),parm.getList());
        return ResultUtils.success("分配权限成功!");
    }
}
