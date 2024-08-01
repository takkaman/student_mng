import http from "@/utils/http";
//新增
export const addApi = async(parm)=>{
    return await http.post("/api/record",parm)
}
//列表
export const listApi = async(parm)=>{
    return await http.get("/api/record/list",parm)
}
//列表
export const listAvailableApi = async(parm)=>{
    return await http.get("/api/record/listAvailable",parm)
}
//编辑
export const editApi = async(parm)=>{
    return await http.put("/api/record",parm)
}
//删除
export const deleteApi = async(parm)=>{
    return await http.delete("/api/record",parm)
}
export const getTopListApi = async()=>{
    return await http.get("/api/record/getTopList",null)
}
export const assignSaveApi = async(parm)=>{
    return await http.post("/api/record/assignSave",parm)
}