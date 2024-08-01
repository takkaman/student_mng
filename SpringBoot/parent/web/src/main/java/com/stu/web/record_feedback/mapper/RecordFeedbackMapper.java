package com.stu.web.record_feedback.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.stu.web.record_feedback.entity.FeedbackListParm;
import com.stu.web.record_feedback.entity.FeedbackVo;
import com.stu.web.record_feedback.entity.RecordFeedback;
import com.stu.web.school_student.entity.FeedbackParm;
import org.apache.ibatis.annotations.Param;

public interface RecordFeedbackMapper extends BaseMapper<RecordFeedback> {

    IPage<FeedbackVo> getFeedbackList(IPage<FeedbackVo> page, @Param("parm") FeedbackListParm parm);

}
