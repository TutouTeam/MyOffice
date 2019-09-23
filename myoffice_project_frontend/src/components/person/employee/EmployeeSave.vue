<!--内容-->
<template>
   <div>
       <div style="margin-top:10px;">
            <el-header style="font-size:20px;">
                保存用户信息
                <hr width="50%" style="color:rgb(198,198,198)">
            </el-header>
        </div>
        
        <el-form>
            <div>
                <el-row>
                   <el-col :span="24">
                    <el-form-item style="margin-left:0px;">
                        用户登录名：
                        <el-input
                          v-model="emp.username"
                          style="width: 240px;margin: 0px;padding: 0px;"
                          size="mini"
                        ></el-input>
                    </el-form-item>
                   </el-col>
                </el-row>
                <el-row>
                   <el-col :span="24">
                    <el-form-item style="margin-left:0px;">
                        密&emsp;&emsp;码：
                        <el-input
                          type="password"
                          v-model="emp.passWord1"
                          style="width: 240px;margin: 0px;padding: 0px;"
                          size="mini"
                        ></el-input>
                    </el-form-item>
                   </el-col>
                </el-row>
                <el-row>
                   <el-col :span="24">
                    <el-form-item style="margin-left:0px;">
                        确认密码：
                        <el-input
                          type="password"
                          v-model="emp.passWord2"
                          style="width: 240px;margin: 0px;padding: 0px;"
                          size="mini"
                        ></el-input>
                    </el-form-item>
                   </el-col>
                </el-row>
                <el-row>
                   <el-col :span="24">
                    <el-form-item style="margin-left:0px;">
                        真实姓名：
                        <el-input
                          v-model="emp.chineseName"
                          style="width: 240px;margin: 0px;padding: 0px;"
                          size="mini"
                        ></el-input>
                    </el-form-item>
                   </el-col>
                </el-row>
                <el-row>
                   <el-col :span="24">
                    <el-form-item style="margin-left:0px;">
                        所在部门：
                        <el-input
                          v-model="emp.departName"
                          style="width: 240px;margin: 0px;padding: 0px;"
                          size="mini"
                        ></el-input>
                    </el-form-item>
                   </el-col>
                </el-row>
                <el-row>
                   <el-col :span="21">
                    <el-form-item style="margin-left:35px;">
                        性&emsp;&emsp;别：
                        <el-radio v-model="emp.gender" label="男">男</el-radio>
                        <el-radio v-model="emp.gender" label="女">女</el-radio>
                    </el-form-item>
                   </el-col>
                </el-row>
                <el-row>
                   <el-col :span="24">
                    <el-form-item style="margin-left:0px;">
                        角&emsp;&emsp;色：
                        <el-input
                          v-model="emp.roleName"
                          style="width: 240px;margin: 0px;padding: 0px;"
                          size="mini"
                        ></el-input>
                    </el-form-item>
                   </el-col>
                </el-row>
                <el-row>
                   <el-col :span="24">
                    <el-form-item style="margin-left:0px;">
                        当前状态：
                        <el-input
                          v-model="emp.userState"
                          style="width: 240px;margin: 0px;padding: 0px;"
                          size="mini"
                        ></el-input>
                    </el-form-item>
                   </el-col>
                </el-row>
                <el-row>
                    <el-col>
                    <div>
                    <el-button  
                    type="primary" 
                    size="mini" 
                    style="margin-left: 20px;"
                    @click="save('addAndUpdateEmp')">
                    保存
                   </el-button>
                    <el-button  
                    type="primary" 
                    size="mini" 
                    style="margin-left: 30px;"
                    @click="clear()">
                    全部重写
                   </el-button>
                   <el-button  
                    type="primary" 
                    size="mini" 
                    style="margin-left: 30px;"
                    @click="goBack()">
                     返回
                   </el-button>
                    </div>
                    </el-col>
                </el-row>
            </div>
        </el-form>
   </div>
</template>

<!--逻辑-->
<script>
export default {
    data(){
        return{    
             emp:{
                username:'',
                chineseName:'',
                passWord1:'',
                passWord2:'',
                departName:'',
                gender:'',
                roleName:'',
                userState:''
            },
        }
    },
    mounted:function(){
        this.loadEmps();
    },
    methods:{
        loadEmps(){
            this.emp.username = this.$router.currentRoute.params.username;
            this.emp.chineseName = this.$router.currentRoute.params.chineseName;
            this.emp.passWord1 = this.$router.currentRoute.params.passWord;
            this.emp.roleName = this.$router.currentRoute.params.roleName;
        },
        goBack(){
            this.$router.push(
              {
               path:'/person/employee/EmployeeIndex',
              });
        },
        clear(){
            this.emp.username='';
            this.emp.chineseName='';
            this.emp.passWord1='';
            this.emp.passWord2='';
            this.emp.departName='';
            this.emp.gender='';
            this.emp.roleName='';
            this.emp.userState='';
        }
    }
}
</script>

<!--样式-->
<style scoped>

</style>