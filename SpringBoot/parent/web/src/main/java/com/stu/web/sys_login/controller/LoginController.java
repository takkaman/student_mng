package com.stu.web.sys_login.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.stu.config.jwt.JwtUtils;
import com.stu.utils.ResultUtils;
import com.stu.utils.ResultVo;
import com.stu.web.school_class.service.SchoolClassService;
import com.stu.web.school_major.service.SchoolMajorService;
import com.stu.web.school_student.entity.SchoolStudent;
import com.stu.web.school_student.service.SchoolStudentService;
import com.stu.web.school_teacher.entity.SchoolTeacher;
import com.stu.web.school_teacher.service.SchoolTeacherService;
import com.stu.web.sys_login.entity.*;
import com.stu.web.sys_menu.entity.MakeTree;
import com.stu.web.sys_menu.entity.RouterVO;
import com.stu.web.sys_menu.entity.SysMenu;
import com.stu.web.sys_menu.service.SysMenuService;
import com.stu.web.sys_user.entity.SysUser;
import com.stu.web.sys_user.service.SysUserService;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.DigestUtils;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/api/login")
public class LoginController {
    @Autowired
    private SysUserService sysUserService;
    @Autowired
    private SchoolStudentService schoolStudentService;
    @Autowired
    private SchoolTeacherService schoolTeacherService;
    @Autowired
    private JwtUtils jwtUtils;
    @Autowired
    private SysMenuService sysMenuService;
    @Autowired
    private SchoolClassService schoolClassService;
    @Autowired
    private SchoolMajorService schoolMajorService;
    //首页总数统计
    @GetMapping("/getHomeCount")
    public ResultVo getHomeCount(){
        CountVo countVo = new CountVo();
        //学生总数
        int stuCount = schoolStudentService.count();
        countVo.setStuCount(stuCount);
        //班级总数
        int classCount = schoolClassService.count();
        countVo.setClassCount(classCount);
        //专业总数
        int majorCount = schoolMajorService.count();
        countVo.setMajorCount(majorCount);
        //教师总数
        int teacherCount = schoolTeacherService.count();
        countVo.setTeacherCount(teacherCount);
        return ResultUtils.success("查询成功",countVo);
    }


    //修改密码
    @PostMapping("/UpadatePassword")
    public ResultVo UpadatePassword(@RequestBody UpadatePasswordParm parm) {
        String old = DigestUtils.md5DigestAsHex(parm.getOldPassword().getBytes());
        if (parm.getUserType().equals("0")) { //学生
            SchoolStudent student = schoolStudentService.getById(parm.getUserId());
            if (!student.getPassword().equals(old)) {
                return ResultUtils.error("原密码错误!");
            }
            SchoolStudent student1 = new SchoolStudent();
            student1.setStuId(student.getStuId());
            student1.setPassword(DigestUtils.md5DigestAsHex(parm.getNewPassword().getBytes()));
            schoolStudentService.updateById(student1);
            return ResultUtils.success("密码更新成功!");
        } else if (parm.getUserType().equals("1")) { //教师
            SchoolTeacher teacher = schoolTeacherService.getById(parm.getUserId());
            if (!teacher.getPassword().equals(old)) {
                return ResultUtils.error("原密码错误!");
            }
            SchoolTeacher teacher1 = new SchoolTeacher();
            teacher1.setTeacherId(teacher.getTeacherId());
            teacher1.setPassword(DigestUtils.md5DigestAsHex(parm.getNewPassword().getBytes()));
            schoolTeacherService.updateById(teacher1);
            return ResultUtils.success("密码更新成功!");
        } else if (parm.getUserType().equals("2")) { //管理员
            SysUser user = sysUserService.getById(parm.getUserId());
            if (!user.getPassword().equals(old)) {
                return ResultUtils.error("原密码错误!");
            }
            SysUser user1 = new SysUser();
            user1.setUserId(user.getUserId());
            user1.setPassword(DigestUtils.md5DigestAsHex(parm.getNewPassword().getBytes()));
            sysUserService.updateById(user1);
            return ResultUtils.success("密码更新成功!");
        } else {
            return ResultUtils.error("用户类型错误");
        }
    }

    @GetMapping("/getMenuList")
    public ResultVo getMenuList(LoginResult loginParm) {
        if (loginParm.getUserType().equals("0")) {
            List<SysMenu> menuList = sysMenuService.getMenuByStuId(loginParm.getUserId());
            //过滤
            List<SysMenu> collect = menuList.stream().filter(item -> item != null && !item.getType().equals("2"))
                    .collect(Collectors.toList());
            if (collect.size() == 0) {
                return ResultUtils.error("暂未分配菜单权限，请联系管理员!");
            }
            //组装路由数据格式
            List<RouterVO> router = MakeTree.makeRouter(collect, 0L);
            return ResultUtils.success("查询成功", router);
        } else if (loginParm.getUserType().equals("1")) {
            List<SysMenu> menuList = sysMenuService.getMenuByTeacherId(loginParm.getUserId());
            //过滤
            List<SysMenu> collect = menuList.stream().filter(item -> item != null && !item.getType().equals("2"))
                    .collect(Collectors.toList());
            if (collect.size() == 0) {
                return ResultUtils.error("暂未分配菜单权限，请联系管理员!");
            }
            //组装路由数据格式
            List<RouterVO> router = MakeTree.makeRouter(collect, 0L);
            return ResultUtils.success("查询成功", router);
        } else if (loginParm.getUserType().equals("2")) {
            //根据用户id查询用户信息
            SysUser user = sysUserService.getById(loginParm.getUserId());
            //菜单数据获取
            List<SysMenu> menuList = null;
            if (StringUtils.isNotEmpty(user.getIsAdmin()) && user.getIsAdmin().equals("1")) {
                menuList = sysMenuService.list();
            } else {
                menuList = sysMenuService.getMenuByUserId(user.getUserId());
            }
            //过滤
            List<SysMenu> collect = menuList.stream().filter(item -> item != null && !item.getType().equals("2"))
                    .collect(Collectors.toList());
            if (collect.size() == 0) {
                return ResultUtils.error("暂未分配菜单权限，请联系管理员!");
            }
            //组装路由数据格式
            List<RouterVO> router = MakeTree.makeRouter(collect, 0L);

            return ResultUtils.success("查询成功", router);
        } else {
            return ResultUtils.error("用户类型不对");
        }
    }

    @GetMapping("/getInfo")
    public ResultVo getInfo(LoginResult loginParm) {
        UserInfo userInfo = new UserInfo();
        userInfo.setUserType(loginParm.getUserType());
        if (loginParm.getUserType().equals("0")) { //学生
            //根据学生id查询学生信息
            SchoolStudent student = schoolStudentService.getById(loginParm.getUserId());
            userInfo.setName(student.getStuName());
            userInfo.setIntroduction(student.getStuName());
            userInfo.setAvatar("https://q4.itc.cn/q_70/images03/20240405/39ec09deda3a41d79e03897b0fdf68a0.jpeg");
            userInfo.setUserNum(student.getStuNum());
            userInfo.setGender(student.getSex());
            //获取学生的权限字段
            List<SysMenu> menuList = sysMenuService.getMenuByStuId(student.getStuId());
            //过滤权限字段
            List<String> collect = menuList.stream().filter(item -> item != null && StringUtils.isNotEmpty(item.getCode())).map(item -> item.getCode())
                    .collect(Collectors.toList());
            //转为数组
            if (collect.size() == 0) {
                return ResultUtils.error("未分配菜单权限");
            }
            String[] array = collect.toArray(new String[collect.size()]);
            userInfo.setRoles(array);
            return ResultUtils.success("查询成功", userInfo);
        } else if (loginParm.getUserType().equals("1")) { //教师
            //根据教师id查询教师信息
            SchoolTeacher teacher = schoolTeacherService.getById(loginParm.getUserId());
            userInfo.setName(teacher.getTeacherName());
            userInfo.setIntroduction(teacher.getTeacherName());
            userInfo.setAvatar("https://n.sinaimg.cn/sinakd202116s/254/w927h927/20210106/97df-kherpxy0779407.png");
            userInfo.setUserNum(teacher.getTeacherNum());
            userInfo.setGender(teacher.getSex());
            //获取学生的权限字段
            List<SysMenu> menuList = sysMenuService.getMenuByTeacherId(teacher.getTeacherId());
            //过滤权限字段
            List<String> collect = menuList.stream().filter(item -> item != null && StringUtils.isNotEmpty(item.getCode())).map(item -> item.getCode())
                    .collect(Collectors.toList());
            //转为数组
            if (collect.size() == 0) {
                return ResultUtils.error("未分配菜单权限");
            }
            String[] array = collect.toArray(new String[collect.size()]);
            userInfo.setRoles(array);
            return ResultUtils.success("查询成功", userInfo);
        } else if (loginParm.getUserType().equals("2")) { //管理员
            //根据用户id查询用户信息
            SysUser user = sysUserService.getById(loginParm.getUserId());
            userInfo.setName("管理员");
            userInfo.setIntroduction(user.getNickName());
            userInfo.setAvatar("https://img0.baidu.com/it/u=577272889,2607438384&fm=253&fmt=auto&app=138&f=PNG?w=285&h=285");
            userInfo.setUserNum(String.valueOf(user.getUserId()));
            userInfo.setGender(user.getSex());
            //获取学生的权限字段
            List<SysMenu> menuList = null;
            if (StringUtils.isNotEmpty(user.getIsAdmin()) && user.getIsAdmin().equals("1")) { //超级管理员
                menuList = sysMenuService.list();
            } else {
                menuList = sysMenuService.getMenuByUserId(user.getUserId());
            }
            //过滤权限字段
            List<String> collect = menuList.stream().filter(item -> item != null && StringUtils.isNotEmpty(item.getCode())).map(item -> item.getCode())
                    .collect(Collectors.toList());
            //转为数组
            if (collect.size() == 0) {
                return ResultUtils.error("未分配菜单权限");
            }
            String[] array = collect.toArray(new String[collect.size()]);
            userInfo.setRoles(array);
            return ResultUtils.success("查询成功", userInfo);
        } else {
            return ResultUtils.success("用户类型不存在");
        }
    }


    /**
     * 登录
     *
     * @param loginParm
     * @return
     */
    @PostMapping("/login")
    public ResultVo login(@RequestBody LoginParm loginParm) {
        if (StringUtils.isEmpty(loginParm.getUsername()) || StringUtils.isEmpty(loginParm.getPassword()) || StringUtils.isEmpty(loginParm.getUserType())) {
            return ResultUtils.error("用户名、密码或用户类型不能为空!");
        }
        String password = DigestUtils.md5DigestAsHex(loginParm.getPassword().getBytes());
        if (loginParm.getUserType().equals("0")) { //学生
            QueryWrapper<SchoolStudent> query = new QueryWrapper<>();
            query.lambda().eq(SchoolStudent::getStuNum, loginParm.getUsername())
                    .eq(SchoolStudent::getPassword, password);
            SchoolStudent student = schoolStudentService.getOne(query);
            if (student == null) {
                return ResultUtils.error("用户名或密码错误!");
            }
            //获取token
            Map<String, String> map = new HashMap<>();
            map.put("username", student.getStuNum());
            map.put("userId", Long.toString(student.getStuId()));
            String token = jwtUtils.generateToken(map);
            //定义返回值
            LoginResult result = new LoginResult();
            result.setUserId(student.getStuId());
            result.setToken(token);
            result.setUserType(loginParm.getUserType());
            result.setUsername(student.getStuName());
            return ResultUtils.success("登录成功", result);
        } else if (loginParm.getUserType().equals("1")) { //教师
            QueryWrapper<SchoolTeacher> query = new QueryWrapper<>();
            query.lambda().eq(SchoolTeacher::getTeacherNum, loginParm.getUsername())
                    .eq(SchoolTeacher::getPassword, password);
            SchoolTeacher teacher = schoolTeacherService.getOne(query);
            if (teacher == null) {
                return ResultUtils.error("用户名或密码错误!");
            }
            //获取token
            Map<String, String> map = new HashMap<>();
            map.put("username", teacher.getTeacherNum());
            map.put("userId", Long.toString(teacher.getTeacherId()));
            String token = jwtUtils.generateToken(map);
            //定义返回值
            LoginResult result = new LoginResult();
            result.setUserId(teacher.getTeacherId());
            result.setToken(token);
            result.setUserType(loginParm.getUserType());
            result.setUsername(teacher.getTeacherName());
            return ResultUtils.success("登录成功", result);
        } else if (loginParm.getUserType().equals("2")) { //管理员
            //查询用户是否存在
            QueryWrapper<SysUser> query = new QueryWrapper<>();
            query.lambda().eq(SysUser::getUsername, loginParm.getUsername()).eq(SysUser::getPassword, password);
            SysUser user = sysUserService.getOne(query);
            if (user == null) {
                return ResultUtils.error("用户名或密码错误!");
            }
            //获取token
            Map<String, String> map = new HashMap<>();
            map.put("username", user.getUsername());
            map.put("userId", Long.toString(user.getUserId()));
            String token = jwtUtils.generateToken(map);
            //定义返回值
            LoginResult result = new LoginResult();
            result.setUserId(user.getUserId());
            result.setToken(token);
            result.setUserType(loginParm.getUserType());
            result.setUsername(user.getUsername());
            return ResultUtils.success("登录成功", result);
        } else {
            return ResultUtils.error("用户类型错误!");
        }
    }
}
