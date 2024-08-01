<template>
  <el-main>
    <!-- 搜索栏 -->
    <el-form :model="searchModel" :inline="true" size="small">
      <el-form-item>
        <el-select
          @change="searchCpllageChange"
          style="width: 100%"
          v-model="searchModel.collegeId"
          placeholder="请选择所属学院"
        >
          <el-option
            v-for="item in searchCollegeList"
            :key="item.collegeId"
            :label="item.collegeName"
            :value="item.collegeId"
          >
          </el-option>
        </el-select>
      </el-form-item>
      <el-form-item>
        <el-select
          @change="searchMajorChange"
          style="width: 100%"
          v-model="searchModel.majorId"
          placeholder="请选择专业"
        >
          <el-option
            v-for="item in searchMajorList"
            :key="item.majorId"
            :label="item.majorName"
            :value="item.majorId"
          >
          </el-option>
        </el-select>
      </el-form-item>
      <el-form-item>
        <el-select
          @change="searchClassSelect"
          style="width: 100%"
          v-model="searchModel.classId"
          placeholder="请选择班级"
        >
          <el-option
            v-for="item in searchClassList"
            :key="item.classId"
            :label="item.className"
            :value="item.classId"
          >
          </el-option>
        </el-select>
      </el-form-item>
      <el-form-item>
        <el-input
          v-model="searchModel.stuName"
          placeholder="请输入学生姓名"
        ></el-input>
      </el-form-item>
    </el-form>
    <div style="margin-bottom:20px;display: flex;">
      <el-date-picker
        size="small"
        v-model="searchModel.intoTime"
        type="month"
        value-format="yyyy-MM"
        placeholder="选择入学年份"
      >
      </el-date-picker>
      <el-button
        style="margin-left:10px;"
        size="small"
        icon="el-icon-search"
        @click="searchBtn"
        >搜索</el-button
      >
      <el-button
        size="small"
        style="color: #ff7670"
        icon="el-icon-close"
        @click="resetBtn"
        >重置</el-button
      >
      <el-button
        size="small"
        v-permission="['sys:stuList:add']"
        icon="el-icon-plus"
        type="primary"
        @click="addBtn"
        >新增</el-button
      >
      <el-button
        style="margin-right:15px;"
        type="success"
        size="small"
        icon="el-icon-bottom"
        @click="exportStu()"
        >下载模板</el-button
      >
      <el-upload
        v-permission="['sys:stu:import']"
        action=""
        :auto-upload="true"
        :multiple="false"
        :show-file-list="false"
        :http-request="uploadFileFn"
        :file-list="fileList"
      >
        <el-button type="warning" icon="el-icon-plus" size="small"
          >导入学生</el-button
        >
      </el-upload>
      <el-button
        v-permission="['sys:stu:export']"
        style="margin-left:15px;"
        type="primary"
        size="small"
        icon="el-icon-bottom"
        @click="getStuInfo()"
        >导出学生</el-button
      >
    </div>
    <!-- 表格列表 -->
    <el-table :height="tableHeight" :data="tableList" border stripe>
      <el-table-column prop="stuName" label="学生姓名"></el-table-column>
      <el-table-column prop="stuNum" label="学号"></el-table-column>
      <el-table-column prop="sex" label="性别">
        <template slot-scope="scope">
          <el-tag v-if="scope.row.sex == '0'" type="danger" size="small"
            >男</el-tag
          >
          <el-tag v-if="scope.row.sex == '1'" type="blue" size="small"
            >女</el-tag
          >
        </template>
      </el-table-column>
      <el-table-column prop="phone" label="电话"></el-table-column>
      <el-table-column prop="intoTime" label="入学时间"></el-table-column>
      <el-table-column prop="collegeName" label="学院"></el-table-column>
      <el-table-column prop="majorName" label="专业"></el-table-column>
      <el-table-column prop="className" label="班级"></el-table-column>
      <el-table-column label="操作" align="center" width="320">
        <template slot-scope="scope">
          <el-button
            v-permission="['sys:stuList:edit']"
            icon="el-icon-edit"
            type="primary"
            size="small"
            @click="editBtn(scope.row)"
            >编辑</el-button
          >
          <el-button
            v-permission="['sys:stuList:reset']"
            icon="el-icon-delete"
            type="warning"
            size="small"
            @click="resetPasBtn(scope.row)"
            >重置密码</el-button
          >
          <el-button
            v-permission="['sys:stuList:delete']"
            icon="el-icon-delete"
            type="danger"
            size="small"
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
      :current-page.sync="searchModel.currentPage"
      :page-sizes="[10, 20, 40, 80, 100]"
      :page-size="searchModel.pageSize"
      layout="total, sizes, prev, pager, next, jumper"
      :total="searchModel.total"
      background
    >
    </el-pagination>

    <!-- 弹框新增 -->
    <sys-dialog
      :title="addDialog.title"
      :height="addDialog.height"
      :width="addDialog.width"
      :visible="addDialog.visible"
      @onClose="onClose"
      @onConfirm="onConfirm"
    >
      <div slot="content">
        <el-form
          :model="addModel"
          ref="addForm"
          :rules="rules"
          label-width="80px"
          :inline="false"
          size="small"
        >
          <el-row>
            <el-col :span="12" :offset="0">
              <el-form-item label="所属学院" prop="collegeId">
                <el-select
                  @change="selectChange"
                  style="width: 100%"
                  v-model="addModel.collegeId"
                  placeholder="请选择"
                >
                  <el-option
                    v-for="item in collegeList"
                    :key="item.collegeId"
                    :label="item.collegeName"
                    :value="item.collegeId"
                  >
                  </el-option>
                </el-select>
              </el-form-item>
            </el-col>
            <el-col :span="12" :offset="0">
              <el-form-item prop="majorId" label="所属专业">
                <el-select
                  @change="majorChange"
                  style="width: 100%"
                  v-model="addModel.majorId"
                  placeholder="请选择专业"
                >
                  <el-option
                    v-for="item in majorList"
                    :key="item.majorId"
                    :label="item.majorName"
                    :value="item.majorId"
                  >
                  </el-option>
                </el-select>
              </el-form-item>
            </el-col>
          </el-row>
          <el-row>
            <el-col :span="12" :offset="0">
              <el-form-item prop="classId" label="所属班级">
                <el-select
                  style="width: 100%"
                  v-model="addModel.classId"
                  placeholder="请选择班级"
                >
                  <el-option
                    v-for="item in classList"
                    :key="item.classId"
                    :label="item.className"
                    :value="item.classId"
                  >
                  </el-option>
                </el-select>
              </el-form-item>
            </el-col>
            <el-col :span="12" :offset="0">
              <el-form-item prop="roleId" label="角色">
                <el-select
                  style="width: 100%"
                  v-model="addModel.roleId"
                  placeholder="请选择角色"
                >
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
          </el-row>
          <el-row>
            <el-col :span="12" :offset="0">
              <el-form-item label="姓名" prop="stuName">
                <el-input v-model="addModel.stuName"></el-input>
              </el-form-item>
            </el-col>
            <el-col :span="12" :offset="0">
              <el-form-item label="性别" prop="sex">
                <el-radio-group v-model="addModel.sex">
                  <el-radio :label="'0'">男</el-radio>
                  <el-radio :label="'1'">女</el-radio>
                </el-radio-group>
              </el-form-item>
            </el-col>
          </el-row>
          <el-row>
            <el-col :span="12" :offset="0">
              <el-form-item label="电话" prop="phone">
                <el-input v-model="addModel.phone"></el-input>
              </el-form-item>
            </el-col>
            <el-col :span="12" :offset="0">
              <el-form-item label="入学时间" prop="intoTime">
                <el-date-picker
                  v-model="addModel.intoTime"
                  type="month"
                  value-format="yyyy-MM"
                  placeholder="选择日期"
                >
                </el-date-picker>
              </el-form-item>
            </el-col>
          </el-row>
          <el-row>
            <el-col :span="12" :offset="0">
              <el-form-item label="学号" prop="stuNum">
                <el-input v-model="addModel.stuNum"></el-input>
              </el-form-item>
            </el-col>
            <el-col v-if="addModel.type == '0'" :span="12" :offset="0">
              <el-form-item label="密码" prop="password">
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
import { getCollegeApi } from "@/api/major.js";
import { getMajorListsApi } from "@/api/classes.js";
import {
  getClassListApi,
  getRoleListApi,
  addApi,
  listApi,
  getByIdApi,
  getRoleByIdApi,
  editApi,
  deleteApi,
  resetPasswordApi,
  importStuINfoApi
} from "@/api/student.js";
import SysDialog from "@/components/dialog/SysDialog.vue";
export default {
  components: {
    SysDialog
  },
  data() {
    return {
      fileList: [],
      //专业数据
      majorList: [],
      //学院数据
      collegeList: [],
      //表单验证规则
      rules: {
        roleId: [
          {
            trigger: "blur",
            required: true,
            message: "请选择角色"
          }
        ],
        collegeId: [
          {
            trigger: "blur",
            required: true,
            message: "请选择学院"
          }
        ],
        majorId: [
          {
            trigger: "blur",
            required: true,
            message: "请选择专业"
          }
        ],
        classId: [
          {
            trigger: "blur",
            required: true,
            message: "请选择班级"
          }
        ],
        intoTime: [
          {
            trigger: "blur",
            required: true,
            message: "请选择入学年份"
          }
        ],
        sex: [
          {
            trigger: "blur",
            required: true,
            message: "请选择性别"
          }
        ],
        stuName: [
          {
            trigger: "blur",
            required: true,
            message: "请选填写姓名"
          }
        ],
        phone: [
          {
            trigger: "blur",
            required: true,
            message: "请选填写电话"
          }
        ],
        stuNum: [
          {
            trigger: "blur",
            required: true,
            message: "请选填写学号"
          }
        ],
        password: [
          {
            trigger: "blur",
            required: true,
            message: "请选填写密码"
          }
        ]
      },
      //表单绑定的对象
      addModel: {
        type: "",
        stuId: "",
        roleId: "",
        collegeId: "",
        majorId: "",
        classId: "",
        stuName: "",
        sex: "",
        phone: "",
        intoTime: "",
        stuNum: "",
        password: ""
      },
      //弹框属性
      addDialog: {
        title: "",
        height: 260,
        width: 650,
        visible: false
      },
      //列表参数
      searchModel: {
        intoTime: "",
        currentPage: 1,
        pageSize: 10,
        collegeId: "",
        collegeName: "",
        majorName: "",
        className: "",
        stuName: "",
        total: 0
      },
      classList: [],
      roleList: [],
      tableList: [],
      tableHeight: 0,
      //搜索栏学院列表
      searchCollegeList: [],
      searchMajorList: [],
      searchClassList: []
    };
  },
  created() {
    this.getRoleList();
    this.getList();
    this.getSearchCollege();
  },
  mounted() {
    this.$nextTick(() => {
      this.tableHeight = window.innerHeight - 260;
    });
  },
  methods: {
    //导入学生
    async uploadFileFn(param) {
      //判断是否选择班级
      if (!this.searchModel.classId) {
        this.$message.warning("请选择班级!");
        return false;
      }
      //入学年份
      if (!this.searchModel.intoTime) {
        this.$message.warning("请选择入学年份!");
        return false;
      }

      const file = param.file;

      // 通过split方法和fileArr方法获取到文件的后缀名
      let fileArr = file.name.split(".");
      let suffix = fileArr[fileArr.length - 1];
      //只能导入.xls和.xlsx文件
      if (!/(xls|xlsx)/i.test(suffix)) {
        this.$message.warning("文件格式不正确");
        return false;
      }
      //不能导入大小超过2Mb的文件
      if (file.size > 2 * 1024 * 1024) {
        this.$message("文件过大,请上传小于2MB的文件〜");
        return false;
      }
      const formData = new FormData();
      formData.append("file", file);
      formData.append("classId", this.searchModel.classId);
      formData.append("intoTime", this.searchModel.intoTime);
      let res = await importStuINfoApi(formData);
      if (res && res.code == 200) {
        this.$message.success(res.msg);
        this.getList();
      }
    },
    //导出学生
    getStuInfo() {
      //判断是否选择班级
      if (!this.searchModel.classId) {
        this.$message.warning("请选择班级!");
        return false;
      }
      const abtn = document.createElement("a");
      abtn.href =
        process.env.VUE_APP_BASE_API_PRO +
        "/api/student/exportStuInfo?classId=" +
        this.searchModel.classId;
      abtn.click();
    },
    //下载模板
    exportStu() {
      const abtn = document.createElement("a");
      abtn.href =
        process.env.VUE_APP_BASE_API_PRO + "/api/student/importStuTemplate";
      abtn.click();
    },
    async resetPasBtn(row) {
      const confirm = await this.$myconfirm(
        "确定重置密码吗？重置之后的密码为【666666】"
      );
      if (confirm) {
        let parm = {
          stuId: row.stuId,
          password: "666666"
        };
        let res = await resetPasswordApi(parm);
        if (res && res.code == 200) {
          this.$message.success(res.msg);
        }
      }
    },
    //解决select清空之后，不能选择的问题
    searchClassSelect() {
      this.$forceUpdate();
    },
    //专业选择事件
    searchMajorChange(val) {
      this.getSearchClassList(val);
    },
    //搜索栏学院选择事件
    searchCpllageChange(val) {
      this.searchModel.classId = "";
      this.searchModel.majorId = "";
      this.searchMajorList = [];
      this.searchClassList = [];
      this.getSearchMajorList(val);
    },
    //根据学院id获取专业列表
    async getSearchMajorList(collegeId) {
      let res = await getMajorListsApi({
        collegeId: collegeId
      });
      if (res && res.code == 200) {
        this.searchMajorList = res.data;
      }
    },
    //班级列表获取
    async getSearchClassList(majorId) {
      let res = await getClassListApi({
        majorId: majorId
      });
      if (res && res.code == 200) {
        this.searchClassList = res.data;
      }
    },
    //搜索学院列表
    async getSearchCollege() {
      let res = await getCollegeApi();
      if (res && res.code == 200) {
        this.searchCollegeList = res.data;
      }
    },
    //页数改变时触发
    currentChange(val) {
      this.searchModel.currentPage = val;
      this.getList();
    },
    //页容量改变时触发
    sizeChange(val) {
      this.searchModel.pageSize = val;
      this.getList();
    },
    //删除按钮
    async deleteBtn(row) {
      //信息确定
      const confirm = await this.$myconfirm("确定删除该数据吗");
      if (confirm) {
        let res = await deleteApi({
          stuId: row.stuId
        });
        if (res && res.code == 200) {
          this.$message.success(res.msg);
          this.getList();
        }
      }
    },
    //编辑按钮
    async editBtn(row) {
      //清空表单
      this.$resetForm("addForm", this.addModel);
      //加载学院列表
      this.getCollege();
      //根据id查询回显的数据
      let res = await getByIdApi({
        stuId: row.stuId
      });
      if (res && res.code == 200) {
        console.log(res);
        this.$objCoppy(res.data, this.addModel);
        this.getMajorList(this.addModel.collegeId);
        this.getClassList(this.addModel.majorId);
        this.getRoleId(this.addModel.stuId);
      }
      console.log(this.addModel);
      //设置弹框属性
      this.addDialog.title = "编辑学生";
      this.addDialog.visible = true;
      this.addModel.type = "1";
      this.addModel.password = "";
    },
    async getRoleId(stuId) {
      let res = await getRoleByIdApi({
        stuId: stuId
      });
      if (res && res.code == 200) {
        console.log(res);
        this.addModel.roleId = res.data.roleId;
      }
    },
    //表格列表
    async getList() {
      let res = await listApi(this.searchModel);
      if (res && res.code == 200) {
        //设置表格数据
        console.log(res);
        this.tableList = res.data.records;
        this.searchModel.total = res.data.total;
      }
    },
    //角色列表
    async getRoleList() {
      let res = await getRoleListApi();
      if (res && res.code == 200) {
        this.roleList = res.data;
      }
    },
    //专业选择事件
    majorChange(val) {
      this.addModel.classId = "";
      this.getClassList(val);
    },
    //学院选择点击事件
    selectChange(val) {
      this.addModel.majorId = "";
      this.getMajorList(val);
    },
    //学院列表
    async getCollege() {
      let res = await getCollegeApi();
      if (res && res.code == 200) {
        this.collegeList = res.data;
      }
    },
    //根据学院id获取专业列表
    async getMajorList(collegeId) {
      let res = await getMajorListsApi({
        collegeId: collegeId
      });
      if (res && res.code == 200) {
        this.majorList = res.data;
      }
    },
    //班级列表获取
    async getClassList(majorId) {
      let res = await getClassListApi({
        majorId: majorId
      });
      if (res && res.code == 200) {
        this.classList = res.data;
      }
    },
    //弹框确定
    onConfirm() {
      this.$refs.addForm.validate(async valid => {
        if (valid) {
          console.log(this.addModel);
          let res = null;
          if (this.addModel.type == "0") {
            res = await addApi(this.addModel);
          } else {
            res = await editApi(this.addModel);
          }
          if (res && res.code == 200) {
            this.$message.success(res.msg);
            this.getList();
            this.addDialog.visible = false;
          }
        }
      });
    },
    //弹框关闭
    onClose() {
      this.addDialog.visible = false;
    },
    //新增按钮
    addBtn() {
      //清空表单
      this.$resetForm("addForm", this.addModel);
      //加载学院列表
      this.getCollege();
      //设置弹框属性
      this.addDialog.title = "新增学生";
      this.addDialog.visible = true;
      this.addModel.type = "0";
    },
    //重置按钮
    resetBtn() {
      this.searchModel.collegeId = "";
      this.searchModel.classId = "";
      this.searchModel.stuName = "";
      this.searchModel.majorId = "";
      this.searchModel.currentPage = 1;
      this.getList();
    },
    //搜索按钮
    searchBtn() {
      console.log(this.searchModel);
      this.getList();
    }
  }
};
</script>

<style lang="scss" scoped></style>
