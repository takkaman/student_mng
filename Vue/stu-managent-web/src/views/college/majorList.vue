<template>
  <el-main>
    <!-- 搜索栏 -->
    <el-form :model="searchForm" :inline="true" size="small">
      <el-form-item>
        <el-input
          v-model="searchForm.collegeName"
          placeholder="请输入学院名称"
        ></el-input>
      </el-form-item>
      <el-form-item>
        <el-input
          v-model="searchForm.majorName"
          placeholder="请输入专业名称"
        ></el-input>
      </el-form-item>
      <el-form-item>
        <el-button icon="el-icon-search" @click="searchBtn">搜索</el-button>
        <el-button icon="el-icon-close" style="color: #ff7670" @click="resetBtn"
          >重置</el-button
        >
        <el-button v-permission="['sys:majorList:add']" icon="el-icon-plus" type="primary" @click="addBtn"
          >新增</el-button
        >
      </el-form-item>
    </el-form>
    <!-- 表格 -->
    <el-table :height="tableHeight" :data="tableList" border stripe>
      <el-table-column prop="majorName" label="专业名称"></el-table-column>
      <el-table-column prop="collegeName" label="所属学院"></el-table-column>
      <el-table-column prop="orderNum" label="序号"></el-table-column>
      <el-table-column v-if="$checkPermission(['sys:majorList:edit','sys:majorList:delete'])" label="操作" align="center" width="220">
        <template slot-scope="scope">
          <el-button
            v-permission="['sys:majorList:edit']"
            icon="el-icon-edit"
            type="primary"
            size="small"
            @click="editBtn(scope.row)"
            >编辑</el-button
          >
          <el-button
            v-permission="['sys:majorList:delete']"
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
      :current-page.sync="searchForm.currentPage"
      :page-sizes="[10, 20, 40, 80, 100]"
      :page-size="searchForm.pageSize"
      layout="total, sizes, prev, pager, next, jumper"
      :total="searchForm.total"
      background
    >
    </el-pagination>

    <!-- 新增弹框 -->
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
          <el-form-item prop="collegeId" label="所属学院">
            <el-select
              style="width: 100%"
              v-model="addModel.collegeId"
              placeholder="请选择"
            >
              <el-option
                v-for="item in collageList"
                :key="item.collegeId"
                :label="item.collegeName"
                :value="item.collegeId"
              >
              </el-option>
            </el-select>
          </el-form-item>
          <el-form-item label="专业名称" prop="majorName">
            <el-input v-model="addModel.majorName"></el-input>
          </el-form-item>
          <el-form-item label="序号">
            <el-input v-model="addModel.orderNum"></el-input>
          </el-form-item>
        </el-form>
      </div>
    </sys-dialog>
  </el-main>
</template>

<script>
import SysDialog from "@/components/dialog/SysDialog.vue";
import {
  getCollegeApi,
  addApi,
  getListApi,
  editApi,
  deleteApi,
} from "@/api/major.js";
export default {
  components: {
    SysDialog,
  },
  data() {
    return {
      tableHeight: 0,
      //表单验证规则
      rules: {
        collegeId: [
          {
            trigger: "blur",
            required: true,
            message: "请选择学院",
          },
        ],
        majorName: [
          {
            trigger: "blur",
            required: true,
            message: "请填写专业名称",
          },
        ],
      },
      //新增表单绑定数据对象
      addModel: {
        type: "",
        majorId: "",
        collegeId: "",
        majorName: "",
        orderNum: "",
      },
      //弹框属性
      addDialog: {
        title: "",
        height: 180,
        width: 650,
        visible: false,
      },
      //搜索绑定对象
      searchForm: {
        currentPage: 1,
        pageSize: 10,
        collegeName: "",
        majorName: "",
        total: 0,
      },
      collageList: [],
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
    currentChange(page) {
      this.searchForm.currentPage = page;
      this.getList();
    },
    sizeChange(size) {
      this.searchForm.pageSize = size;
      this.getList();
    },
    //删除
    async deleteBtn(row) {
      //信息提示
      const confirm = await this.$myconfirm("确实删除该数据吗?");
      if (confirm) {
        let res = await deleteApi({
          majorId: row.majorId,
        });
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
      //把编辑的数据复制到表单绑定的对象
      this.$objCoppy(row, this.addModel);
      //设置弹框属性
      this.addDialog.title = "编辑专业";
      this.addDialog.visible = true;
      this.addModel.type = "1";
      //获取学院列表数据
      this.getCollege();
    },
    //获取列表数据
    async getList() {
      let res = await getListApi(this.searchForm);
      if (res && res.code == 200) {
        //设置表格数据
        this.tableList = res.data.records;
        //设置分页的总条数
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
            //刷新列表
            this.getList();
            this.addDialog.visible = false;
          }
        }
      });
    },
    //弹框取消
    onClose() {
      this.addDialog.visible = false;
    },
    //获取学院列表
    async getCollege() {
      let res = await getCollegeApi();
      if (res && res.code == 200) {
        //设置学院数据
        this.collageList = res.data;
      }
    },
    //新增按钮
    addBtn() {
      //清空表单
      this.$resetForm("addForm", this.addModel);
      //设置弹框属性
      this.addDialog.title = "新增专业";
      this.addDialog.visible = true;
      this.addModel.type = "0";
      //获取学院列表数据
      this.getCollege();
    },
    //重置按钮
    resetBtn() {
      this.searchForm.currentPage = 1;
      this.searchForm.collegeName = "";
      this.searchForm.majorName = "";
      this.getList();
    },
    //搜索按钮
    searchBtn() {
      this.getList();
    },
  },
};
</script>

<style lang="scss" scoped>
</style>