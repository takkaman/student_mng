<template>
  <!-- element ui的标签，当做一个普通的div标签看待就可以 -->
  <el-main>
    <!--搜索栏 
    model : 绑定表单的数据,通常是同一个对象
    ref : 相当于div的id，是唯一的
    rules:表单验证规则
    label-width：表单域标签的宽度
    inline ： 是否在同一行显示
    size：尺寸
    -->
    <el-form
      :model="listParm"
      ref="searchFromRef"
      label-width="80px"
      :inline="true"
      size="small"
    >
      <el-form-item>
        <el-input
          placeholder="请输入型姓名"
          v-model="listParm.nickName"
        ></el-input>
      </el-form-item>
      <el-form-item>
        <el-input
          placeholder="请输入电话号码"
          v-model="listParm.phone"
        ></el-input>
      </el-form-item>
      <el-form-item>
        <el-button @click="searchBtn" icon="el-icon-search">查询</el-button>
        <el-button @click="resetBtn" style="color: #ff7670" icon="el-icon-close"
          >重置</el-button
        >
        <el-button v-permission="['sys:sysUserList:add']" type="primary" @click="addBtn" icon="el-icon-plus"
          >新增</el-button
        >
      </el-form-item>
    </el-form>
    <!-- 表格
    data : 表格的数据
     -->
    <el-table :height="tableHeight" :data="tableData" border stripe>
      <el-table-column prop="nickName" label="姓名"></el-table-column>
      <el-table-column prop="phone" label="电话"></el-table-column>
      <el-table-column prop="email" label="邮箱"></el-table-column>
      <el-table-column v-if="$checkPermission(['sys:sysUserList:edit','sys:sysUserList:delete'])" label="操作" align="center" width="180">
        <template slot-scope="scope">
          <el-button
            type="primary"
            size="small"
            icon="el-icon-edit"
            v-permission="['sys:sysUserList:edit']"
            @click="editBtn(scope.row)"
            >编辑</el-button
          >
          <el-button
            type="danger"
            size="small"
            icon="el-icon-delete"
            v-permission="['sys:sysUserList:delete']"
            @click="deleteBtn(scope.row)"
            >删除</el-button
          >
        </template>
      </el-table-column>
    </el-table>
    <!-- 分页 -->
    <el-pagination
      @size-change="sizeChange"
      @current-change="currentChange"
      :current-page.sync="listParm.currentPage"
      :page-sizes="[10, 20, 40, 80, 100]"
      :page-size="listParm.pageSize"
      layout="total, sizes, prev, pager, next, jumper"
      :total="listParm.total"
      background
    >
    </el-pagination>
    <!-- 新增或编辑弹框组件 -->
    <sys-dialog
      :title="dialog.title"
      :visible="dialog.visible"
      :width="dialog.width"
      :height="dialog.height"
      @onClose="onClose"
      @onConfirm="onConfirm"
    >
      <div slot="content">
        <!-- el-form 、el-form-item : 当做一个普通的form看待
        model ：表单数据对象
        ref ： 相当于div的一个id，是唯一的
        rules : 表单验证规则
        label-width ：表单域标签的宽度
        inline ： 是否在同一行显示，如果使用el-row布局。不需要该属性
        size ： 尺寸
         -->
        <el-form
          :model="addModel"
          ref="addRef"
          :rules="rules"
          label-width="80px"
          size="small"
          style="margin-right: 40px"
        >
          <!-- el-row : 代表一行
               el-col ：代表列
         -->
          <el-row>
            <el-col :span="12" :offset="0">
              <el-form-item prop="nickName" label="姓名">
                <el-input v-model="addModel.nickName"></el-input>
              </el-form-item>
            </el-col>
            <el-col :span="12" :offset="0">
              <el-form-item prop="phone" label="电话">
                <el-input v-model="addModel.phone"></el-input>
              </el-form-item>
            </el-col>
          </el-row>
          <el-row>
            <el-col :span="12" :offset="0">
              <el-form-item label="邮箱">
                <el-input v-model="addModel.email"></el-input>
              </el-form-item>
            </el-col>
            <el-col :span="12" :offset="0">
              <el-form-item prop="sex" label="性别">
                <el-radio-group v-model="addModel.sex">
                  <el-radio :label="'0'">男</el-radio>
                  <el-radio :label="'1'">女</el-radio>
                </el-radio-group>
              </el-form-item>
            </el-col>
          </el-row>
          <el-row>
            <el-col :span="12" :offset="0">
              <el-form-item prop="roleId" label="角色">
                <el-select v-model="addModel.roleId" placeholder="请选择角色">
                  <el-option
                    v-for="item in roleList"
                    :key="item.roleId"
                    :label="item.roleName"
                    :value="item.roleId"
                  >
                  </el-option>
                </el-select>
              </el-form-item>
            </el-col>
            <el-col :span="12" :offset="0">
              <el-form-item prop="username" label="账户">
                <el-input v-model="addModel.username"></el-input>
              </el-form-item>
            </el-col>
          </el-row>
          <el-row>
            <el-col v-if="addModel.type == '0'" :span="12" :offset="0">
              <el-form-item prop="password" label="密码">
                <el-input v-model="addModel.password"></el-input>
              </el-form-item>
            </el-col>
          </el-row>
        </el-form>
      </div>
    </sys-dialog>
  </el-main>
</template>

<script>
import {
  addUserApi,
  editUserApi,
  getListApi,
  deleteUserApi,
  getRoleListApi,
  getRoleApi,
} from "@/api/user";
//引入弹框组件
import SysDialog from "@/components/dialog/SysDialog.vue";
export default {
  //注册组件
  components: {
    SysDialog,
  },
  data() {
    return {
      //表单验证规则
      rules: {
        roleId: [
          {
            trigger: "blur",
            required: true,
            message: "请选择角色",
          },
        ],
        nickName: [
          {
            trigger: "blur",
            required: true,
            message: "请输入姓名",
          },
        ],
        phone: [
          {
            trigger: "blur",
            required: true,
            message: "请输入电话",
          },
        ],
        sex: [
          {
            trigger: "blur",
            required: true,
            message: "请选择性别",
          },
        ],
        username: [
          {
            trigger: "blur",
            required: true,
            message: "请输入账户",
          },
        ],
        password: [
          {
            trigger: "blur",
            required: true,
            message: "请输入密码",
          },
        ],
      },
      //表单绑定的数据
      addModel: {
        roleId: "",
        type: "", // 0：新增 1：编辑
        userId: "",
        nickName: "",
        phone: "",
        sex: "",
        email: "",
        username: "",
        password: "",
      },
      //弹框属性
      dialog: {
        title: "",
        visible: false,
        width: 630,
        height: 220,
      },
      //定义表格的高度
      tableHeight: 0,
      //裂变成查询的参数
      listParm: {
        phone: "",
        nickName: "",
        currentPage: 1,
        pageSize: 10,
        total: 0,
      },
      //表格的数据
      tableData: [],
      //角色列表
      roleList: [],
    };
  },
  created() {
    this.getList();
    this.getRolelist();
  },
  methods: {
    async getRolelist() {
      let res = await getRoleListApi();
      if (res && res.code == 200) {
        this.roleList = res.data;
      }
    },
    //获取列表
    async getList() {
      let res = await getListApi(this.listParm);
      console.log("查询列表");
      console.log(res);
      if (res && res.code == 200) {
        this.tableData = res.data.records;
        this.listParm.total = res.data.total;
      }
    },
    //弹框确定
    onConfirm() {
      //表单验证
      this.$refs.addRef.validate(async (valid) => {
        if (valid) {
          let res = null;
          if (this.addModel.type == "0") {
            res = await addUserApi(this.addModel);
          } else {
            res = await editUserApi(this.addModel);
          }
          if (res && res.code == 200) {
            //信息提示
            this.$message({ type: "success", message: res.msg });
            //刷新列表
            this.getList();
            //关闭弹框
            this.dialog.visible = false;
          }
        }
      });
    },
    //弹框关闭
    onClose() {
      this.dialog.visible = false;
    },
    //也树改变时触发
    currentChange(val) {
      this.listParm.currentPage = val;
      this.getList();
    },
    //页容量改变时触发
    sizeChange(val) {
      this.listParm.pageSize = val;
      this.getList();
    },
    //删除按钮
    async deleteBtn(row) {
      //信息确认
      const confrim = await this.$myconfirm("确定删除该数据吗?");
      if (confrim) {
        const res = await deleteUserApi({ userId: row.userId });
        if (res && res.code == 200) {
          //信息提示
          this.$message({ type: "success", message: res.msg });
          //刷新列表
          this.getList();
        }
      }
    },
    //编辑按钮
    async editBtn(row) {
      //设置弹框属性
      this.dialog.title = "编辑用户";
      this.dialog.visible = true;
      //清空表单
      this.$resetForm("addRef", this.addModel);
      //把当前要编辑的数据复制到表单绑定的数据域
      this.$objCoppy(row, this.addModel);
      //设置为编辑
      this.addModel.type = "1";
      //获取角色
      let res = await getRoleApi({ userId: row.userId });
      if (res && res.code == 200 && res.data) {
        this.addModel.roleId = res.data.roleId;
      }
    },
    //新增按钮
    addBtn() {
      this.dialog.title = "新增用户";
      this.dialog.visible = true;
      //清空表单
      this.$resetForm("addRef", this.addModel);
      //设为新增
      this.addModel.type = "0";
    },
    //搜索按钮
    searchBtn() {
      this.getList();
    },
    //重置
    resetBtn() {
      this.listParm.phone = "";
      this.listParm.nickName = "";
      this.getList();
    },
  },
  mounted() {
    //计算表格的高度
    this.$nextTick(() => {
      this.tableHeight = window.innerHeight - 220;
    });
  },
};
</script>

<style lang="scss" scoped>
</style>