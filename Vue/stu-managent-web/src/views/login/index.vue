<template>
  <div class="logincontainer">
        <el-form
          class="loginForm"
          :model="addModel"
          ref="loginForm"
          :rules="rules"
          :inline="false"
          size="normal"
        >
          <el-form-item>
            <span class="loginTitle">学生管理系统</span>
          </el-form-item>
          <el-form-item prop="username">
            <el-input
              placeholder="请输入账户"
              v-model="addModel.username"
            ></el-input>
          </el-form-item>
          <el-form-item prop="password">
            <el-input
              type="password"
              placeholder="请输入密码"
              v-model="addModel.password"
            ></el-input>
          </el-form-item>
          <el-form-item prop="userType">
            <el-radio-group v-model="addModel.userType">
              <el-radio :label="0">学生</el-radio>
              <el-radio :label="1">教师</el-radio>
              <el-radio :label="2">管理员</el-radio>
            </el-radio-group>
          </el-form-item>
          <el-form-item>
            <el-row :gutter="20">
              <el-col :span="12" :offset="0">
                <el-button class="mybtn" type="primary" @click="onSubmit"
                  >登录</el-button
                >
              </el-col>
              <el-col :span="12" :offset="0">
                <el-button class="mybtn">取消</el-button>
              </el-col>
            </el-row>
          </el-form-item>
        </el-form>
      </div>
</template>

<script>
export default {
  data() {
    return {
      addModel: {
        username: "",
        password: "",
        userType: ""
      },
      rules: {
        username: [
          {
            trigger: "change",
            required: true,
            message: "请输入账户"
          }
        ],
        password: [
          {
            trigger: "change",
            required: true,
            message: "请输入密码"
          }
        ],
        userType: [
          {
            trigger: "change",
            required: true,
            message: "请选择用户类型"
          }
        ]
      }
    };
  },
  methods: {
    //登录提交
    onSubmit() {
      //表单验证
      this.$refs.loginForm.validate(valid => {
        if (valid) {
          //调用 store模块  ->  user模块 -> login()方法
          this.$store.dispatch("user/login", this.addModel).then(() => {
            //登录成功，返回数据，不会立即进入首页，需要做权限验证
            //权限验证通过，才会进入首页
            this.$router.push({ path: this.redirect || "/" });
            this.loading = false;
          });
        }
      });
    }
  }
};
</script>

<style lang="scss" scoped>
.logincontainer {
  height: 100%;
  background: #fff;
  background-image: url("../../assets/images/background.jpg");
  display: flex;
  align-items: center;
  justify-content: center;
  background-size: 100% 100%;
  .loginForm {
    height: 380px;
    width: 450px;
    background: #ffffffb9;
    opacity: 0.95;
    padding: 35px 20px;
    border-radius: 10px;
    .loginTitle {
      display: flex;
      justify-content: center;
      align-items: center;
      font-size: 30px;
      font-weight: 600;
      color: #409eff;
    }
    .mybtn {
      width: 100%;
    }
  }
}
</style>
