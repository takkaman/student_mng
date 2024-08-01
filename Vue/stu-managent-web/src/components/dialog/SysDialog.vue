<template>
  <!-- el-开头的标签，当做普通的div标签看待 -->
  <el-dialog
    :title="title"
    :visible.sync="visible"
    :width="width + 'px'"
    :before-close="onClose"
    :close-on-click-modal='false'
    append-to-body
  >
    <dir class="containner" :style="{ height: height + 'px' }">
      <slot name="content"></slot>
    </dir>
    <span slot="footer" class="dialog-footer">
      <el-button type="danger" @click="onClose">取 消</el-button>
      <el-button type="primary" @click="onConfirm">确 定</el-button>
    </span>
  </el-dialog>
</template>

<script>
export default {
  props: {
    title: {
      //弹框的标题
      type: String,
      default: "标题",
    },
    visible: {
      //控制弹框展示和影藏
      type: Boolean,
      default: false,
    },
    width: {
      //控制弹框宽度
      type: Number,
      default: 630,
    },
    height: {
      //控制弹框的高度
      type: Number,
      default: 250,
    },
  },
  methods: {
    //关闭
    onClose() {
      this.$emit("onClose");
    },
    //确定
    onConfirm() {
      this.$emit("onConfirm");
    },
  },
};
</script>


<style lang="scss" scoped>
.containner {
  padding: 0px;
  overflow-x: initial;
  overflow-y: auto;
}
// ::v-deep 深度查找
.el-dialog__wrapper {
  ::v-deep .el-dialog {
    border-top-left-radius: 7px !important;
    border-top-right-radius: 7px !important;
    .el-dialog__header {
      border-top-left-radius: 7px !important;
      border-top-right-radius: 7px !important;
      background-color: #1890ff;
      .el-dialog__title {
        color: #fff;
        font-size: 15px;
        font-weight: 700;
      }
      .el-dialog__close {
        color: #fff;
      }
    }
    .el-dialog__body {
      padding: 10px 10px !important;
    }
    .el-dialog__footer {
      border-top: 1px solid #e8eaec !important;
      padding: 10px !important;
    }
  }
}
</style>