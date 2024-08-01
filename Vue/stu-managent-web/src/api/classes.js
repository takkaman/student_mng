import http from "@/utils/http";
//查专业列表
export const getMajorListApi = async(parm)=>{
    return await http.get("/api/class/getMajorListById",parm)
}
//新增
export const addApi = async(parm)=>{
    return await http.post("/api/class",parm)
}
//列表
export const listApi = async(parm)=>{
    return await http.get("/api/class/list",parm)
}
//根据专业id查询学院id
export const getMajorApi = async(parm)=>{
    return await http.get("/api/class/getCollageId",parm)
}
//编辑
export const editApi = async(parm)=>{
    return await http.put("/api/class",parm)
}
//删除
export const deleteApi = async(parm)=>{
    return await http.delete("/api/class",parm)
}
//根据学院id查询专业
export const getMajorListsApi = async(parm)=>{
    return await http.get("/api/class/getMajorListByCollageId",parm)
}