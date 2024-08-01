<template>
  <el-main>
    <!-- 搜索栏 -->
    <el-form :model="searchModel" :inline="true" size="small">
      <el-form-item>
        <el-input
          v-model="searchModel.courseName"
          placeholder="请输入获奖名称"
        />
      </el-form-item>
      <el-form-item>
        <el-button icon="el-icon-search" @click="searchBtn">搜索</el-button>
        <el-button icon="el-icon-close" style="color:#FF7670;" @click="resetBtn">重置</el-button>
        <el-button
          type="primary"
          icon="el-icon-plus"
          @click="addBtn"
        >新增</el-button>
      </el-form-item>
    </el-form>
    <!-- 表格 -->
    <el-table :height="tableHeight" :data="tableList" border stripe>
      <el-table-column
        align="center"
        prop="title"
        label="标题"
      />
      <el-table-column
        align="center"
        prop="subType"
        label="类型"
      />
      <el-table-column
        align="center"
        prop="year"
        label="年份"
      />
      <el-table-column
        align="center"
        prop="recordContent"
        label="内容"
      />
    </el-table>
    <!-- 分页 -->
    <el-pagination
      :current-page.sync="searchModel.currentPage"
      :page-sizes="[10, 20, 40, 80, 100]"
      :page-size="searchModel.pageSize"
      layout="total, sizes, prev, pager, next, jumper"
      :total="searchModel.total"
      background
      @size-change="sizeChange"
      @current-change="currentChange"
    />

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
        <!-- 表格 -->
        <el-table :height="tableHeight" :data="applyList" border stripe>
          <el-table-column
            align="center"
            prop="title"
            label="标题"
          />
          <el-table-column
            align="center"
            prop="subType"
            label="类型"
          />
          <el-table-column
            align="center"
            prop="year"
            label="年份"
          />
          <el-table-column
            align="center"
            prop="recordContent"
            label="内容"
          />
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
                type="primary"
                size="small"
                @click="applyBtn(scope.row)"
              >申请</el-button>
            </template>
          </el-table-column>
        </el-table>
        <!-- 分页 -->
        <el-pagination
          :current-page.sync="searchModel.currentPage"
          :page-sizes="[10, 20, 40, 80, 100]"
          :page-size="searchModel.pageSize"
          layout="total, sizes, prev, pager, next, jumper"
          :total="searchModel.total"
          background
          @size-change="sizeChange"
          @current-change="currentChange"
        />
      </div>
    </sys-dialog>
  </el-main>
</template>

<script>
import { getStuRecordList } from '@/api/student.js'
import { getUserId } from '@/utils/auth.js'
import SysDialog from '@/components/dialog/SysDialog.vue'
import { addApi } from '@/api/feedback.js'
import { listAvailableApi } from '@/api/record.js'
export default {
  components: {
    SysDialog
  },
  data() {
    return {
      tableHeight: 0,
      searchModel: {
        courseName: '',
        currentPage: 1,
        pageSize: 10,
        stuId: getUserId(),
        total: 0,
        type: '0'
      },
      applyModel: {
        mode: '',
        type: '1',
        subType: '',
        recordId: '',
        title: '',
        recordContent: '',
        year: ''
      },
      dialog: {
        title: '',
        height: 320,
        width: 1050,
        visible: false
      },
      tableList: []
    }
  },
  created() {
    this.getReward()
    // this.getAllRewards();
  },
  mounted() {
    this.$nextTick(() => {
      this.tableHeight = window.innerHeight - 220
    })
  },
  methods: {
    searchBtn() {
      this.getReward()
    },
    resetBtn() {
      this.searchModel.title = ''
      this.getReward()
    },
    currentChange(val) {
      this.searchModel.currentPage = val
      this.getReward()
    },
    sizeChange(val) {
      this.searchModel.pageSize = val
      this.getReward()
    },
    async getReward() {
      const res = await getStuRecordList(this.searchModel)
      if (res && res.code == 200) {
        console.log(res)
        this.tableList = res.data.records
        this.searchModel.total = res.data.total
      }
    },
    async getAllRewards() {
      this.searchModel.type = '0'
      // this.searchModel.subType = '奖学金'
      this.searchModel.year = '2024'
      const res = await listAvailableApi(this.searchModel)
      if (res && res.code == 200) {
        // console.log(res)
        this.applyList = res.data.records
        this.searchModel.total = res.data.total
      }
    },
    async addBtn() {
      await this.getAllRewards()
      this.dialog.title = '申请奖励'
      this.dialog.visible = true
      this.applyModel.type = '1'
    },
    onClose() {
      this.dialog.visible = false
    },
    onConfirm() {
      this.dialog.visible = false
    },
    async applyBtn(row) {
      this.$objCoppy(row, this.applyModel)
      this.applyModel.stuId = getUserId()
      this.applyModel.type = '0'
      // console.log(row)
      // console.log('applyMode')
      // console.log(this.applyModel)
      const res = await addApi(this.applyModel)
      if (res && res.code == 200) {
        // this.getList()
        console.log('success')
        this.$message.success(res.msg)
        this.dialog.visible = false
      }
    }
  }
}
</script>

  <style lang="scss" scoped></style>
