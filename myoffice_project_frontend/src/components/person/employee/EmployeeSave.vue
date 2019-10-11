<!--内容-->
<template>
   <div>
       <div style="margin-top:10px;">
            <el-header style="font-size:20px;">
                保存用户信息
                <hr width="50%" style="color:rgb(198,198,198)">
            </el-header>
        </div>
        
        <el-form :model="emp" ref="addAndUpdateEmpForm">
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
                          v-model="emp.passwordr"
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
                          v-model="emp.password"
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
                        <el-select v-model="emp.departId" style="width: 240px" size="mini" @change="getdepartNames">
                        <el-option
                          v-for="item in allDepartNames"
                          :key="item.departId"
                          :label="item.departName"
                          :value="item.departId">
                        </el-option>
                       </el-select>
                    </el-form-item>
                   </el-col>
                </el-row>
                <el-row>
                   <el-col :span="21">
                    <el-form-item style="margin-left:35px;">
                        性&emsp;&emsp;别：
                        <el-radio v-model="emp.gender" label="Male">男</el-radio>
                        <el-radio v-model="emp.gender" label="Female">女</el-radio>
                    </el-form-item>
                   </el-col>
                </el-row>
                <el-row>
                  <el-col :span="19">
                    <el-form-item style="margin-left:19px;">
                        <el-upload
                             ref="upload"
                             action="/HeadPortrait/headUpload"
                             name="file"
                             list-type="picture-card"
                             :limit="1"
                             :disabled="ifCanUpload"
                             :file-list="fileList"
                             :on-exceed="onExceed"
                             :before-upload="beforeUpload"
                             :on-preview="handlePreview"
                             :on-success="handleSuccess"
                             :on-remove="handleRemove">
                              上传头像
                            <i class="el-icon-plus"></i>
                        </el-upload>
                    </el-form-item>
                  </el-col>
                </el-row>
                <el-row>
                   <el-col :span="24">
                    <el-form-item style="margin-left:0px;">
                        角&emsp;&emsp;色：
                        <el-select v-model="emp.roleId" style="width: 240px" size="mini" @change="getRole">
                        <el-option
                          v-for="item in allRoles"
                          :key="item.roleId"
                          :label="item.roleName"
                          :value="item.roleId">
                        </el-option>
                       </el-select>
                    </el-form-item>
                   </el-col>
                </el-row>
                <el-row>
                   <el-col :span="24">
                    <el-form-item style="margin-left:0px;">
                        当前状态：
                        <el-select v-model="emp.userStateId" style="width: 240px" size="mini" @change="getState">
                        <el-option
                          v-for="item in allStates"
                          :key="item.userStateId"
                          :label="item.userStateName"
                          :value="item.userStateId">
                        </el-option>
                       </el-select>
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
                    @click="addAndUpdateEmp('addAndUpdateEmpForm')">
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
                userId:'',
                username:'',
                chineseName:'',
                passwordr:'',
                password:'',
                departName:'',
                gender:'',
                roleName:'',
                userState:'',
                departId:'',
                departName:'',
                roleId:'',
                roleName:'',
                userStateId:'',
                userStateName:''
            },
            ifCanUpload:'true',
            allDepartNames:[],
            allRoles:[],
            allStates:[]
        }
    },
    mounted:function(){
        this.loadEmps();
        this.getdepartNames();
        this.getRole();
        this.getState();
        this.canUpload();
    },
    methods:{
        addAndUpdateEmp(formName){
            this.$refs[formName].validate((valid) => {
                if(valid){
                    if(this.emp.userId){
                        //改
                        this.postRequest("/home/usermessage/updateUser",this.emp).then(resp =>{
                            if(resp.data && resp.status==200){
                                this.emp = resp.data.obj;
                                 this.goBack();
                                }
                        })
                    }else{
                        //增
                        this.postRequest("/home/usermessage/addUser",this.emp).then(resp =>{
                            console.log("随便输出点什么",this.emp.userStateId);
                          if(resp.data && resp.status==200){
                              console.log("随便证明点什么");
                            this.emp = resp.data.obj;
                            // this.$message({type: 'success', message: "添加成功！"});
                            // this.loadEmps();
                             this.goBack();
                            }
                        })
                         console.log("随便打印点什么");
                  }
                 
                }
            });
        },
        loadEmps(){
            
            this.emp.userId = this.$router.currentRoute.params.userId;
            this.emp.username = this.$router.currentRoute.params.username;
            this.emp.chineseName = this.$router.currentRoute.params.chineseName;
            // this.emp.passwordr = this.$router.currentRoute.params.password;
            this.emp.roleName = this.$router.currentRoute.params.roleName;
            
        },
        canUpload(){
              var storename = this.$store.state.user.username;
              var empname = this.emp.username;
              console.log(storename,"---------------",empname);
            if(storename==empname){
                this.ifCanUpload=false;
                 console.log(this.ifCanUpload);
            }
        },
        getdepartNames(){
            this.postRequest("/home/departmessage/listDepartVo").then(resp =>{
                if(resp.data&&resp.status==200){
                    this.allDepartNames = resp.data.obj;
                    console.log("部门的名字",resp);
                }
            })
        },
        getRole(){
            this.getRequest("/home/usermessage/listRole").then(resp=>{
                if(resp.data&&resp.status==200){
                    this.allRoles = resp.data.obj;
                }
            })
        },
        getState(){
            this.getRequest("/home/usermessage/userState").then(resp=>{
                if(resp.data&&resp.status==200){
                    this.allStates = resp.data.obj;
                }
            })
        },
        goBack(){
            this.$router.push(
              {
               path:'/person/employee/EmployeeIndex',
              });
            this.$router.go(0);
        },
        handleSuccess(res, file) {
            this.$message({
                type: 'info',
                message: '图片上传成功',
                duration: 6000
            });
            if (file.response.success) {
                this.editor.picture = file.response.message; //将返回的文件储存路径赋值picture字段
            }
        },
        //删除文件之前的钩子函数
        handleRemove(file, fileList) {
            this.$message({
                type: 'info',
                message: '已删除原有图片',
                duration: 6000
            });
        },
        //点击列表中已上传的文件事的钩子函数
        handlePreview(file) {
        },
        //上传的文件个数超出设定时触发的函数
        onExceed(files, fileList) {
            this.$message({
                type: 'info',
                message: '最多只能上传一个图片',
                duration: 6000
            });
        },
        //文件上传前的前的钩子函数
        //参数是上传的文件，若返回false，或返回Primary且被reject，则停止上传
        beforeUpload(file) {
            const isJPG = file.type === 'image/jpeg';
            const isPNG = file.type === 'image/png';
            const isBMP = file.type === 'image/bmp';
            const isLt2M = file.size / 1024 / 1024 < 2;

            if (!isJPG && !isPNG && !isBMP) {
                this.$message.error('上传图片必须是JPG/PNG/BMP 格式!');
            }
            if (!isLt2M) {
                this.$message.error('上传图片大小不能超过 2MB!');
            }
            return (isJPG || isBMP || isPNG) && isLt2M;
        },     
        clear(){
            this.emp.username='';
            this.emp.chineseName='';
            this.emp.passwordr='';
            this.emp.password='';
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