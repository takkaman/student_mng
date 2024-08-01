<template>
  <el-main>
    <!-- 搜索栏 -->
    <el-form :model="searchForm" label-width="80px" :inline="true" size="small">
      <el-form-item>
        <el-input
          v-model="searchForm.collegeName"
          placeholder="请输入学院名称"
        ></el-input>
      </el-form-item>
      <el-form-item>
        <el-button icon="el-icon-search" @click="searchBtn">搜索</el-button>
        <el-button style="color: #ff7670" icon="el-icon-close" @click="resetBtn"
          >重置</el-button
        >
        <el-button v-permission="['sys:collegeList:add']" type="primary" icon="el-icon-plus" @click="addBtn"
          >新增</el-button
        >
      </el-form-item>
    </el-form>
    <!-- 表格 -->
    <el-table :height="tableHeight" :data="tableList" border stripe size="mini">
      <el-table-column prop="collegeName" label="学院名称"></el-table-column>
      <el-table-column prop="orderNum" label="序号"></el-table-column>
      <el-table-column v-if="$checkPermission(['sys:collegeList:edit','sys:collegeList:delete'])" label="操作" align="center" width="220">
        <template slot-scope="scope">
          <el-button
            v-permission="['sys:collegeList:edit']"
            type="primary"
            size="small"
            @click="editBtn(scope.row)"
            icon="el-icon-edit"
            >编辑</el-button
          >
          <el-button
            v-permission="['sys:collegeList:delete']"
            type="danger"
            size="small"
            @click="deleteBtn(scope.row)"
            icon="el-icon-delete"
            >删除</el-button
          >
        </template>
      </el-table-column>
    </el-table>
    <!-- 分页 -->
    <el-pagination
      @size-change="sizeChange"
      @current-change="currentChange"
      :current-page.sync="searchForm.currentPage"
      :page-sizes="[10, 20, 40, 80, 100]"
      :page-size="searchForm.pageSize"
      layout="total, sizes, prev, pager, next, jumper"
      :total="searchForm.total"
      background
    >
    </el-pagination>

    <!-- 新增、编辑弹框 -->
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
          <el-form-item prop="collegeName" label="学院名称">
            <el-input
              v-model="addModel.collegeName"
              placeholder="请输入学院名称"
            ></el-input>
          </el-form-item>
          <el-form-item label="序号">
            <el-input
              v-model="addModel.orderNum"
              placeholder="请输入学院序号"
            ></el-input>
          </el-form-item>
        </el-form>
      </div>
    </sys-dialog>
  </el-main>
</template>

<script>
import SysDialog from "@/components/dialog/SysDialog.vue";
import { addApi, listApi, editApi, deleteApi } from "@/api/college.js";
export default {
  //组件使用之前需要注册
  components: {
    SysDialog,
  },
  data() {
    return {
      //表格高度
      tableHeight: 0,
      //表单绑定的数据对象
      addModel: {
        type: "",
        collegeId: "",
        collegeName: "",
        orderNum: "",
      },
      //新增表单验证规则
      rules: {
        collegeName: [
          {
            trigger: "blur",
            required: true,
            message: "请输入学院名称",
          },
        ],
      },
      //新增弹框属性
      addDialog: {
        title: "",
        height: 150,
        width: 650,
        visible: false,
      },
      //搜索表单的数据
      searchForm: {
        collegeName: "",
        currentPage: 1,
        pageSize: 10,
        total: 0,
      },
      //表格数据
      tableList: [],
    };
  },
  created() {
    this.getList();
  },
  mounted() {
    this.$nextTick(() => {
      this.tableHeight = window.innerHeight - 220;
    });
  },
  methods: {
    //搜索按钮
    searchBtn() {
      this.getList();
    },
    resetBtn() {
      this.searchForm.collegeName = "";
      this.searchForm.currentPage = 1;
      this.getList();
    },
    //页数改变时触发
    currentChange(val) {},
    //页容量改变时触发
    sizeChange(val) {},
    //删除按钮
    async deleteBtn(row) {
      //信息确认
      const confirm = await this.$myconfirm("您确定删除该数据吗?");
      if (confirm) {
        let res = await deleteApi({ collegeId: row.collegeId });
        if (res && res.code == 200) {
          //信息提示
          this.$message.success(res.msg);
          //刷新列表
          this.getList();
        }
      }
    },
    //编辑
    editBtn(row) {
      //清空表单
      this.$resetForm("addForm", this.addModel);
      //显示弹框
      this.addDialog.title = "编辑学院";
      this.addDialog.visible = true;
      //回显数据
      this.$objCoppy(row, this.addModel);
      //设置编辑状态
      this.addModel.type = "1";
    },
    //获取表格列表
    async getList() {
      let res = await listApi(this.searchForm);
      if (res && res.code == 200) {
        console.log(res);
        this.tableList = res.data.records;
        this.searchForm.total = res.data.total;
      }
    },
    //弹框确定
    onConfirm() {
      this.$refs.addForm.validate(async (valid) => {
        if (valid) {
          let res = null;
          if (this.addModel.type == "0") {
            res = await addApi(this.addModel);
          } else {
            res = await editApi(this.addModel);
          }
          if (res && res.code == 200) {
            //信息提示
            this.$message.success(res.msg);
            //刷新表格
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
      //设置弹框显示
      this.addDialog.title = "新增学院";
      this.addDialog.visible = true;
      this.addModel.type = "0"; //新增
    },
  },
};
</script>

<style lang="scss" scoped>
</style>