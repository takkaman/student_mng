import http from "@/utils/http";
//根据专业id查询班级
export const getClassListApi = async(parm)=>{
    return await http.get("/api/student/getClassList",parm)
}
//查询学生角色
export const getRoleListApi = async(parm)=>{
    return await http.get("/api/student/getRoleList",parm)
}
//新增
export const addApi = async(parm)=>{
    return await http.post("/api/student",parm)
}
//列表
export const listApi = async (parm)=>{
    return await http.get("/api/student/list",parm)
}
//列表
export const listAssignApi = async (parm)=>{
    return await http.get("/api/student/getList",null)
}
//编辑回显查询
export const getByIdApi = async(parm)=>{
    return await http.get("/api/student/getById",parm)
}
//编辑
export const editApi = async(parm)=>{
    return await http.put("/api/student",parm)
}
//删除
export const deleteApi = async(parm)=>{
    return await http.delete("/api/student",parm)
}
//查询学生角色
export const getRoleByIdApi = async(parm)=>{
    return await http.get("/api/student/getRoleId",parm)
}
//查询学生课程
export const getCourseListApi = async(parm)=>{
    return await http.get("/api/student/getCourseList",parm)
}
//查询学生奖惩记录
export const getStuRecordList = async(parm)=>{
    return await http.get("/api/student/getStuRecordList",parm)
}
//查询学生反馈记录
export const getStuFeedbackList = async(parm)=>{
    return await http.get("/api/student/getStuFeedbackList",parm)
}
//重置密码
export const resetPasswordApi = async(parm)=>{
    return await http.post("/api/student/resetPassword",parm)
}
export const importStuINfoApi = async(parm)=>{
    return await http.upload("/api/student/importStuINfo",parm)
}
//首页学生统计
export const getStuCountApi = async()=>{
    return await http.get("/api/student/getStuCount",null)
}
//热门专业统计
export const getHotMajorApi = async()=>{
    return await http.get("/api/student/getHotMajor",null)
}
//学生信息统计
export const getStuStatApi = async(parm)=>{
    return await http.get("/api/student/getStuStat",parm)
}