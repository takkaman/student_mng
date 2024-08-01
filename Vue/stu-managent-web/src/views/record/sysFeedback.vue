<template>
  <el-main>
    <!-- 搜索栏 -->
    <el-form :model="searchModel" :inline="true" size="small">
      <el-form-item>
        <el-input
          v-model="searchModel.title"
          placeholder="请输入标题关键字"
        ></el-input>
      </el-form-item>
      <el-form-item>
        <el-button icon="el-icon-search" @click="searchBtn">搜索</el-button>
        <el-button icon="el-icon-close" @click="resetBtn" style="color:#FF7670;">重置</el-button>
      </el-form-item>
    </el-form>
    <!-- 表格 -->
    <el-table :height="tableHeight" :data="tableList" border stripe>
      <el-table-column
        align="center"
        prop="recordFeedbackId"
        label="反馈号"
        v-if="false"
      ></el-table-column>
      <el-table-column
        align="center"
        prop="recordId"
        label="记录号"
        v-if="false"
      ></el-table-column>
      <el-table-column
        align="center"
        prop="stuId"
        label="学号"
        v-if="false"
      ></el-table-column>
      <el-table-column
        align="center"
        prop="title"
        label="标题"
      ></el-table-column>
      <el-table-column
        align="center"
        prop="subType"
        label="类型"
      ></el-table-column>
      <el-table-column
        align="center"
        prop="year"
        label="年份"
      ></el-table-column>
      <el-table-column
        align="center"
        prop="stuName"
        label="学生姓名"
      >
        <template slot-scope="scope">
          <el-tag v-if="scope.row.stuName" type="success" size="small">{{
            scope.row.stuName
          }}</el-tag>
        </template>
      </el-table-column>
      <el-table-column
        align="center"
        prop="recordContent"
        label="内容"
      ></el-table-column>
      <el-table-column
        label="操作"
        align="center"
        width="420"
      >
        <template slot-scope="scope">
          
          <el-tag v-if="scope.row.status != 0" type="gray" size="small">已审核</el-tag>
          <el-button v-if="scope.row.status == 0"
            v-permission="['sys:sysFeedback:approve']"
            icon="el-icon-edit"
            type="success"
            size="small"
            @click="approveBtn(scope.row)"
            >通过</el-button
          >
          <el-button v-if="scope.row.status == 0"
            v-permission="['sys:sysFeedback:reject']"
            icon="el-icon-edit"
            type="danger"
            size="small"
            @click="rejectBtn(scope.row)"
            >拒绝</el-button
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
  </el-main>
</template>

<script>
import { getStuRecordList } from "@/api/student.js";
// import { addApi, deleteApi } from "@/api/record.js";
import { listApi, approveApi, rejectApi } from "@/api/feedback.js"
import { getUserId } from "@/utils/auth.js";
export default {
  data() {
    return {
      tableHeight: 0,
      searchModel: {
        courseName: "",
        currentPage: 1,
        pageSize: 10,
        stuId: getUserId(),
        total: 0,
        type: ""
      },
      processModel: {
        type: "",
        recordFeedbackId: "",
        stuId: getUserId(),
        recordId: "",
        studentFeedBack: "",
      },
      tableList: []
    };
  },
  created() {
    this.listApi();
  },
  mounted() {
    this.$nextTick(() => {
      this.tableHeight = window.innerHeight - 220;
    });
  },
  methods: {
    searchBtn() {
      this.listApi();
    },
    resetBtn() {
      this.searchModel.title = "";
      this.listApi();
    },
    currentChange(val) {
      this.searchModel.currentPage = val;
      this.listApi();
    },
    sizeChange(val) {
      this.searchModel.pageSize = val;
      this.listApi();
    },
    async listApi() {
      let res = await listApi(this.searchModel);
      if (res && res.code == 200) {
        console.log(res);
        this.tableList = res.data.records;
        this.searchModel.total = res.data.total;
      }
    },
    async approveBtn(row) {
      const confirm = await this.$myconfirm("确定通过?");
      if (confirm) {
        this.$objCoppy(row, this.processModel);
        this.processModel.stuId = row.stuId;
        this.processModel.type = row.type;
        this.processModel.recordFeedbackId = row.recordFeedbackId;
        // console.log(row);
        console.log("processModel");
        console.log(this.processModel);
        let res = await approveApi(this.processModel);
        if (res && res.code == 200) {
          this.getList();
          this.$message.success(res.msg);
          this.dialog.visible = false;
        }
      }
    },
    async rejectBtn(row) {
      const confirm = await this.$myconfirm("确定拒绝?");
      if (confirm) {
        this.$objCoppy(row, this.processModel);
        this.processModel.stuId = row.stuId;
        this.processModel.type = row.type;
        this.processModel.recordFeedbackId = row.recordFeedbackId;
        // console.log(row);
        console.log("processModel");
        console.log(this.processModel);
        let res = await rejectApi(this.processModel);
        if (res && res.code == 200) {
          this.getList();
          this.$message.success(res.msg);
          this.dialog.visible = false;
        }
      }
    },
  }
};
</script>

<style lang="scss" scoped></style>
