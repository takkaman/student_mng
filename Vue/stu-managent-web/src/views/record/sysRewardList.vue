<template>
  <el-main>
    <!--  搜索栏 -->
    <el-form :model="searchModel" :inline="true" size="small">
      <el-form-item>
        <el-input
          v-model="searchModel.title"
          placeholder="请填写记录标题"
        ></el-input>
      </el-form-item>
      <el-form-item>
        <el-button icon="el-icon-search" @click="searchBtn">搜索</el-button>
        <el-button icon="el-icon-close" style="color:#FF7670;" @click="closeBtn"
          >重置</el-button
        >
        <el-button
          v-permission="['sys:sysReward:add']"
          type="primary"
          icon="el-icon-plus"
          @click="addBtn"
          >新增</el-button
        >
      </el-form-item>
    </el-form>
    <!-- 表格 -->
    <el-table :height="tableHeight" :data="tableList" border stripe>
      <el-table-column prop="title" label="标题"></el-table-column>
      <el-table-column prop="subType" label="类型" width="80"></el-table-column>
      <el-table-column prop="year" label="年份" width="80"></el-table-column>
      <el-table-column prop="studentNames" label="学生名单">
        <template slot-scope="scope">
          <!-- 使用 v-for 指令遍历 studentNames 数组 -->
          <el-tag v-for="(name, index) in scope.row.studentNames" :key="index" type="success" size="small" style="margin-right: 2px; margin-bottom: 2px;">
            {{ name }}
          </el-tag>
          <el-tag v-if="scope.row.studentNames.length === 0" type="danger" size="small">未分配</el-tag>
        </template>
      </el-table-column>
      <el-table-column prop="recordContent" label="内容"></el-table-column>
      <el-table-column prop="createTime" label="发布时间"></el-table-column>
      <el-table-column
        v-if="$checkPermission(['sys:sysReward:edit', 'sys:sysReward:delete'])"
        label="操作"
        align="center"
        width="420"
      >
        <template slot-scope="scope">
          <el-button
            v-permission="['sys:sysReward:edit']"
            icon="el-icon-edit"
            type="primary"
            size="small"
            @click="editBtn(scope.row)"
            >编辑</el-button
          >
          <el-button
            v-permission="['sys:sysReward:assignStudent']"
            type="success"
            icon="el-icon-edit"
            size="small"
            @click="assignBtn(scope.row)"
            >分配学生</el-button
          >
          <el-button
            v-permission="['sys:sysReward:delete']"
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

    <!-- 新增弹框 -->
    <sys-dialog
      :title="dialog.title"
      :height="dialog.height"
      :width="dialog.width"
      :visible="dialog.visible"
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
          size="normal"
        >
          <el-form-item prop="title" label="标题">
            <el-input v-model="addModel.title"></el-input>
          </el-form-item>
          <!-- <el-form-item prop="title" label="类型">
            <el-input v-model="addModel.type"></el-input>
          </el-form-item> -->
          <el-form-item prop="title" label="类型">
            <el-input v-model="addModel.subType"></el-input>
          </el-form-item>
          <el-form-item prop="title" label="年份">
            <el-input v-model="addModel.year"></el-input>
          </el-form-item>
          <!-- <el-form-item prop="title" label="学生名单">
            <el-input v-model="addModel.studentNames"></el-input>
          </el-form-item> -->
          <el-form-item prop="recordContent" label="内容">
            <el-input
              type="textarea"
              v-model="addModel.recordContent"
            ></el-input>
          </el-form-item>
        </el-form>
      </div>
    </sys-dialog>

    <!-- 分配学生 -->
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
          filter-placeholder="请输入学生拼音"
          v-model="value"
          :props="{
            key: 'stuId',
            label: 'stuName'
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
import { listAssignApi} from "@/api/student.js";
import SysDialog from "@/components/dialog/SysDialog.vue";
import { 
  addApi, 
  listApi, 
  editApi, 
  deleteApi, 
  assignSaveApi 
} from "@/api/record.js";
export default {
  components: {
    SysDialog
  },
  data() {
    return {
      value: [],
      assign: {
        recordId: ""
      },
      assignDialog: {
        title: "",
        height: 350,
        width: 650,
        visible: false
      },
      tableHeight: 0,
      rules: {
        title: [
          {
            trigger: "blur",
            required: true,
            message: "请输入奖励标题"
          }
        ],
        subType: [
          {
            trigger: "blur",
            required: true,
            message: "请输入奖励类型"
          }
        ],
        recordContent: [
          {
            trigger: "blur",
            required: true,
            message: "请输入奖励内容"
          }
        ],
        year: [
          {
            trigger: "blur",
            required: true,
            message: "请输入奖励年份"
          }
        ]
      },
      addModel: {
        mode: "",
        type: "0",
        subType: "",
        recordId: "",
        title: "",
        recordContent: "",
        year:""
      },
      dialog: {
        title: "",
        height: 320,
        width: 650,
        visible: false
      },
      searchModel: {
        type: "0",
        currentPage: 1,
        pageSize: 10,
        title: "",
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
    currentChange(val) {
      this.searchModel.currentPage = val;
      this.getList();
    },
    sizeChange(val) {
      this.searchModel.pageSize = val;
      this.getList();
    },
    async deleteBtn(row) {
      const confirm = await this.$myconfirm("确定删除该数据吗?");
      if (confirm) {
        let res = await deleteApi({
          recordId: row.recordId
        });
        if (res && res.code == 200) {
          this.getList();
          this.$message.success(res.msg);
          this.dialog.visible = false;
        }
      }
    },
    editBtn(row) {
      this.$resetForm("addForm", this.addModel);
      this.$objCoppy(row, this.addModel);
      this.dialog.title = "编辑奖励";
      this.dialog.visible = true;
      this.addModel.mode = "1";
      this.addModel.type = "0";
    },
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
          if (this.addModel.mode == "0") {
            res = await addApi(this.addModel);
          } else {
            res = await editApi(this.addModel);
          }
          if (res && res.code == 200) {
            this.getList();
            this.$message.success(res.msg);
            this.dialog.visible = false;
          }
        }
      });
    },
    onClose() {
      this.dialog.visible = false;
    },
    addBtn() {
      this.$resetForm("addForm", this.addModel);
      this.dialog.title = "新增奖励";
      this.dialog.visible = true;
      this.addModel.mode = "0";
      this.addModel.type = "0";
    },
    closeBtn() {
      this.searchModel.title = "";
      this.getList();
    },
    async assignConfirm() {
      if (this.value.length == 0) {
        this.$message.warning("请选择学生!");
        return;
      }
      this.assign.stuId = this.value[0];
      let res = await assignSaveApi(this.assign);
      // console.log(this.assign);
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
    //分配学生
    async assignBtn(row) {
      this.value = [];
      // console.log(row.recordId);
      this.assign.recordId = row.recordId;
      //查询学生列表
      let res = await listAssignApi();
      if (res && res.code == 200) {
        this.assingList = res.data;
      }
      // console.log(row);
      this.assignDialog.title = "为【" + row.title + "】分配学生";
      this.assignDialog.visible = true;
    },
    searchBtn() {
      this.getList();
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
      // console.log(item);
      return item.stuName.indexOf(query) > -1;
    }
  }
};
</script>

<style lang="scss" scoped></style>
