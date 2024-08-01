package com.stu.web.school_class.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.stu.utils.ResultUtils;
import com.stu.utils.ResultVo;
import com.stu.web.school_class.entity.SchoolClass;
import com.stu.web.school_class.entity.SchoolClassParm;
import com.stu.web.school_class.service.SchoolClassService;
import com.stu.web.school_major.entity.SchoolMajor;
import com.stu.web.school_major.service.SchoolMajorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/class")
public class SchoolClassController {
    @Autowired
    private SchoolClassService schoolClassService;
    @Autowired
    private SchoolMajorService schoolMajorServicel;


    //新增
    @PostMapping
    public ResultVo add(@RequestBody SchoolClass schoolClass){
        boolean save = schoolClassService.save(schoolClass);
        if(save){
            return ResultUtils.success("新增成功!");
        }
        return ResultUtils.error("新增失败!");
    }

    //编辑
    @PutMapping
    public ResultVo edit(@RequestBody SchoolClass schoolClass){
        boolean save = schoolClassService.updateById(schoolClass);
        if(save){
            return ResultUtils.success("编辑成功!");
        }
        return ResultUtils.error("编辑失败!");
    }

    //删除
    @DeleteMapping("/{classId}")
    public ResultVo delete(@PathVariable("classId") Long classId){
        boolean save = schoolClassService.removeById(classId);
        if(save){
            return ResultUtils.success("删除成功!");
        }
        return ResultUtils.error("删除失败!");
    }

    //查询列表
    @GetMapping("/list")
    public ResultVo getList(SchoolClassParm schoolClassParm){
        IPage<SchoolClass> list = schoolClassService.getList(schoolClassParm);
        return ResultUtils.success("查询成功",list);
    }

    //根据学院id查询专业
    @GetMapping("/getMajorListById")
    public ResultVo getMajorListById(Long collegeId){
        //构造查询条件
        QueryWrapper<SchoolMajor> query = new QueryWrapper<>();
        query.lambda().eq(SchoolMajor::getCollegeId,collegeId);
        List<SchoolMajor> list = schoolMajorServicel.list(query);
        return ResultUtils.success("查询成功",list);
    }

    //根据专业id查询学院id
    @GetMapping("/getCollageId")
    public ResultVo getCollageId(Long majorId){
        SchoolMajor major = schoolMajorServicel.getById(majorId);
        return ResultUtils.success("查询成功",major);
    }
    //根据学院id查询专业列表
    @GetMapping("/getMajorListByCollageId")
    public ResultVo getMajorListByCollageId(Long collegeId){
        QueryWrapper<SchoolMajor> query = new QueryWrapper<>();
        query.lambda().eq(SchoolMajor::getCollegeId,collegeId);
        List<SchoolMajor> list = schoolMajorServicel.list(query);
        return ResultUtils.success("查询成功",list);
    }
}
