<!--内容-->
<template>
    <div>
        <div>
            <el-header style="font-size:15px;">
                用户详细信息
                <hr width="100%" style="color:rgb(198,198,198)">
            </el-header>
        </div>
        <el-form>
            <div>
                <el-row>
                    <el-col :span="12">
                        这里应当有一张照片.jpg
                    </el-col>
                    <el-col :span="12">
                         <p style="text-align:left">&emsp;用户号：{{this.emp.username}}</p>
                         <p style="text-align:left">&emsp;&emsp;姓名：{{this.emp.chineseName}}</p>
                         <p style="text-align:left">&emsp;&emsp;密码：{{this.emp.passWord}}</p>
                         <p style="text-align:left">&emsp;&emsp;部门：</p>
                         <p style="text-align:left">&emsp;&emsp;性别：</p>
                         <p style="text-align:left">&emsp;&emsp;角色：{{this.emp.roleName}}</p>
                         <p style="text-align:left">用户状态：</p>
                         <el-form-item>
                             <el-button 
                                 @click="goBack()"
                                 style="margin-right:80px;margin-top:20px;"
                                 size="mini">
                                 返回
                             </el-button>
                         </el-form-item>
                    </el-col>
                </el-row>
            </div>
        </el-form>
        <div>

        </div>
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
                passWord:'',
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
            this.emp.passWord = this.$router.currentRoute.params.passWord;
            this.emp.roleName = this.$router.currentRoute.params.roleName;
        },
        goBack(){
            this.$router.push(
              {
               path:'/person/employee/EmployeeIndex',
              });
        },
    }
}
</script>

<!--样式-->
<style scoped>

</style>