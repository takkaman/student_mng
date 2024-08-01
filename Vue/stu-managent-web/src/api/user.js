import request from '@/utils/request'
import http from '@/utils/http'
export function login(data) {
  return request({
    url: '/vue-admin-template/user/login',
    method: 'post',
    data
  })
}

// export function getInfo(token) {
//   return request({
//     url: '/vue-admin-template/user/info',
//     method: 'get',
//     params: { token }
//   })
// }

export function logout() {
  return request({
    url: '/vue-admin-template/user/logout',
    method: 'post'
  })
}
//获取用户列表
export const getListApi = async(parm) =>{
  return await http.get("/api/user/list",parm)
}
//新增
export const addUserApi = async(parm) =>{
  return await http.post("/api/user",parm)
}
//编辑
export const editUserApi = async(parm) =>{
  return await http.put("/api/user",parm)
}
//删除
export const deleteUserApi = async(parm) =>{
  return await http.delete("/api/user",parm)
}
//角色列表
export const getRoleListApi = async()=>{
  return await http.get("/api/user/roleList")
}
//获取角色
export const getRoleApi = async(parm)=>{
  return await http.get("/api/user/role",parm)
}
//登录
export const loginApi = async(parm)=>{
  return await http.post("/api/login/login",parm)
}
//获取用户权限信息
export const getInfoApi = async(parm)=>{
  return await http.get("/api/login/getInfo",parm)
}
//修改密码
export const UpadatePasswordApi = async(parm)=>{
  return await http.post("/api/login/UpadatePassword",parm)
}
//统计首页总数
export const getHomeCountApi = async()=>{
  return await http.get("/api/login/getHomeCount",null)
}