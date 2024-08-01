import http from '@/utils/http'
//获取列表
export const getListApi = async(parm) =>{
    return await http.get("/api/role/list",parm)
}
//新增
export const addRoleApi = async(parm) =>{
     return await http.post("/api/role",parm)
}
//编辑
export const editRoleApi = async(parm) =>{
    return await http.put("/api/role",parm)
}
//删除
export const deleteRoleApi = async(parm) =>{
    return await http.delete("/api/role",parm)
}
//获取分配权限的数据
export const assignRoleApi = async(parm)=>{
    return await http.get("/api/role/getAssingShow",parm)
}
//分配权限保存
export const saveAssignApi = async(parm)=>{
    return await http.post("/api/role/saveRoleMenu",parm)
}