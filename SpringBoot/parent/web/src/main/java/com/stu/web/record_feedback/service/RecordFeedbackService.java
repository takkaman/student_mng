package com.stu.web.record_feedback.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;
import com.stu.web.record_feedback.entity.FeedbackListParm;
import com.stu.web.record_feedback.entity.FeedbackVo;
import com.stu.web.record_feedback.entity.RecordFeedback;
import com.stu.web.school_student.entity.FeedbackParm;

public interface RecordFeedbackService extends IService<RecordFeedback> {

    IPage<FeedbackVo> getFeedbackList(FeedbackListParm parm);
}
