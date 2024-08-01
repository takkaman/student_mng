package com.stu.web.school_teacher.controller;

import cn.afterturn.easypoi.excel.ExcelExportUtil;
import cn.afterturn.easypoi.excel.ExcelImportUtil;
import cn.afterturn.easypoi.excel.entity.ExportParams;
import cn.afterturn.easypoi.excel.entity.ImportParams;
import cn.afterturn.easypoi.excel.entity.enmus.ExcelType;
import cn.afterturn.easypoi.excel.entity.result.ExcelImportResult;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.stu.utils.ResultUtils;
import com.stu.utils.ResultVo;
import com.stu.web.class_course.entity.ClassCourse;
import com.stu.web.class_course.entity.TeacherCourseVo;
import com.stu.web.class_course.service.ClassCourseService;
import com.stu.web.school_class.entity.SchoolClass;
import com.stu.web.school_class.service.SchoolClassService;
import com.stu.web.school_student.entity.SchoolStudent;
import com.stu.web.school_student.service.SchoolStudentService;
import com.stu.web.school_teacher.entity.*;
import com.stu.web.school_teacher.service.SchoolTeacherService;
import com.stu.web.stu_points.entity.StuPoints;
import com.stu.web.sys_role.entity.SysRole;
import com.stu.web.sys_role.service.SysRoleService;
import com.stu.web.teacher_role.entity.TeacherRole;
import com.stu.web.teacher_role.service.TeacherRoleService;
import org.apache.commons.lang.StringUtils;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.DigestUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

@RestController
@RequestMapping("/api/teacher")
public class SchoolTeacherController {
    @Autowired
    private SchoolTeacherService schoolTeacherService;
    @Autowired
    private SysRoleService sysRoleService;
    @Autowired
    private TeacherRoleService teacherRoleService;
    @Autowired
    private ClassCourseService classCourseService;
    @Autowired
    private SchoolClassService schoolClassService;
    @Autowired
    private SchoolStudentService schoolStudentService;

    //重置密码
    @PostMapping("/resetPassword")
    public ResultVo resetPassword(@RequestBody SchoolTeacher schoolTeacher){
        schoolTeacher.setPassword(DigestUtils.md5DigestAsHex(schoolTeacher.getPassword().getBytes()));
        boolean b = schoolTeacherService.updateById(schoolTeacher);
        if(b){
            return ResultUtils.success("重置密码成功!");
        }
        return ResultUtils.error("重置密码失败!");
    }

    //导入学生成绩
    @RequestMapping("/importStuINfo")
    public ResultVo importStuINfo(@RequestParam("file") MultipartFile file, Long classId, Long courseId) throws Exception {
        ImportParams importParams = new ImportParams();
        // 数据处理
        importParams.setHeadRows(1);
        ExcelImportResult<ExportStuExcel> result = ExcelImportUtil.importExcelMore(file.getInputStream(), ExportStuExcel.class, importParams);
        List<ExportStuExcel> list = result.getList();
        if (list.size() == 0) {
            return ResultUtils.error("请录入学生成绩");
        }
        List<StuPoints> pointsList = new ArrayList<>();
        //查询学生
        for (int i = 0; i < list.size(); i++) {
            QueryWrapper<SchoolStudent> query = new QueryWrapper<>();
            query.lambda().eq(SchoolStudent::getStuNum, list.get(i).getStuNum());
            SchoolStudent one = schoolStudentService.getOne(query);
            if (one != null) {
                StuPoints points = new StuPoints();
                points.setClassId(classId);
                points.setCourseId(courseId);
                points.setStuId(one.getStuId());
                points.setPoint(list.get(i).getPoints());
                pointsList.add(points);
            }
        }
        schoolTeacherService.savePoint(pointsList, classId, courseId);
        return ResultUtils.success("导入成功!");
    }

    @RequestMapping("/exportStuInfo")
    public void exportStuInfo(HttpServletResponse response, ExportStuParm parm) throws Exception {
        //查询班级信息
        SchoolClass aClass = schoolClassService.getById(parm.getClassId());
        //查询班级的所有学生
        QueryWrapper<SchoolStudent> query = new QueryWrapper<>();
        query.lambda().eq(SchoolStudent::getClassId, parm.getClassId());
        //学生列表
        List<SchoolStudent> studentList = schoolStudentService.list(query);
        //导出excel，组装数据
        List<ExportStuExcel> list = new ArrayList<>();
        for (int i = 0; i < studentList.size(); i++) {
            ExportStuExcel excel = new ExportStuExcel();
            excel.setStuName(studentList.get(i).getStuName());
            excel.setStuNum(studentList.get(i).getStuNum());
            list.add(excel);
        }
        //导出
        String fileName = aClass.getClassName() + ".xlsx";
        ExportParams exportParams = new ExportParams();
        exportParams.setType(ExcelType.XSSF);
        Workbook workbook = ExcelExportUtil.exportExcel(exportParams, ExportStuExcel.class, list);
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

    //查询教师课程
    @GetMapping("/getCourseList")
    public ResultVo getCourseList(TeacherCourseVo teacherCourseVo) {
        IPage<ClassCourse> list = classCourseService.getTeacherCourse(teacherCourseVo);
        return ResultUtils.success("查询成功", list);
    }


    //新增
    @PostMapping
    public ResultVo add(@RequestBody SchoolTeacher schoolTeacher) {
        QueryWrapper<SchoolTeacher> query = new QueryWrapper<>();
        query.lambda().eq(SchoolTeacher::getTeacherNum,schoolTeacher.getTeacherNum());
        SchoolTeacher one = schoolTeacherService.getOne(query);
        if(one != null){
            return ResultUtils.error("教师编号重复!");
        }
        schoolTeacher.setPassword(DigestUtils.md5DigestAsHex(schoolTeacher.getPassword().getBytes()));
        schoolTeacherService.addTeacher(schoolTeacher);
        return ResultUtils.success("新增成功");
    }

    //编辑
    @PutMapping
    public ResultVo edit(@RequestBody SchoolTeacher schoolTeacher) {
         QueryWrapper<SchoolTeacher> query = new QueryWrapper<>();
        query.lambda().eq(SchoolTeacher::getTeacherNum,schoolTeacher.getTeacherNum());
        SchoolTeacher one = schoolTeacherService.getOne(query);
        if(one != null && !one.getTeacherId().equals(schoolTeacher.getTeacherId())){
            return ResultUtils.error("教师编号重复!");
        }
        schoolTeacherService.editTeacher(schoolTeacher);
        return ResultUtils.success("编辑成功");
    }

    //删除
    @DeleteMapping("/{teacherId}")
    public ResultVo delete(@PathVariable("teacherId") Long teacherId) {
        schoolTeacherService.deleteTeacher(teacherId);
        return ResultUtils.success("删除成功");
    }

    //列表
    @GetMapping("/list")
    public ResultVo list(TeacherListParm parm) {
        //构造分页对象
        IPage<SchoolTeacher> page = new Page<>(parm.getCurrentPage(), parm.getPageSize());
        //构造查询条件
        QueryWrapper<SchoolTeacher> query = new QueryWrapper<>();
        if (StringUtils.isNotEmpty(parm.getTeacherName())) {
            query.lambda().like(SchoolTeacher::getTeacherName, parm.getTeacherName());
        }
        IPage<SchoolTeacher> list = schoolTeacherService.page(page, query);
        return ResultUtils.success("查询成功", list);
    }

    //教师列表
    @GetMapping("/getList")
    public ResultVo getList() {
        List<SchoolTeacher> list = schoolTeacherService.list();
        return ResultUtils.success("查询成功", list);
    }

    //角色列表
    @GetMapping("/getRole")
    public ResultVo getRole() {
        List<SysRole> list = sysRoleService.list();
        return ResultUtils.success("查询成功", list);
    }

    //角色查询
    @GetMapping("/getRoleById")
    public ResultVo getRoleById(Long teacherId) {
        QueryWrapper<TeacherRole> query = new QueryWrapper<>();
        query.lambda().eq(TeacherRole::getTeacherId, teacherId);
        TeacherRole one = teacherRoleService.getOne(query);
        return ResultUtils.success("查询成功", one);
    }

    // 教师信息统计
    @GetMapping("/getTeacherStats")
    public ResultVo getTeacherStats(TeacherStatParm parm) {
        TeacherStatsVo teacherStatsVo = new TeacherStatsVo();
        Long teacherId = parm.getUserId();

        teacherStatsVo = schoolTeacherService.getTeacherStats(teacherId);
        teacherStatsVo.setDurationCount(schoolTeacherService.getAccCourseDuration(teacherId));

        QueryWrapper<ClassCourse> query = new QueryWrapper<>();
        query.lambda().eq(ClassCourse::getTeacherId, teacherId);
        int courseCount = classCourseService.count(query);
        teacherStatsVo.setCourseCount(courseCount);

        return ResultUtils.success("查询成功", teacherStatsVo);
    }
}
