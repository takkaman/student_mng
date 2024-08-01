package com.stu.web.school_student.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;
import com.stu.web.record_feedback.entity.FeedbackVo;
import com.stu.web.school_student.entity.*;

import java.util.List;

public interface SchoolStudentService extends IService<SchoolStudent> {
    //新增
    void addStu(SchoolStudent schoolStudent);
    //编辑
    void editStu(SchoolStudent schoolStudent);
    //根据用户id查询用户信息
    SchoolStudent getStuById(Long stuId);
    //列表
    IPage<SchoolStudent> getList(StuParm parm);
    //删除
    void deleteStu(Long stuId);
     //查询学生的课程
    IPage<MyCourseVo> getCourseList(CourseParm parm);
    IPage<MyRecordVo> getStuRecordList(RecordParm parm);
    IPage<FeedbackVo> getStuFeedbackList(FeedbackParm parm);
    StuCount getStuCount();
    List<HotMajorVo> getHotMajor();
    StuCourseStatsVo getStuCourseStats(Long stuId);
    List<StuScoreTuple> getStuScore(Long stuId);
}
