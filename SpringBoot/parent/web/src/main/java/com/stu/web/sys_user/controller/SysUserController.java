package com.stu.web.sys_user.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.stu.utils.ResultUtils;
import com.stu.utils.ResultVo;
import com.stu.web.sys_role.entity.SysRole;
import com.stu.web.sys_role.service.SysRoleService;
import com.stu.web.sys_user.entity.PageParm;
import com.stu.web.sys_user.entity.SysUser;
import com.stu.web.sys_user.service.SysUserService;
import com.stu.web.sys_user_role.entity.SysUserRole;
import com.stu.web.sys_user_role.service.SysUserRoleService;
import net.bytebuddy.asm.Advice;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.DigestUtils;
import org.springframework.web.bind.annotation.*;

import java.util.Date;
import java.util.List;

@RestController
@RequestMapping("/api/user")
public class SysUserController {
    @Autowired
    private SysUserService sysUserService;
    @Autowired
    private SysRoleService sysRoleService;
    @Autowired
    private SysUserRoleService sysUserRoleService;

    //新增用户
    @PostMapping
    public ResultVo addUser(@RequestBody SysUser user){
        //判断账户是否被占用
        QueryWrapper<SysUser> query = new QueryWrapper<>();
        query.lambda().eq(SysUser::getUsername,user.getUsername());
        SysUser one = sysUserService.getOne(query);
        if(one != null){
            return ResultUtils.error("账户被占用!");
        }
        //加密
        user.setPassword(DigestUtils.md5DigestAsHex(user.getPassword().getBytes()));
        //设置时间
        user.setIsAdmin("0");
        user.setCreateTime(new Date());

        //入库
        sysUserService.add(user);
        return ResultUtils.success("新增用户成功!");
    }

    //编辑用户
    @PutMapping
    public ResultVo editUser(@RequestBody SysUser user){
        //判断账户是否被占用
        QueryWrapper<SysUser> query = new QueryWrapper<>();
        query.lambda().eq(SysUser::getUsername,user.getUsername());
        SysUser one = sysUserService.getOne(query);
        if(one != null && one.getUserId() != user.getUserId()){
            return ResultUtils.error("账户被占用!");
        }
        //加密
//        user.setPassword(DigestUtils.md5DigestAsHex(user.getPassword().getBytes()));
        //设置时间
        user.setUpdateTime(new Date());
        //更新
        sysUserService.edit(user);
        return ResultUtils.success("编辑用户成功!");
    }

    //删除
    @DeleteMapping("/{userId}")
    public ResultVo delete(@PathVariable("userId") Long userId){
        boolean remove = sysUserService.removeById(userId);
        if(remove){
            return ResultUtils.success("删除成功!");
        }
        return ResultUtils.error("删除失败!");
    }

    //查询列表
    @GetMapping("/list")
    public ResultVo getList(PageParm parm){
        IPage<SysUser> list = sysUserService.list(parm);
        list.getRecords().stream().forEach(item ->{
            item.setPassword("");
        });
        return ResultUtils.success("查询成功",list);
    }

    //角色列表
    @GetMapping("/roleList")
    public ResultVo getRoleList(){
        List<SysRole> list = sysRoleService.list();
        return ResultUtils.success("查询成功",list);
    }

    //根据用户id查询角色id
    @GetMapping("/role")
    public ResultVo getRoleById(Long userId){
        QueryWrapper<SysUserRole> query = new QueryWrapper<>();
        query.lambda().eq(SysUserRole::getUserId,userId);
        SysUserRole one = sysUserRoleService.getOne(query);
        return ResultUtils.success("查询成功",one);
    }
}
