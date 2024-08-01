package com.stu.web.school_student.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.stu.web.record_feedback.entity.FeedbackVo;
import com.stu.web.school_student.entity.*;
import com.stu.web.school_student.mapper.SchoolStudentMapper;
import com.stu.web.school_student.service.SchoolStudentService;
import com.stu.web.stu_role.entity.StuRole;
import com.stu.web.stu_role.service.StuRoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Service
public class SchoolStudentServiceImpl extends ServiceImpl<SchoolStudentMapper, SchoolStudent> implements SchoolStudentService {
    @Autowired
    private StuRoleService stuRoleService;

    @Override
    @Transactional
    public void addStu(SchoolStudent schoolStudent) {
        //新增学生
        int insert = this.baseMapper.insert(schoolStudent);
        //设置学生的角色
        if(insert > 0){
            StuRole stuRole = new StuRole();
            stuRole.setRoleId(schoolStudent.getRoleId());
            stuRole.setStuId(schoolStudent.getStuId());
            stuRoleService.save(stuRole);
        }
    }

    @Override
    @Transactional
    public void editStu(SchoolStudent schoolStudent) {
        //编辑学生
        int i = this.baseMapper.updateById(schoolStudent);
        //设置学生角色：先删除原来的，再插入新的
        if(i>0){
            //先删除
            QueryWrapper<StuRole> query = new QueryWrapper<>();
            query.lambda().eq(StuRole::getStuId,schoolStudent.getStuId());
            stuRoleService.remove(query);
            //插入
            StuRole stuRole = new StuRole();
            stuRole.setRoleId(schoolStudent.getRoleId());
            stuRole.setStuId(schoolStudent.getStuId());
            stuRoleService.save(stuRole);
        }
    }

    @Override
    public SchoolStudent getStuById(Long stuId) {
        return this.baseMapper.getStuById(stuId);
    }

    @Override
    public IPage<SchoolStudent> getList(StuParm parm) {
        //构造分页对象
        IPage<SchoolStudent> page = new Page<>(parm.getCurrentPage(),parm.getPageSize());
        return this.baseMapper.getList(page,parm);
    }

    @Override
    @Transactional
    public void deleteStu(Long stuId) {
        //删除学生
        int i = this.baseMapper.deleteById(stuId);
        if(i>0){
             QueryWrapper<StuRole> query = new QueryWrapper<>();
            query.lambda().eq(StuRole::getStuId,stuId);
            stuRoleService.remove(query);
        }
    }

    @Override
    public IPage<MyCourseVo> getCourseList(CourseParm parm) {
        //构造分页对象
        IPage<MyCourseVo> page = new Page<>(parm.getCurrentPage(),parm.getPageSize());
        return this.baseMapper.getCourseList(page,parm);
    }

    @Override
    public IPage<MyRecordVo> getStuRecordList(RecordParm parm) {
        //构造分页对象
        IPage<MyRecordVo> page = new Page<>(parm.getCurrentPage(),parm.getPageSize());
        return this.baseMapper.getStuRecordList(page,parm);
    }

    @Override
    public IPage<FeedbackVo> getStuFeedbackList(FeedbackParm parm) {
        //构造分页对象
        IPage<FeedbackVo> page = new Page<>(parm.getCurrentPage(),parm.getPageSize());
        return this.baseMapper.getStuFeedbackList(page,parm);
    }

    @Override
    public StuCount getStuCount() {
        List<StuCountVo> stuCountVos = this.baseMapper.getStuCount();
        StuCount stuCount = new StuCount();
        List<Integer> count = new ArrayList<>();
        List<String> names = new ArrayList<>();
        if(stuCountVos.size() >0){
           for (int i=0;i<stuCountVos.size();i++){
               count.add(stuCountVos.get(i).getStuCount());
               names.add(stuCountVos.get(i).getClassYear());
           }
        }
        stuCount.setCount(count);
        stuCount.setNames(names);
        return stuCount;
    }

    @Override
    public List<HotMajorVo> getHotMajor() {
        return this.baseMapper.getHotMajor();
    }

    @Override
    public StuCourseStatsVo getStuCourseStats(Long stuId) {
        return this.baseMapper.getStuCourseStats(stuId);
    }

    @Override
    public List<StuScoreTuple> getStuScore(Long stuId) {
        return this.baseMapper.getStuScore(stuId);
    }
}
