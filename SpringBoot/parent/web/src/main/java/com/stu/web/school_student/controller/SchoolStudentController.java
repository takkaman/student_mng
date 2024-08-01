package com.stu.web.school_student.controller;

import cn.afterturn.easypoi.excel.ExcelExportUtil;
import cn.afterturn.easypoi.excel.ExcelImportUtil;
import cn.afterturn.easypoi.excel.entity.ExportParams;
import cn.afterturn.easypoi.excel.entity.ImportParams;
import cn.afterturn.easypoi.excel.entity.enmus.ExcelType;
import cn.afterturn.easypoi.excel.entity.result.ExcelImportResult;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.stu.utils.ResultUtils;
import com.stu.utils.ResultVo;
import com.stu.web.record_feedback.entity.FeedbackVo;
import com.stu.web.school_class.entity.SchoolClass;
import com.stu.web.school_class.service.SchoolClassService;
import com.stu.web.school_student.entity.*;
import com.stu.web.school_student.service.SchoolStudentService;
import com.stu.web.stu_role.entity.StuRole;
import com.stu.web.stu_role.service.StuRoleService;
import com.stu.web.sys_role.entity.SysRole;
import com.stu.web.sys_role.service.SysRoleService;
import org.apache.commons.lang.StringUtils;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.DigestUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

@RestController
@RequestMapping("/api/student")
public class SchoolStudentController {
    @Autowired
    private SchoolStudentService schoolStudentService;
    @Autowired
    private SchoolClassService schoolClassService;
    @Autowired
    private SysRoleService sysRoleService;
    @Autowired
    private StuRoleService stuRoleService;

    //热门专业统计
    @GetMapping("/getHotMajor")
    public ResultVo getHotMajor() {
        List<HotMajorVo> hotMajor = schoolStudentService.getHotMajor();
        return ResultUtils.success("查询成功", hotMajor);
    }


    //查询学生统计
    @GetMapping("/getStuCount")
    public ResultVo getStuCount() {
        StuCount stuCount = schoolStudentService.getStuCount();
        return ResultUtils.success("查询成功", stuCount);
    }

    @RequestMapping("/exportStuInfo")
    public void exportStuInfo(HttpServletResponse response, Long classId) throws Exception {
        SchoolClass aClass = schoolClassService.getById(classId);
        //查询学生信息
        QueryWrapper<SchoolStudent> query = new QueryWrapper<>();
        query.lambda().eq(SchoolStudent::getClassId, classId);
        List<SchoolStudent> list1 = schoolStudentService.list(query);
        //导出excel，组装数据
        List<StuExcel> list = new ArrayList<>();
        if (list1.size() > 0) {
            for (int i = 0; i < list1.size(); i++) {
                StuExcel excel = new StuExcel();
                BeanUtils.copyProperties(list1.get(i), excel);
                list.add(excel);
            }
        }
        //导出
        String fileName = aClass.getClassName() + "学生信息.xlsx";
        ExportParams exportParams = new ExportParams();
        exportParams.setType(ExcelType.XSSF);
        Workbook workbook = ExcelExportUtil.exportExcel(exportParams, StuExcel.class, list);
        downloadExcel(fileName, workbook, response);
    }

    //导入学生
    @RequestMapping("/importStuINfo")
    public ResultVo importStuINfo(@RequestParam("file") MultipartFile file, Long classId, String intoTime) throws Exception {
        ImportParams importParams = new ImportParams();
        // 数据处理
        importParams.setHeadRows(1);
        ExcelImportResult<StuExcel> result = ExcelImportUtil.importExcelMore(file.getInputStream(), StuExcel.class, importParams);
        List<StuExcel> list = result.getList();
        if (list.size() == 0) {
            return ResultUtils.error("请录入学生信息");
        }
        //查询学生角色id
        QueryWrapper<SysRole> query = new QueryWrapper<>();
        query.lambda().eq(SysRole::getRoleType, "2");
        SysRole one = sysRoleService.getOne(query);
        if (one == null) {
            return ResultUtils.error("请先到角色管理创建学生角色!");
        }
        //查询学生
        for (int i = 0; i < list.size(); i++) {
            SchoolStudent student = new SchoolStudent();
            BeanUtils.copyProperties(list.get(i), student);
            student.setRoleId(one.getRoleId());
            student.setClassId(classId);
            student.setIntoTime(intoTime);
            student.setPassword(DigestUtils.md5DigestAsHex("666666".getBytes()));
            student.setStuNum(Integer.toString((int) ((Math.random() * 9 + 1) * 100000)));
            schoolStudentService.addStu(student);
        }
        return ResultUtils.success("导入成功!");
    }

    @RequestMapping("/importStuTemplate")
    public void importStuTemplate(HttpServletResponse response) throws Exception {
        //导出excel，组装数据
        List<StuExcel> list = new ArrayList<>();
        //导出
        String fileName = "学生信息模板.xlsx";
        ExportParams exportParams = new ExportParams();
        exportParams.setType(ExcelType.XSSF);
        Workbook workbook = ExcelExportUtil.exportExcel(exportParams, StuExcel.class, list);
        downloadExcel(fileName, workbook, response);
    }

    public static void downloadExcel(String fileName, Workbook workbook, HttpServletResponse response) throws Exception {
        try {
            if (StringUtils.isEmpty(fileName)) {
                throw new RuntimeException("导出文件名不能为空");
            }
            String encodeFileName = URLEncoder.encode(fileName, "UTF-8");
            response.setHeader("content-Type", "application/vnd.ms-excel; charset=utf-8");
            response.setHeader("Content-Disposition", "attachment;filename=" + encodeFileName);
            response.setHeader("FileName", encodeFileName);
            response.setHeader("Access-Control-Expose-Headers", "FileName");
            workbook.write(response.getOutputStream());
            workbook.close();
        } catch (Exception e) {
            workbook.close();
        }
    }

    //重置密码
    @PostMapping("/resetPassword")
    public ResultVo resetPassword(@RequestBody SchoolStudent schoolStudent) {
        schoolStudent.setPassword(DigestUtils.md5DigestAsHex(schoolStudent.getPassword().getBytes()));
        boolean b = schoolStudentService.updateById(schoolStudent);
        if (b) {
            return ResultUtils.success("重置密码成功!");
        }
        return ResultUtils.error("重置密码失败!");
    }

    //查询学生课程列表
    @GetMapping("/getCourseList")
    public ResultVo getCourseList(CourseParm parm) {
        IPage<MyCourseVo> list = schoolStudentService.getCourseList(parm);
        return ResultUtils.success("查询成功", list);
    }

    //查询学生奖惩列表
    @GetMapping("/getStuRecordList")
    public ResultVo getStuRecordList(RecordParm parm) {
        IPage<MyRecordVo> list = schoolStudentService.getStuRecordList(parm);
        return ResultUtils.success("查询成功", list);
    }

    //查询学生反馈列表
    @GetMapping("/getStuFeedbackList")
    public ResultVo getStuFeedbackList(FeedbackParm parm) {
        IPage<FeedbackVo> list = schoolStudentService.getStuFeedbackList(parm);
        return ResultUtils.success("查询成功", list);
    }

    //新增
    @PostMapping
    public ResultVo add(@RequestBody SchoolStudent schoolStudent) {
        QueryWrapper<SchoolStudent> query = new QueryWrapper<>();
        query.lambda().eq(SchoolStudent::getStuNum, schoolStudent.getStuNum());
        SchoolStudent one = schoolStudentService.getOne(query);
        if (one != null) {
            return ResultUtils.error("学号重复!");
        }
        schoolStudent.setPassword(DigestUtils.md5DigestAsHex(schoolStudent.getPassword().getBytes()));
        schoolStudentService.addStu(schoolStudent);
        return ResultUtils.success("新增成功");
    }

    //编辑
    @PutMapping
    public ResultVo edit(@RequestBody SchoolStudent schoolStudent) {
        QueryWrapper<SchoolStudent> query = new QueryWrapper<>();
        query.lambda().eq(SchoolStudent::getStuNum, schoolStudent.getStuNum());
        SchoolStudent one = schoolStudentService.getOne(query);
        if (one != null && !one.getStuId().equals(schoolStudent.getStuId())) {
            return ResultUtils.error("学号重复!");
        }
        schoolStudentService.editStu(schoolStudent);
        return ResultUtils.success("编辑成功");
    }

    @GetMapping("/getStuStat")
    public ResultVo getStuStat(StuStatParm parm) {
        StuCourseStatsVo stuCourseStatsVo = new StuCourseStatsVo();
        Long stuId = parm.getUserId();

        stuCourseStatsVo = schoolStudentService.getStuCourseStats(stuId);

        List<StuScoreTuple> scores = schoolStudentService.getStuScore(stuId);
        double totalPoint = 0.0;
        double totalCredit = 0.0;
        for (StuScoreTuple s : scores) {
            if (s.getScore() >= 90) {
                s.setScore(90.0);
            }
            double point = s.getScore() / 10 - 5;
            totalPoint += point * s.getCredit();
            totalCredit += s.getCredit();
        }

        stuCourseStatsVo.setScorePoint(String.format("%.2f", totalPoint / totalCredit));
        return ResultUtils.success("查询成功", stuCourseStatsVo);
    }


    //删除
    @DeleteMapping("/{stuId}")
    public ResultVo edit(@PathVariable("stuId") Long stuId) {
        schoolStudentService.deleteStu(stuId);
        return ResultUtils.success("删除成功");
    }

    //根据id查询
    @GetMapping("/getById")
    public ResultVo getById(Long stuId) {
        SchoolStudent stu = schoolStudentService.getStuById(stuId);
        return ResultUtils.success("查询成功", stu);
    }

    //查询列表
    @GetMapping("/list")
    public ResultVo list(StuParm parm) {
        IPage<SchoolStudent> list = schoolStudentService.getList(parm);
        return ResultUtils.success("查询成功", list);
    }

    //教师列表
    @GetMapping("/getList")
    public ResultVo getList() {
        List<SchoolStudent> list = schoolStudentService.list();
        return ResultUtils.success("查询成功", list);
    }

    //根据专业id查询班级列表
    @GetMapping("/getClassList")
    public ResultVo getClassList(Long majorId) {
        QueryWrapper<SchoolClass> query = new QueryWrapper<>();
        query.lambda().eq(SchoolClass::getMajorId, majorId);
        List<SchoolClass> list = schoolClassService.list(query);
        return ResultUtils.success("查询成功", list);
    }

    //查询学生角色
    @GetMapping("/getRoleList")
    public ResultVo getRoleList() {
        QueryWrapper<SysRole> query = new QueryWrapper<>();
        query.lambda().eq(SysRole::getRoleType, "2");
        List<SysRole> list = sysRoleService.list(query);
        return ResultUtils.success("查询成功", list);
    }

    //根据学生id查询角色id
    @GetMapping("/getRoleId")
    public ResultVo getRoleId(Long stuId) {
        QueryWrapper<StuRole> query = new QueryWrapper<>();
        query.lambda().eq(StuRole::getStuId, stuId);
        StuRole role = stuRoleService.getOne(query);
        return ResultUtils.success("查询成功", role);
    }

    @GetMapping("/getStuInfo")
    public ResultVo getStuInfo(Long stuId) {
        QueryWrapper<StuRole> query = new QueryWrapper<>();
        query.lambda().eq(StuRole::getStuId, stuId);
        StuRole role = stuRoleService.getOne(query);
        return ResultUtils.success("查询成功", role);
    }
}
