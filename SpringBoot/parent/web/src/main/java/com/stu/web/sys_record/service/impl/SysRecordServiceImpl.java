package com.stu.web.sys_record.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.stu.web.sys_record.entity.SysRecord;
import com.stu.web.sys_record.mapper.SysRecordMapper;
import com.stu.web.sys_record.service.SysRecordService;
import org.springframework.stereotype.Service;

@Service
public class SysRecordServiceImpl extends ServiceImpl<SysRecordMapper, SysRecord> implements SysRecordService {
}
