<!--内容-->
<template>
    <div>
        <div style="margin-top:10px;">
            <el-header style="font-size:20px;">
                保存部门信息
                <hr width="50%" style="color:rgb(198,198,198)">
            </el-header>
        </div>
        <!--整个页面就是一个表单-->
        <el-form :model="department" ref="addAndUpdateDepForm" :rules="rules">
            <div>
               <el-col :span="8">&emsp;</el-col>
               <el-col :span="7">
                  <el-row>
                   <el-form-item style="margin-left:40px;" prop="departName" >
                       部门名称：
                        <el-input
                          v-model="department.departName"
                          style="width: 240px;margin: 0px;padding: 0px;"
                          size="mini"
                        ></el-input>
                    </el-form-item>
                  </el-row>
                  <el-row>
                    <el-form-item style="margin-left:40px;" prop="branchId">
                        所属机构：
                        <el-select v-model="department.branchId" style="width: 240px" size="mini" @change="getbranchNames">
                        <el-option
                          v-for="item in AllbranchNames"
                          :key="item.branchId"
                          :label="item.branchName"
                          :value="item.branchId">
                        </el-option>
                       </el-select>
                    </el-form-item>
                  </el-row>
                  <el-row>
                      <el-form-item style="margin-right:70px;" prop="principalUser">
                          部门负责人：
                        <el-input
                          v-model="department.principalUser"
                          style="width: 120px;margin: 0px;padding: 0px;"
                          size="mini"
                        ></el-input>
                    </el-form-item>
                  </el-row>
                  <el-row>
                      <el-form-item style="margin-left:40px;" prop="connectTelNo" >
                          联系电话：
                        <el-input
                          v-model="department.connectTelNo"
                          style="width: 240px;margin: 0px;padding: 0px;"
                          size="mini"
                        ></el-input>
                    </el-form-item>
                  </el-row>
                  <el-row>
                      <el-form-item style="margin-left:40px;" prop="connectMobileTelNo" >
                          移动电话：
                        <el-input
                          v-model="department.connectMobileTelNo"
                          style="width: 240px;margin: 0px;padding: 0px;"
                          size="mini"
                        ></el-input>
                    </el-form-item>
                  </el-row>
                  <el-row>
                      <el-form-item style="margin-left:40px;" prop="faxes">
                          传&emsp;&emsp;真：
                        <el-input
                          v-model="department.faxes"
                          style="width: 240px;margin: 0px;padding: 0px;"
                          size="mini"
                        ></el-input>
                    </el-form-item>
                  </el-row>
                  <el-row>
                    <div style="margin-top:30px">
                    <el-button  
                    type="primary" 
                    size="mini" 
                    style="margin-left: 110px;"
                    @click="addAndUpdateDep('addAndUpdateDepForm')"
                    :disabled="isDisabled=='1'">
                    保存部门信息
                   </el-button>
                   <el-button  
                    type="primary" 
                    size="mini" 
                    style="margin-left: 30px;"
                    @click="goBack()"
                    :disabled="isDisabled=='0'">
                     返回
                   </el-button>
                    </div>
                  </el-row>
               </el-col>
            </div>
        </el-form>
    </div>
</template>

<!--逻辑-->
<script>
export default {
    data(){
        return{
            department:{
                departId:'',
                departName:'',
                branchName:'',
                principalUser:'',
                connectTelNo:'',
                connectMobileTelNo:'',
                faxes:''
            },
            departments:[],
            AllbranchNames:[],
            rules: {
              departName: [{ required: true, message: "部门名称不能为空", trigger: "blur" }],
              branchId: [{ required: true, message: "部门负责人不能为空", trigger: "blur" }],
              principalUser: [{ required: true, message: "部门负责人不能为空", trigger: "blur" }],
              connectTelNo: [{ required: true, message: "联系电话不能为空", trigger: "blur" }],
              connectMobileTelNo: [{ required: true, message: "移动电话不能为空", trigger: "blur" }],
              faxes: [{ required: true, message: "传真不能为空", trigger: "blur" }]
              }
        }
    },
    mounted:function(){
        this.loadDepartment();
        this.getbranchNames();
    },
    methods:{
        addAndUpdateDep(formName){
            this.$refs[formName].validate((valid) => {
                if(valid){
                    if(this.department.departId){
                        //改
                        this.postRequest("/home/departmessage/updateDepart",this.department).then(resp =>{
                            if(resp.data && resp.status==200){
                                this.department = resp.data.obj;
                                this.loadDepartment();
                                 this.goBack();
                                }
                        })
                    }else{
                        //增
                        this.postRequest("/home/departmessage/addDepart",this.department).then(resp =>{
                          if(resp.data && resp.status==200){
                            this.department = resp.data.obj;
                            this.loadDepartment();
                            this.$message({type: 'success', message: "添加成功！"});
                             this.goBack();
                            }
                        })
                  }
                }
            });
           
        },
      getbranchNames(){
        this.postRequest("/home/branchmessage/listBranchVo").then(resp=> {
          if (resp.data && resp.data.status == 200) {
            console.log("getAllbranch",resp);
            this.AllbranchNames = resp.data.obj;
            console.log("当前选择机构名称：",this.department.branchId);
          }
        });
      },
        loadDepartment(){
            this.department.departId=this.$router.currentRoute.params.departId;
            this.department.departName=this.$router.currentRoute.params.departName;
            this.department.branchName=this.$router.currentRoute.params.branchName;
            this.department.principalUser=this.$router.currentRoute.params.principalUser;
            this.department.connectTelNo=this.$router.currentRoute.params.connectTelNo;
            this.department.connectMobileTelNo=this.$router.currentRoute.params.connectMobileTelNo;
            this.department.faxes=this.$router.currentRoute.params.faxes;
        },
        goBack(){
            this.$router.push(
              {
               path:'/person/department/DepartmentIndex',
              });
        }
    }
}
</script>

<!--样式-->
<style scoped>

</style>
