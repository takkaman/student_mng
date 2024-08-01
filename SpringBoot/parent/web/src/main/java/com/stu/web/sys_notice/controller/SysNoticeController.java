package com.stu.web.sys_notice.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.stu.utils.ResultUtils;
import com.stu.utils.ResultVo;
import com.stu.web.sys_notice.entity.NoticeListParm;
import com.stu.web.sys_notice.entity.SysNotice;
import com.stu.web.sys_notice.service.SysNoticeService;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Date;
import java.util.List;

@RestController
@RequestMapping("/api/notice")
public class SysNoticeController {
    @Autowired
    private SysNoticeService sysNoticeService;

    //查询最近3条公告
    @GetMapping("/getTopList")
    public ResultVo getTopList(){
        QueryWrapper<SysNotice> query = new QueryWrapper<>();
        query.lambda().orderByDesc(SysNotice::getCreateTime).last(" limit 3 ");
        List<SysNotice> list = sysNoticeService.list(query);
        return ResultUtils.success("查询成功",list);
    }

    //新增
    @PostMapping
    public ResultVo add(@RequestBody SysNotice sysNotice){
        sysNotice.setCreateTime(new Date());
        boolean save = sysNoticeService.save(sysNotice);
        if(save){
            return ResultUtils.success("新增成功");
        }
        return ResultUtils.error("新增失败");
    }

     //编辑
    @PutMapping
    public ResultVo edit(@RequestBody SysNotice sysNotice){
        boolean save = sysNoticeService.updateById(sysNotice);
        if(save){
            return ResultUtils.success("编辑成功");
        }
        return ResultUtils.error("编辑失败");
    }

    //删除
    @DeleteMapping("/{noticeId}")
    public ResultVo delete(@PathVariable("noticeId") Long noticeId){
        boolean b = sysNoticeService.removeById(noticeId);
        if(b){
            return ResultUtils.success("删除成功");
        }
        return ResultUtils.error("删除失败");
    }

    //列表
    @GetMapping("/list")
    public ResultVo list(NoticeListParm parm){
        //构造分页对象
        IPage<SysNotice> page = new Page<>(parm.getCurrentPage(),parm.getPageSize());
        //分页条件
        QueryWrapper<SysNotice> query = new QueryWrapper<>();
        if(StringUtils.isNotEmpty(parm.getTitle())){
            query.lambda().like(SysNotice::getTitle,parm.getTitle());
        }
        query.lambda().orderByDesc(SysNotice::getCreateTime);
        IPage<SysNotice> list = sysNoticeService.page(page, query);
        return ResultUtils.success("查询成功",list);
    }


}
