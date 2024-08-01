package com.stu.web.school_college.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.stu.utils.ResultUtils;
import com.stu.utils.ResultVo;
import com.stu.web.school_college.entity.ListParm;
import com.stu.web.school_college.entity.SchoolCollege;
import com.stu.web.school_college.service.SchoolCollegeService;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Date;

@RestController
@RequestMapping("/api/college")
public class SchoolCollegeController {
    @Autowired
    private SchoolCollegeService schoolCollegeService;

    //新增
    @PostMapping
    public ResultVo add(@RequestBody SchoolCollege schoolCollege){
        schoolCollege.setCreateTime(new Date());
        boolean save = schoolCollegeService.save(schoolCollege);
        if(save){
            return ResultUtils.success("新增学院成功!");
        }
        return ResultUtils.error("新增学院失败!");
    }

    //编辑
    @PutMapping
    public ResultVo edit(@RequestBody SchoolCollege schoolCollege){
        boolean save = schoolCollegeService.updateById(schoolCollege);
        if(save){
            return ResultUtils.success("编辑学院成功!");
        }
        return ResultUtils.error("编辑学院失败!");
    }

    //删除
    @DeleteMapping("/{collegeId}")
    public ResultVo delete(@PathVariable("collegeId") Long collegeId){
        boolean save = schoolCollegeService.removeById(collegeId);
        if(save){
            return ResultUtils.success("删除学院成功!");
        }
        return ResultUtils.error("删除学院失败!");
    }

    //列表
    @GetMapping("/list")
    public ResultVo getList(ListParm listParm){
        //构造查询条件
        QueryWrapper<SchoolCollege> query = new QueryWrapper<>();
        if(StringUtils.isNotEmpty(listParm.getCollegeName())){
            query.lambda().like(SchoolCollege::getCollegeName,listParm.getCollegeName());
        }
        query.lambda().orderByAsc(SchoolCollege::getOrderNum);
        //构造分页对象
        IPage page = new Page(listParm.getCurrentPage(),listParm.getPageSize());
        //查询
        IPage list = schoolCollegeService.page(page, query);
        return ResultUtils.success("查询成功",list);
    }
}
