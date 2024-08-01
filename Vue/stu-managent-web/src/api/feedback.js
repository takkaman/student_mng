import http from "@/utils/http";
//新增
export const addApi = async(parm)=>{
    return await http.post("/api/feedback",parm)
}
//列表
export const listApi = async(parm)=>{
    return await http.get("/api/feedback/list",parm)
}
//通过
export const approveApi = async(parm)=>{
    return await http.post("/api/feedback/approve",parm)
}
//拒绝
export const rejectApi = async(parm)=>{
    return await http.post("/api/feedback/reject",parm)
}