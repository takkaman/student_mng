package com.stu.web.record_feedback.service.impl;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.stu.web.record_feedback.entity.FeedbackListParm;
import com.stu.web.record_feedback.entity.FeedbackVo;
import com.stu.web.record_feedback.entity.RecordFeedback;
import com.stu.web.record_feedback.mapper.RecordFeedbackMapper;
import com.stu.web.record_feedback.service.RecordFeedbackService;
import com.stu.web.school_student.entity.FeedbackParm;
import org.springframework.stereotype.Service;

@Service
public class RecordFeedbackServiceImpl extends ServiceImpl<RecordFeedbackMapper, RecordFeedback> implements RecordFeedbackService {

    @Override
    public IPage<FeedbackVo> getFeedbackList(FeedbackListParm parm) {
        //构造分页对象
        IPage<FeedbackVo> page = new Page<>(parm.getCurrentPage(),parm.getPageSize());
        return this.baseMapper.getFeedbackList(page,parm);
    }
}
