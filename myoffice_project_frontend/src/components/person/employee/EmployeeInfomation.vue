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
            <div id="total">
                <el-row>
                    <el-col :span="12">
                        <el-form-item>
                            <img :src="imageurl" class="picture">
                        </el-form-item>
                    </el-col>
                    <el-col :span="12">
                      <div id="information">
                         <p style="text-align:left">&emsp;用户号：{{this.emp.username}}</p>
                         <p style="text-align:left">&emsp;&emsp;姓名：{{this.emp.chineseName}}</p>
                         <p style="text-align:left">&emsp;&emsp;部门：{{this.emp.departName}}</p>
                         <p style="text-align:left">&emsp;&emsp;性别：{{this.emp.gender}}</p>
                         <p style="text-align:left">&emsp;&emsp;角色：{{this.emp.roleName}}</p>
                         <p style="text-align:left">用户状态：{{this.emp.userStateName}}</p>
                         <el-form-item>
                             <el-button 
                                 id="b1"
                                 @click="goBack()"
                                 style="margin-right:80px;margin-top:20px;"
                                 size="mini">
                                 返回
                             </el-button>
                         </el-form-item>
                      </div>
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
                userId:'',
                username:'',
                chineseName:'',
                passWord:'',
                departName:'',
                gender:'',
                roleName:'',
                userStateName:''
            },
            imageurl:'',
            userName:''
        }
    },
    mounted:function(){
        this.initEmps();
        this.loalEmps();
        this.getUrl();
    },
    methods:{
         initEmps(){
            this.emp.userId = this.$router.currentRoute.params.userId;
            // this.emp.username = this.$router.currentRoute.params.username;
            // this.emp.chineseName = this.$router.currentRoute.params.chineseName;
            // this.emp.passWord = this.$router.currentRoute.params.passWord;
            // this.emp.roleName = this.$router.currentRoute.params.roleName;
        },
        loalEmps(){
            var datas = {
                userId:this.emp.userId
            }
            this.postRequest("/home/usermessage/userMassage",datas).then(resp =>{
                if(resp.data&&resp.status==200){
                    this.emp = resp.data.obj;
                    this.emp.username = resp.data.obj.username;
                    this.emp.chineseName = resp.data.obj.chineseName;
                    this.emp.departName = resp.data.obj.departName;
                    this.emp.gender = resp.data.obj.gender;
                    this.emp.roleName = resp.data.obj.roleName;
                    this.emp.userStateName = resp.data.obj.userStateName;
                }
            })
        },
        getUrl(){
            var userName=''
            var datass={
                userName: this.$router.currentRoute.params.username
            }
            this.postRequest("/HeadPortrait/getHeadUrl",datass).then(resp=>{
                if(resp.data&&resp.status==200){
                    this.imageurl = resp.data.obj;
                }
            })
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
#total{
    margin-left:10%;
    width: 80%;
    height: 450px;
    background-image: url('../../../assets/timg.jpg');
    background-position:center;
    padding: 20px;
}
#information{
    margin-left:10%;
    padding: 2%;
    width: 50%;
    color: rgb(75, 107, 145);
    border-style: solid;
    border-radius: 2%;
    border-color: rgba(75, 107, 145, 0.781);
    background-color: rgba(216, 229, 237, 0.404);
}
#b1{
    margin-left:60%;
}
</style>