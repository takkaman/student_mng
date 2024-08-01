import http from "@/utils/http";
//新增
export const addApi = async(parm)=>{
    return await http.post("/api/teacher",parm)
}
//列表
export const listApi = async(parm)=>{
    return await http.get("/api/teacher/list",parm)
}
//编辑
export const editApi = async(parm)=>{
    return await http.put("/api/teacher",parm)
}
//删除
export const deleteApi = async(parm)=>{
    return await http.delete("/api/teacher",parm)
}
//分配教师列表
export const listAssignApi = async()=>{
    return await http.get("/api/teacher/getList",null)
}
export const getRoleApi = async()=>{
    return await http.get("/api/teacher/getRole",null)
}
export const getRoleByIdApi = async(parm)=>{
    return await http.get("/api/teacher/getRoleById",parm)
}
//教授课程
export const getCourseListApi = async(parm)=>{
    return await http.get("/api/teacher/getCourseList",parm)
}
//导入成绩
export const importStuINfoApi = async(parm)=>{
    return await http.upload("/api/teacher/importStuINfo",parm)
}
//重置密码
export const resetPasswordApi = async(parm)=>{
    return await http.post("/api/teacher/resetPassword",parm)
}
//教师信息统计
export const getTeacherStatsApi = async(parm)=>{
    return await http.get("/api/teacher/getTeacherStats",parm)
}