<template>
  <el-main>
    <!-- 统计 -->
    <el-row :gutter="20" type="flex" class="row-bg" justify="center" style="margin-bottom: 80px"
      v-if="user.userType === '0'">
      <el-col :span="6">
        <div class="show-header" style="background: #FDDD8C">
          <div class="show-num">{{ stuCourseCount }}</div>
          <div class="bottom-text">课程总数</div>
        </div>
      </el-col>
      <el-col :span="6">
        <div class="show-header" style="background: #AED2FE">
          <div class="show-num">{{ hourCount }}</div>
          <div class="bottom-text">总学时</div>
        </div>
      </el-col>
      <el-col :span="6">
        <div class="show-header" style="background: #EBB9C0">
          <div class="show-num">{{ pointCount }}</div>
          <div class="bottom-text">总学分</div>
        </div>
      </el-col>
      <el-col :span="6">
        <div class="show-header" style="background: #386EAA">
          <div class="show-num">{{ scorePoint }}</div>
          <div class="bottom-text">当年总绩点</div>
        </div>
      </el-col>
    </el-row>
    <!-- 统计 -->
    <el-row :gutter="20" type="flex" class="row-bg" justify="center" style="margin-bottom: 80px"
      v-if="user.userType === '1'">
      <el-col :span="6">
        <div class="show-header" style="background: #FDDD8C">
          <div class="show-num">{{ teacherCourseCount }}</div>
          <div class="bottom-text">总授课数</div>
        </div>
      </el-col>
      <el-col :span="6">
        <div class="show-header" style="background: #AED2FE">
          <div class="show-num">{{ classCount }}</div>
          <div class="bottom-text">总授课班级数</div>
        </div>
      </el-col>
      <el-col :span="6">
        <div class="show-header" style="background: #EBB9C0">
          <div class="show-num">{{ studentCount }}</div>
          <div class="bottom-text">总授课学生数</div>
        </div>
      </el-col>
      <el-col :span="6">
        <div class="show-header" style="background: #386EAA">
          <div class="show-num">{{ durationCount }}</div>
          <div class="bottom-text">总授课课时</div>
        </div>
      </el-col>
    </el-row>
    <!-- 图表显示：定义容器，宽度和高度，id -->
    <div style="display: flex">
      <div id="main1" style="width: 400px; height: 300px; flex-grow: 1">
        <el-card style="height: 300px;" shadow="hover">
          <el-form label-width="80px" size="small">

            <el-upload class="avatar-uploader" :action="'http://localhost:9090/file/upload'" :show-file-list="false">
              <img v-if="user.avatar" :src="user.avatar" class="avatar">
              <i v-else class="el-icon-plus avatar-uploader-icon" />
            </el-upload>
            <el-form-item label="身份" style="margin-left: 200px; margin-top: -150px">
              <el-input v-if="user.userType === '0'" placeholder="学生" disabled autocomplete="off"
                style="width: 280px"></el-input>
              <el-input v-if="user.userType === '1'" placeholder="教师" disabled autocomplete="off"
                style="width: 280px"></el-input>
              <el-input v-if="user.userType === '2'" placeholder="管理员" disabled autocomplete="off"
                style="width: 280px"></el-input>
            </el-form-item>
            <el-form-item label="用户名" style="margin-left: 200px; ">
              <el-input v-model="user.name" disabled autocomplete="off" style="width: 280px"></el-input>
            </el-form-item>
            <el-form-item label="学号" style="margin-left: 200px">
              <el-input v-model="user.userNum" disabled autocomplete="off" style="width: 280px"></el-input>
            </el-form-item>
            <el-form-item label="性别" style="margin-left: 200px">
              <el-input v-if="user.gender === '0'" placeholder="男" disabled autocomplete="off"
                style="width: 280px"></el-input>
              <el-input v-if="user.gender === '1'" placeholder="女" disabled autocomplete="off"
                style="width: 280px"></el-input>
            </el-form-item>
          </el-form>
        </el-card>
      </div>
      <div id="main2" style="width: 400px; height: 300px; flex-grow: 1"></div>
    </div>
    <el-card v-if="user.userType === '0'" class="box-card" style="margin-top: 30px">
      <div slot="header" class="clearfix">
        <span style="color: #000000; font-weight: 600">事件通知</span>
      </div>
      <div v-for="(item, index) in feedbackList" :key="index" class="text item">
        <span style="font-weight: 600; font-size: 14px">{{ item.year }} - </span>
        <span style="font-weight: 600; font-size: 14px">{{ item.subType }} - </span>
        <span style="font-weight: 600; font-size: 14px">{{ item.title }} </span>
        <span v-if="item.type == '0'" style="margin-left: 30px; font-size: 14px">申请 </span>
        <span v-if="item.type == '1'" style="margin-left: 30px; font-size: 14px">申诉 </span>
        <span v-if="item.status == '1'" style="margin-left: 30px; font-size: 14px"><el-tag type="success"
            size="small">成功</el-tag> </span>
        <span v-if="item.status == '2'" style="margin-left: 30px; font-size: 14px"><el-tag type="danger"
            size="small">失败</el-tag> </span>
        <span style="margin-left: 30px; font-size: 14px">{{ item.updateTime }}</span>
        <el-divider></el-divider>
      </div>
    </el-card>
  </el-main>
</template>

<script>
import { getInfoApi } from "@/api/user";
import { getUserId, getUserType } from "@/utils/auth.js";
import { getTopListApi } from "@/api/notice.js";
import { getStuCountApi, getStuFeedbackList, getStuStatApi } from "@/api/student.js";
import { getTeacherStatsApi } from "@/api/teacher.js"
export default {
  data() {
    return {
      searchModel: {
        currentPage: 1,
        pageSize: 10,
        stuId: getUserId(),
        userType: getUserType(),
        userId: ""
      },
      calcModel: {
        userId: getUserId(),
      },
      hourCount: 0,
      pointCount: 0,
      stuCourseCount: 0,
      scorePoint: 0,
      teacherCourseCount: 0,
      classCount: 0,
      durationCount: 0,
      studentCount: 0,
      noticeList: [],
      feedbackList: [],
      user: {
        name: "张三",
        introduction: "",
        avatar: "",
        userNum: "",
        gender: "",
        type: ""
      }
    };
  },
  mounted() {
    this.getStuStats();
    this.getTeacherStats();
    this.getUserInfo();
    this.getTopList();
    this.getStuFeedbackList();
    //   this.myecharts1();
    // this.myecharts2();
  },
  methods: {
    async getUserInfo() {
      let parm = {
        userId: getUserId(),
        userType: getUserType()
      };
      //对接自己的接口
      let res = await getInfoApi(parm);
      if (res && res.code == 200) {
        console.log(res);
        this.user = res.data;
      }
    },

    //获取反馈通知列表
    async getTopList() {
      let res = await getTopListApi();
      if (res && res.code == 200) {
        console.log("noticeList");
        console.log(res);
        this.noticeList = res.data;
      }
    },
    //学生信息统计
    async getStuStats() {
      if (getUserType() == '0') {
        this.calcModel.userId = getUserId();
        console.log("stu calcModel");
        console.log(this.calcModel);
        let res = await getStuStatApi(this.calcModel);
        if (res && res.code == 200) {
          //   console.log(res);
          this.stuCourseCount = res.data.courseCount;
          this.pointCount = res.data.pointCount;
          this.hourCount = res.data.hourCount;
          this.scorePoint = res.data.scorePoint;
        }
      }
    },
    //教师信息统计
    async getTeacherStats() {
      if (getUserType() == '1') {
        console.log("teacher calcModel");
        console.log(this.calcModel);

        this.calcModel.userId = getUserId();
        let res = await getTeacherStatsApi(this.calcModel);
        if (res && res.code == 200) {
          //   console.log(res);
          this.teacherCourseCount = res.data.courseCount;
          this.classCount = res.data.classCount;
          this.studentCount = res.data.studentCount;
          this.durationCount = res.data.durationCount;
        }
      }
    },
    async getStuFeedbackList() {
      let res = await getStuFeedbackList(this.searchModel);
      if (res && res.code == 200) {
        this.feedbackList = res.data.records;
        console.log("feedbackList");
        console.log(res);
        console.log(this.feedbackList);
      }
    },
  }
};
</script>

<style lang="scss" scoped>
.bottom-text {
  bottom: 0;
  width: 100%;
  background: rgba(0, 0, 0, 0.1);
  height: 25px;
  line-height: 25px;
  text-align: center;
  position: absolute;
  font-weight: 600;
}

.show-header {
  background: #00c0ef;
  color: #fff;
  height: 80px;
  border-radius: 5px;
  position: relative;
}

.show-num {
  font-size: 38px;
  font-weight: 600;
  padding: 5px;
}

.avatar-uploader {
  text-align: left;
  padding-bottom: 10px;
}

.avatar-uploader .el-upload {
  border: 1px dashed #d9d9d9;
  border-radius: 6px;
  cursor: pointer;
  position: relative;
  overflow: hidden;
}

.avatar-uploader .el-upload:hover {
  border-color: #409EFF;
}

.avatar-uploader-icon {
  font-size: 28px;
  color: #8c939d;
  width: 138px;
  height: 138px;
  line-height: 138px;
  text-align: center;
}

.avatar {
  width: 160px;
  height: 160px;
  display: block;
}
</style>