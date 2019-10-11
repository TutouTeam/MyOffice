<template>

<div>
        <!--标题-->
        <div>
            <el-header id="header">
                <i class="fa fa-lock"></i>  修改密码界面
                <hr width="300px" color="#20a0ff">
            </el-header>
        </div>

<div>
  <el-form
    :model="change"
    :rules="rules"
    status-icon
    class="changepassword"
    label-position="left"
    label-width="0px"
  >
    <h3 class="login_title">MyOffice</h3>

    <el-form-item>用户名：{{this.$store.state.user.username}}</el-form-item>

    <el-form-item prop="password">
      <el-input type="password" v-model="change.password" auto-complete="off" placeholder="新密码"></el-input>
      <span>{{passwordCheckValidate.errorText}}</span>  
    </el-form-item>

    <el-form-item prop="repassword">
      <el-input type="password" v-model="change.repassword" auto-complete="off" placeholder="确认新密码"></el-input>
      <span>{{passwordCheckValidate.errorText}}</span>
    </el-form-item>

    <el-form-item style="width: 100%">
      <el-button
        type="primary"
        style="width: 100%;background: #505458;border: none"
        @click="submitClick"
      >提交</el-button>
    </el-form-item>
  </el-form>
</div>

</div>
</template>


<script>
export default {
  name: "changepassword",
  data() {
    return {

      change: {},
      rules: {
        password: [{ required: true, message: "新密码不能为空", trigger: "blur" }],
        repassword:[{ required: true, message: "确认密码不能为空", trigger: "blur" }],
      },

    };
  },



computed:{

passwordValidate: function() {
        var errorText;
        if(!/^[0-9A-Za-z]{6,15}$/.test(this.change.password)) {
            errorText = '密码少于6位'
        } else {
            errorText = ''
        }
        if(!this.passwordFlag) {
            errorText = ''
            this.passwordFlag = true
        }
        return {
            errorText
        }
    },
        passwordCheckValidate: function() {
        var errorText;
        if(!/^[0-9A-Za-z]{6,15}$/.test(this.change.password)) {
            errorText = '密码少于6位'
        }else if(this.change.password !== this.change.repassword ){
            errorText = '两次密码不匹配'
        }
        else {
            errorText = ''
        }
        
        if(!this.passwordFlag) {
            errorText = ''
            this.passwordFlag = true
        }
        return {
            errorText
        }
    }
    
},





    methods: {
     

    submitClick: function() {
      var _this = this;
      this.loading = true;
      this.postRequest("/system/user/edit", {
        password: this.change.password,    
      }).then(resp => {
        _this.loading = false;
         console.log(resp); 
         if(resp && resp.status == 200) 
         {
          this.$message({type: 'success', message: "修改成功！请重新登录"});
          _this.$router.push({         
            path:'/' 
            });
            }
          else{
            this.$message({
              type:'errors',
              message:"修改失败！请重新修改"});
              _this.$router.push({
                path:'header/ChangePassword'
              })
          }
      });
    
    },
  }
}
</script>


<style>
.changepassword {
  border-radius: 15px;
  background-clip: padding-box;
  margin: 50px auto;
  width: 400px;
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
