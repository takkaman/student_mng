package com.stu.web.school_student.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.stu.web.record_feedback.entity.FeedbackVo;
import com.stu.web.school_student.entity.*;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface SchoolStudentMapper extends BaseMapper<SchoolStudent> {
    //根据用户id查询用户信息
    SchoolStudent getStuById(@Param("stuId") Long stuId);

    //列表
    IPage<SchoolStudent> getList(IPage<SchoolStudent> page, @Param("parm") StuParm parm);

    //查询学生的课程
    IPage<MyCourseVo> getCourseList(IPage<MyCourseVo> page, @Param("parm") CourseParm parm);

    List<StuCountVo> getStuCount();

    List<HotMajorVo> getHotMajor();

    IPage<MyRecordVo> getStuRecordList(IPage<MyRecordVo> page, @Param("parm") RecordParm parm);
    IPage<FeedbackVo> getStuFeedbackList(IPage<FeedbackVo> page, @Param("parm") FeedbackParm parm);

    StuCourseStatsVo getStuCourseStats(@Param("stuId") Long stuId);
    List<StuScoreTuple> getStuScore(@Param("stuId") Long stuId);
}
