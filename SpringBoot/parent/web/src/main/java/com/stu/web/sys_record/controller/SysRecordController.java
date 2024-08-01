package com.stu.web.sys_record.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.stu.utils.ResultUtils;
import com.stu.utils.ResultVo;
import com.stu.web.course_teacher.entity.CourseTeacher;
import com.stu.web.record_student.entity.RecordStudent;
import com.stu.web.record_student.service.RecordStudentService;
import com.stu.web.school_student.entity.SchoolStudent;
import com.stu.web.school_student.service.SchoolStudentService;
import com.stu.web.sys_record.entity.RecordListParm;
import com.stu.web.sys_record.entity.RecordVO;
import com.stu.web.sys_record.entity.SysRecord;
import com.stu.web.sys_record.service.SysRecordService;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/api/record")
public class SysRecordController {
    @Autowired
    private SysRecordService sysRecordService;

    @Autowired
    private RecordStudentService recordStudentService;

    @Autowired
    private SchoolStudentService schoolStudentService;

    //查询最近3条公告
    @GetMapping("/getTopList")
    public ResultVo getTopList() {
        QueryWrapper<SysRecord> query = new QueryWrapper<>();
        query.lambda().orderByDesc(SysRecord::getCreateTime).last(" limit 3 ");
        List<SysRecord> list = sysRecordService.list(query);
        return ResultUtils.success("查询成功", list);
    }

    //新增
    @PostMapping
    public ResultVo add(@RequestBody SysRecord sysRecord) {
        sysRecord.setCreateTime(new Date());
        boolean save = sysRecordService.save(sysRecord);
        if (save) {
            return ResultUtils.success("新增成功");
        }
        return ResultUtils.error("新增失败");
    }

    //编辑
    @PutMapping
    public ResultVo edit(@RequestBody SysRecord sysRecord) {
        boolean save = sysRecordService.updateById(sysRecord);
        if (save) {
            return ResultUtils.success("编辑成功");
        }
        return ResultUtils.error("编辑失败");
    }

    //删除
    @DeleteMapping("/{recordId}")
    public ResultVo delete(@PathVariable("recordId") Long recordId) {
        boolean b = sysRecordService.removeById(recordId);
        if (b) {
            return ResultUtils.success("删除成功");
        }
        return ResultUtils.error("删除失败");
    }

    //列表
    @GetMapping("/list")
    public ResultVo list(RecordListParm parm) {
        //构造分页对象
        IPage<SysRecord> page = new Page<>(parm.getCurrentPage(), parm.getPageSize());
        //分页条件
        QueryWrapper<SysRecord> query = new QueryWrapper<>();
        if (StringUtils.isNotEmpty(parm.getTitle())) {
            query.lambda().like(SysRecord::getTitle, parm.getTitle());
        }

        if (StringUtils.isNotEmpty(parm.getType())) {
            query.lambda().eq(SysRecord::getType, parm.getType());
        }

        if (StringUtils.isNotEmpty(parm.getSubType())) {
            query.lambda().eq(SysRecord::getSubType, parm.getSubType());
        }

        if (StringUtils.isNotEmpty(parm.getYear())) {
            query.lambda().eq(SysRecord::getYear, parm.getYear());
        }

        query.lambda().orderByDesc(SysRecord::getCreateTime);
        IPage<SysRecord> list = sysRecordService.page(page, query);

        Class<RecordStudent> recordStudentClass = RecordStudent.class;

        IPage<RecordVO> voList = list.convert(l -> {
            RecordVO recordVO = new RecordVO();
            recordVO.setRecordId(l.getRecordId());
            recordVO.setTitle(l.getTitle());
            recordVO.setType(l.getType());
            recordVO.setYear(l.getYear());
            recordVO.setCreateTime(l.getCreateTime());
            recordVO.setSubType(l.getSubType());
            recordVO.setRecordContent(l.getRecordContent());

            QueryWrapper<RecordStudent> query1 = new QueryWrapper<>();
            query1.lambda().eq(RecordStudent::getRecordId, l.getRecordId());
            List<RecordStudent> ones = recordStudentService.list(query1);

            if (!ones.isEmpty()) {
                List<SchoolStudent> students = schoolStudentService.listByIds(ones.stream().map(RecordStudent::getStuId).collect(Collectors.toList()));
                recordVO.setStudentNames(students.stream().map(SchoolStudent::getStuName).collect(Collectors.toList()));
            }

            return recordVO;
        });

        return ResultUtils.success("查询成功", voList);
    }

    @GetMapping("/listAvailable")
    public ResultVo listAvailable(RecordListParm parm) {
        SchoolStudent stu = schoolStudentService.getStuById(Long.parseLong(parm.getStuId()));
        //构造分页对象
        IPage<SysRecord> page = new Page<>(parm.getCurrentPage(), parm.getPageSize());
        //分页条件
        QueryWrapper<SysRecord> query = new QueryWrapper<>();
        if (StringUtils.isNotEmpty(parm.getTitle())) {
            query.lambda().like(SysRecord::getTitle, parm.getTitle());
        }

        if (StringUtils.isNotEmpty(parm.getType())) {
            query.lambda().eq(SysRecord::getType, parm.getType());
        }

        if (StringUtils.isNotEmpty(parm.getSubType())) {
            query.lambda().eq(SysRecord::getSubType, parm.getSubType());
        }

        if (StringUtils.isNotEmpty(parm.getYear())) {
            query.lambda().eq(SysRecord::getYear, parm.getYear());
        }

        query.lambda().orderByDesc(SysRecord::getCreateTime);
        IPage<SysRecord> list = sysRecordService.page(page, query);

        Class<RecordStudent> recordStudentClass = RecordStudent.class;

        IPage<RecordVO> voList = list.convert(l -> {
            RecordVO recordVO = new RecordVO();
            recordVO.setRecordId(l.getRecordId());
            recordVO.setTitle(l.getTitle());
            recordVO.setType(l.getType());
            recordVO.setYear(l.getYear());
            recordVO.setCreateTime(l.getCreateTime());
            recordVO.setSubType(l.getSubType());
            recordVO.setRecordContent(l.getRecordContent());

            QueryWrapper<RecordStudent> query1 = new QueryWrapper<>();
            query1.lambda().eq(RecordStudent::getRecordId, l.getRecordId());
            List<RecordStudent> ones = recordStudentService.list(query1);

            if (!ones.isEmpty()) {
                List<SchoolStudent> students = schoolStudentService.listByIds(ones.stream().map(RecordStudent::getStuId).collect(Collectors.toList()));
                recordVO.setStudentNames(students.stream().map(SchoolStudent::getStuName).collect(Collectors.toList()));
            }

            return recordVO;
        });

        voList.setRecords(voList.getRecords().stream().filter(vo -> !vo.getStudentNames().contains(stu.getStuName())).collect(Collectors.toList()));

        return ResultUtils.success("查询成功", voList);
    }

    //分配学生保存
    @PostMapping("/assignSave")
    public ResultVo assignSave(@RequestBody RecordStudent recordStudent) {
        //判断课程是否已经分配老师
        QueryWrapper<RecordStudent> query = new QueryWrapper<>();
        query.lambda().eq(RecordStudent::getRecordId, recordStudent.getRecordId()).eq(RecordStudent::getStuId, recordStudent.getStuId());
        RecordStudent one = recordStudentService.getOne(query);
        if (one != null) {
            return ResultUtils.error("该记录已为学生做过分配，不用重复分配!");
        }

        boolean save = recordStudentService.save(recordStudent);
        if (save) {
            return ResultUtils.success("分配成功");
        }
        return ResultUtils.error("分配失败");
    }
}
