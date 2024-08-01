<template>
    <el-main>
        <el-card style="width: 600px;">
      <el-form label-width="80px" size="small">
        <div style="text-align: center; margin: 10px 0">
          <el-upload
              class="avatar-uploader"
              action="http://localhost:9090/file/upload"
              :show-file-list="false"
              :on-success="handleAvatarSuccess"
          >
            <img v-if="form.avatarUrl" :src="form.avatarUrl" class="avatar">
            <i v-else class="el-icon-plus avatar-uploader-icon"></i>
          </el-upload>
        </div>
        <el-form-item label="用户名">
          <el-input v-model="form.username" autocomplete="off" disabled></el-input>
        </el-form-item>
        <el-form-item label="昵称">
          <el-input v-model="form.nickname" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="邮箱">
          <el-input v-model="form.email" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="电话">
          <el-input v-model="form.phone" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="地址">
          <el-input v-model="form.address" autocomplete="off"></el-input>
        </el-form-item>
      </el-form>

      <div style="text-align: center">
        <el-button type="primary" @click="save">确 定</el-button>
      </div>
    </el-card>
    </el-main>

</template>

<script>
export default {
  name: 'Person',
  data() {
    return {
      form: {},
      user: localStorage.getItem("user") ? JSON.parse(localStorage.getItem("user")) : {}
    }
  },
  created() {
    this.load()
  },
  methods: {
    load() {
      const username = this.user.username
      if (!username) {
        this.$message.error("当前无法获取用户信息！")
        return
      }
      this.request.get("/user/username/" + username).then(res => {
        this.form = res.data
      })
    },
    save() {
      this.request.post("/user", this.form).then(res => {
        if (res.code === '200') {
          this.$message.success("保存成功")
          this.dialogFormVisible = false
          this.load()

          this.$emit('refreshUser')
        } else {
          this.$message.error("保存失败")
        }
      })
    },
    handleAvatarSuccess(res) {
      // res就是文件的路径
      this.form.avatarUrl = res
    }
  }
}
</script>

<style>
/* 修改背景色以及border颜色*/
.dropdown-menu {
  background-color: #445081;
  border-color: #445081;
}
/* 修改小三角的样式 这里自定义类名与第三方组件的类中间一定不要有空格,不然更改无效!!!*/
.dropdown-menu.el-popper[x-placement^="bottom"] .popper__arrow::after,
.dropdown-menu.el-popper[x-placement^="bottom"] .popper__arrow {
  border-bottom-color: #445081;
}
.dropdown-menu.el-dropdown-menu--medium
  .el-dropdown-menu__item.el-dropdown-menu__item--divided:before {
  height: 0;
}
/* 修改每一项的字体颜色,这里因为是里层的类,所以中间要加上空格!!!*/
.dropdown-menu .el-dropdown-menu__item--divided {
  border-top-color: #606266;
}
.dropdown-menu .el-dropdown-menu__item {
  color: #a8bfd5;
}
.dropdown-menu .el-dropdown-menu__item:hover {
  background-color: #3b4674;
}

</style>