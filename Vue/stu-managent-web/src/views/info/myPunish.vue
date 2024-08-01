<template>
    <el-main>
      <!-- 搜索栏 -->
      <el-form :model="searchModel" :inline="true" size="small">
        <el-form-item>
          <el-input
            v-model="searchModel.courseName"
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
          prop="recordId"
          label="记录号"
          aria-disabled="true"
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
          prop="recordContent"
          label="内容"
        ></el-table-column>
        <el-table-column
          v-if="$checkPermission(['sys:sysFeedback:apply'])"
          label="操作"
          align="center"
          width="220"
        >
          <template slot-scope="scope">
            <el-button
              v-permission="['sys:sysFeedback:apply']"
              icon="el-icon-edit"
              type="success"
              size="small"
              @click="applyBtn(scope.row)"
              >申诉</el-button
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
  import { addApi } from "@/api/feedback.js"
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
          type: "1"
        },
        applyModel: {
          type: "1",
          stuId: getUserId(),
          recordId: "",
          studentFeedBack: "",
        },
        tableList: []
      };
    },
    created() {
      this.getPunish();
    },
    mounted() {
      this.$nextTick(() => {
        this.tableHeight = window.innerHeight - 220;
      });
    },
    methods: {
      searchBtn() {
        this.getPunish();
      },
      resetBtn() {
        this.searchModel.title = "";
        this.getPunish();
      },
      currentChange(val) {
        this.searchModel.currentPage = val;
        this.getPunish();
      },
      sizeChange(val) {
        this.searchModel.pageSize = val;
        this.getPunish();
      },
      async getPunish() {
        let res = await getStuRecordList(this.searchModel);
        if (res && res.code == 200) {
          console.log(res);
          this.tableList = res.data.records;
          this.searchModel.total = res.data.total;
        }
      },
      async applyBtn(row) {
        const confirm = await this.$myconfirm("确定申诉吗?");
        if (confirm) {
          this.$objCoppy(row, this.applyModel);
          this.applyModel.stuId = getUserId();
          this.applyModel.type = "1";
          console.log(row);
          console.log("applyMode");
          console.log(this.applyModel);
          let res = await addApi(this.applyModel);
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
  