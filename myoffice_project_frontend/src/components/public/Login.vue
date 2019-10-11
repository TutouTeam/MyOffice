<template>
  <el-form
    :model="user"
    :rules="rules"
    status-icon
    class="login"
    label-position="left"
    label-width="0px"
  >
    <h3 class="login_title">MyOffice</h3>

    <el-form-item prop="username">
      <el-input type="text" v-model="user.username" auto-complete="off" placeholder="账号"></el-input>
    </el-form-item>

    <el-form-item prop="password">
      <el-input type="password" v-model="user.password" auto-complete="off" placeholder="密码"></el-input>
    </el-form-item>

    <el-form-item style="width: 100%">
      <el-button
        type="primary"
        style="width: 100%;background: #505458;border: none"
        @click="submitClick"
      >登录</el-button>
    </el-form-item>
  </el-form>
</template>


<script>
export default {
  name: "login",
  data() {
    return {
      user: {},
      rules: {
        username: [
          { required: true, message: "用户名不能为空", trigger: "blur" }
        ],
        password: [{ required: true, message: "密码不能为空", trigger: "blur" }]
      }
    };
  },

  methods: {
    submitClick: function() {
      var _this = this;
      this.loading = true;
      this.postRequestLogin("/login", {
        username: this.user.username,
        password: this.user.password
      }).then(resp => {
        _this.loading = false;
        if (resp && resp.status == 200) {
          var data = resp.data;
          _this.$store.commit("login", data.obj);
          _this.$router.push({ path: "/home" });
          _this.$router.go(0)
        }
      });
    },




  },

};
</script>


<style>
.login {
  border-radius: 15px;
  background-clip: padding-box;
  margin: 90px auto;
  width: 350px;
  padding: 35px 35px 15px 35px;
  background: #fff;
  border: 1px solid #eaeaea;
  box-shadow: 0 0 25px #cac6c6;
}

.login_title {
  margin: 0px auto 40px auto;
  text-align: center;
  color: #505458;
}
</style>
