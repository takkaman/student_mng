<template>
  <el-main>
    <!-- 搜索 -->
    <el-form :model="searchModel" :inline="true" size="small">
      <el-form-item>
        <el-input
          v-model="searchModel.courseName"
          placeholder="请输入课程名称"
        ></el-input>
      </el-form-item>
      <el-form-item>
        <el-button icon="el-icon-search" @click="searchBtn">搜索</el-button>
        <el-button style="color:#FF7670;" icon="el-icon-close" @click="resetBtn"
          >重置</el-button
        >
        <el-button v-permission="['sys:courseList:add']" icon="el-icon-plus" type="primary" @click="addBtn"
          >新增</el-button
        >
      </el-form-item>
    </el-form>
    <!-- 表格 -->
    <el-table :height="tableHeight" :data="tableList" border stripe>
      <el-table-column prop="courseName" label="课程名称"></el-table-column>
      <el-table-column prop="teacherName" label="授课教师">
        <template slot-scope="scope">
          <el-tag v-if="scope.row.teacherId" type="success" size="small">{{
            scope.row.teacherName
          }}</el-tag>
          <el-tag v-else type="danger" size="small">未分配</el-tag>
        </template>
      </el-table-column>
      <el-table-column prop="courseDesc" label="课程描述"></el-table-column>
      <el-table-column prop="duration" label="学时"></el-table-column>
      <el-table-column prop="credit" label="学分"></el-table-column>
      <el-table-column label="操作" align="center" width="420">
        <template slot-scope="scope">
          <el-button
            v-permission="['sys:courseList:edit']"
            type="primary"
            icon="el-icon-edit"
            size="small"
            @click="editBtn(scope.row)"
            >编辑</el-button
          >
          <el-button
            v-permission="['sys:courseList:assignTeacher']"
            type="success"
            icon="el-icon-edit"
            size="small"
            @click="assignBtn(scope.row)"
            >分配教师</el-button
          >
          <el-button
            v-permission="['sys:courseList:removeTeacher']"
            v-if="scope.row.teacherId"
            type="warning"
            icon="el-icon-edit"
            size="small"
            @click="removeBtn(scope.row)"
            >解除教师</el-button
          >
          <el-button
            v-permission="['sys:courseList:delete']"
            type="danger"
            icon="el-icon-delete"
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

    <!-- 弹框 -->
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
          <el-form-item prop="courseName" label="课程名称">
            <el-input v-model="addModel.courseName"></el-input>
          </el-form-item>
          <el-form-item label="课程描述">
            <el-input v-model="addModel.courseDesc"></el-input>
          </el-form-item>
          <el-form-item label="学时">
            <el-input v-model="addModel.duration"></el-input>
          </el-form-item>
          <el-form-item label="学分">
            <el-input v-model="addModel.credit"></el-input>
          </el-form-item>
        </el-form>
      </div>
    </sys-dialog>
    <!-- 分配教师 -->
    <sys-dialog
      :title="assignDialog.title"
      :height="assignDialog.height"
      :width="assignDialog.width"
      :visible="assignDialog.visible"
      @onClose="assingClose"
      @onConfirm="assignConfirm"
    >
      <div slot="content">
        <el-transfer
          filterable
          :filter-method="filterMethod"
          filter-placeholder="请输入教师名字"
          v-model="value"
          :props="{
            key: 'teacherId',
            label: 'teacherName'
          }"
          :data="assingList"
          @change="btnChange"
          @left-check-change="leftChange"
        ></el-transfer>
      </div>
    </sys-dialog>
  </el-main>
</template>

<script>
import { listAssignApi } from "@/api/teacher.js";
import {
  addApi,
  listApi,
  editApi,
  deleteApi,
  assignSaveApi,
  removeTeacherApi
} from "@/api/course.js";
import SysDialog from "@/components/dialog/SysDialog.vue";
export default {
  components: {
    SysDialog
  },
  data() {
    return {
      value: [],
      assign: {
        teacherId: "",
        courseId: ""
      },
      assignDialog: {
        title: "",
        height: 350,
        width: 650,
        visible: false
      },
      tableHeight: 0,
      rules: {
        courseName: [
          {
            trigger: "blur",
            required: true,
            message: "请填写课程名称"
          }
        ]
      },
      addModel: {
        type: "",
        courseId: "",
        courseName: "",
        courseDesc: "",
        duration: "",
        credit: ""
      },
      addDialog: {
        title: "",
        height: 200,
        width: 650,
        visible: false
      },
      searchModel: {
        currentPage: 1,
        pageSize: 10,
        courseName: "",
        total: 0
      },
      tableList: [],
      assingList: []
    };
  },
  created() {
    this.getList();
  },
  mounted() {
    this.$nextTick(() => {
      this.tableHeight = window.innerHeight - 230;
    });
  },
  methods: {
    async removeBtn(row) {
      const confrim = await this.$myconfirm("确定解除教师吗?");
      if (confrim) {
        let res = await removeTeacherApi({
          teacherId: row.teacherId,
          courseId: row.courseId
        });
        if (res && res.code == 200) {
          this.$message.success(res.msg);
          this.getList();
        }
      }
    },
    btnChange(select, index) {
      let item = this.value;
      if (item.length > 0) {
        for (let i = 0; i < item.length; i++) {
          for (let j = 0; j < select.length; j++) {
            if (item[i] != select[j]) {
              item.splice(i, 1);
            }
          }
        }
      }
    },
    leftChange(item, index) {
      if (item.length > 0) {
        for (let i = 0; i < item.length; i++) {
          for (let j = 0; j < index.length; j++) {
            if (item[i] != index[j]) {
              item.splice(i, 1);
            }
          }
        }
      }
    },
    filterMethod(query, item) {
      return item.teacherName.indexOf(query) > -1;
    },
    async assignConfirm() {
      if (this.value.length == 0) {
        this.$message.warning("请选择教师!");
        return;
      }
      this.assign.teacherId = this.value[0];
      let res = await assignSaveApi(this.assign);
      console.log(this.assign);
      if (res && res.code == 200) {
        this.$message.success(res.msg);
        this.getList();
        this.assignDialog.visible = false;
      }
      // this.assignDialog.visible = false;
    },
    assingClose() {
      this.assignDialog.visible = false;
    },
    //分配教师
    async assignBtn(row) {
      this.value = [];
      this.assign.courseId = row.courseId;
      //查询教师列表
      let res = await listAssignApi();
      if (res && res.code == 200) {
        this.assingList = res.data;
      }
      console.log(row);
      this.assignDialog.title = "为【" + row.courseName + "】分配教师";
      this.assignDialog.visible = true;
    },
    async deleteBtn(row) {
      const confirm = await this.$myconfirm("确定删除该数据吗?");
      if (confirm) {
        let res = await deleteApi({
          courseId: row.courseId
        });
        if (res && res.code == 200) {
          this.$message.success(res.msg);
          this.getList();
        }
      }
    },
    editBtn(row) {
      this.$resetForm("addForm", this.addModel);
      this.$objCoppy(row, this.addModel);
      this.addDialog.title = "编辑课程";
      this.addDialog.visible = true;
      this.addModel.type = "1";
    },
    currentChange(val) {
      this.searchModel.currentPage = val;
      this.getList();
    },
    sizeChange(val) {
      this.searchModel.pageSize = val;
      this.getList();
    },
    //获取列表
    async getList() {
      let res = await listApi(this.searchModel);
      if (res && res.code == 200) {
        this.tableList = res.data.records;
        this.searchModel.total = res.data.total;
      }
    },
    onConfirm() {
      this.$refs.addForm.validate(async valid => {
        if (valid) {
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
    onClose() {
      this.addDialog.visible = false;
    },
    addBtn() {
      this.$resetForm("addForm", this.addModel);
      this.addDialog.title = "新增课程";
      this.addDialog.visible = true;
      this.addModel.type = "0";
    },
    resetBtn() {
      this.searchModel.courseName = "";
      this.getList();
    },
    searchBtn() {
      this.getList();
    }
  }
};
</script>

<style lang="scss" scoped></style>
