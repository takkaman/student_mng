package com.stu.web.record_feedback.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.LambdaUpdateWrapper;
import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.stu.utils.ResultUtils;
import com.stu.utils.ResultVo;
import com.stu.web.class_course.entity.ClassCourse;
import com.stu.web.class_course.entity.TeacherCourseVo;
import com.stu.web.record_feedback.entity.FeedbackListParm;
import com.stu.web.record_feedback.entity.RecordFeedback;
import com.stu.web.record_feedback.service.RecordFeedbackService;
import com.stu.web.record_feedback.entity.FeedbackVo;
import com.stu.web.record_student.entity.RecordStudent;
import com.stu.web.record_student.service.RecordStudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Date;
import java.util.Objects;

import static com.baomidou.mybatisplus.core.toolkit.Wrappers.lambdaQuery;

@RestController
@RequestMapping("/api/feedback")
public class SysFeedbackController {
    @Autowired
    private RecordFeedbackService recordFeedbackService;

    @Autowired
    private RecordStudentService recordStudentService;

    //新增
    @PostMapping
    public ResultVo add(@RequestBody RecordFeedback recordFeedback) {
        QueryWrapper<RecordFeedback> query = new QueryWrapper<>();
        query.lambda().eq(RecordFeedback::getRecordId, recordFeedback.getRecordId())
                .eq(RecordFeedback::getStuId, recordFeedback.getStuId())
                .eq(RecordFeedback::getStatus, 0);
        RecordFeedback rf = recordFeedbackService.getOne(query);

        if (rf != null) {
            return ResultUtils.error("申请失败，重复申请！");
        }

        recordFeedback.setStatus(0);
        recordFeedback.setCreateTime(new Date());
        boolean save = recordFeedbackService.save(recordFeedback);
        if (save) {
            return ResultUtils.success("新增成功");
        }
        return ResultUtils.error("新增失败");
    }

    //编辑
    @PutMapping
    public ResultVo edit(@RequestBody RecordFeedback recordFeedback) {
        boolean save = recordFeedbackService.updateById(recordFeedback);
        if (save) {
            return ResultUtils.success("编辑成功");
        }
        return ResultUtils.error("编辑失败");
    }

    //列表
    @GetMapping("/list")
    public ResultVo list(FeedbackListParm parm) {
        IPage<FeedbackVo> list = recordFeedbackService.getFeedbackList(parm);
        return ResultUtils.success("查询成功", list);
    }

    @PostMapping("/approve")
    public ResultVo approve(@RequestBody RecordFeedback recordFeedback) {
        // 要做得更好的话，需要把两次数据库封装在一个事务里
        LambdaUpdateWrapper<RecordFeedback> updateWrapper = new LambdaUpdateWrapper<>();
        updateWrapper.eq(RecordFeedback::getRecordFeedbackId, recordFeedback.getRecordFeedbackId())
                .set(RecordFeedback::getStatus, 1)
                .set(RecordFeedback::getUpdateTime, new Date());

        boolean save = recordFeedbackService.update(new RecordFeedback(), updateWrapper);

        if (Objects.equals(recordFeedback.getType(), "0")) {
            // 奖励类型申请通过，需要新增相关学生记录
            RecordStudent recordStudent = new RecordStudent();
            recordStudent.setRecordId(recordFeedback.getRecordId());
            recordStudent.setStuId(recordFeedback.getStuId());
            recordStudentService.save(recordStudent);
        } else if (Objects.equals(recordFeedback.getType(), "1")) {
            // 违纪类型申请通过，需要移除相关学生记录
            QueryWrapper<RecordStudent> query = new QueryWrapper<>();
            query.lambda().eq(RecordStudent::getRecordId, recordFeedback.getRecordId()).eq(RecordStudent::getStuId, recordFeedback.getStuId());
            recordStudentService.remove(query);
        }

        if (save) {
            return ResultUtils.success("审核成功");
        }

        return ResultUtils.error("审核成失败");
    }

    @PostMapping("/reject")
    public ResultVo reject(@RequestBody RecordFeedback recordFeedback) {
//        RecordFeedback recordFeedback = recordFeedbackService.getById(parm.getRecordFeedbackId());
//        recordFeedback.setStatus(2);
//
//        boolean save = recordFeedbackService.saveOrUpdate(recordFeedback);

        LambdaUpdateWrapper<RecordFeedback> updateWrapper = new LambdaUpdateWrapper<>();
        updateWrapper.eq(RecordFeedback::getRecordFeedbackId, recordFeedback.getRecordFeedbackId())
                .set(RecordFeedback::getStatus, 2)
                .set(RecordFeedback::getUpdateTime, new Date());

        boolean save = recordFeedbackService.update(null, updateWrapper);

        if (save) {
            return ResultUtils.success("审核成功");
        }

         return ResultUtils.error("审核失败");
    }
}
