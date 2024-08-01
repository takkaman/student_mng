import http from "@/utils/http";
//新增
export const addApi = async(parm)=>{
    return await http.post("/api/course",parm)
}
//列表
export const listApi = async(parm)=>{
    return await http.get("/api/course/list",parm)
}
//编辑
export const editApi = async(parm)=>{
    return await http.put("/api/course",parm)
}
//删除
export const deleteApi = async(parm)=>{
    return await http.delete("/api/course",parm)
}
//分配教师
export const assignSaveApi = async(parm)=>{
    return await http.post("/api/course/assignSave",parm)
}
//解除教师
export const removeTeacherApi = async(parm)=>{
    return await http.post("/api/course/removeTeacher",parm)
}
//班级树
export const getClassTreeApi = async()=>{
    return await http.get("/api/classCourse/getClassTree",null)
}
//课程列表
export const getCourseListApi = async(parm)=>{
    return await http.get("/api/classCourse/getCourseList",parm)
}
//分配课程保存
export const saveCourseApi = async(parm)=>{
    return await http.post("/api/classCourse/saveCourse",parm)
}
//班级课程
export const getClassCourseApi = async(parm)=>{
    return await http.get("/api/classCourse/getClassCourse",parm)
}
//删除分配课程
export const deleteClassCourseApi = async(parm)=>{
    return await http.delete("/api/classCourse",parm)
}