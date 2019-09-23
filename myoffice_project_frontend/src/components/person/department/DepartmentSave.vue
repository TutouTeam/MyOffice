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
        <el-form :model="department">
            <div>
                <el-row>
                   <el-col :span="24">
                    <el-form-item style="margin-left:0px;">
                        部门名称：
                        <el-input
                          v-model="department.departName"
                          style="width: 240px;margin: 0px;padding: 0px;"
                          size="mini"
                        ></el-input>
                    </el-form-item>
                   </el-col>
                </el-row>
                <el-row>
                   <el-col :span="24">
                    <el-form-item style="margin-left:0px;">
                        所属机构：
                        <el-input
                          v-model="department.branchName"
                          style="width: 240px;margin: 0px;padding: 0px;"
                          size="mini"
                        ></el-input>
                    </el-form-item>
                   </el-col>
                </el-row>
                <el-row>
                   <el-col :span="21">
                    <el-form-item style="margin-left:50px;">
                        部门负责人：
                        <el-input
                          v-model="department.principalUser"
                          style="width: 120px;margin: 0px;padding: 0px;"
                          size="mini"
                        ></el-input>
                    </el-form-item>
                   </el-col>
                </el-row>
                <el-row>
                   <el-col :span="24">
                    <el-form-item style="margin-left:0px;">
                        联系电话：
                        <el-input
                          v-model="department.connectTelNo"
                          style="width: 240px;margin: 0px;padding: 0px;"
                          size="mini"
                        ></el-input>
                    </el-form-item>
                   </el-col>
                </el-row>
                <el-row>
                   <el-col :span="24">
                    <el-form-item style="margin-left:0px;">
                        移动电话：
                        <el-input
                          v-model="department.connectMobileTelNo"
                          style="width: 240px;margin: 0px;padding: 0px;"
                          size="mini"
                        ></el-input>
                    </el-form-item>
                   </el-col>
                </el-row>
                <el-row>
                   <el-col :span="24">
                    <el-form-item style="margin-left:0px;">
                        传&emsp;&emsp;真：
                        <el-input
                          v-model="department.faxes"
                          style="width: 240px;margin: 0px;padding: 0px;"
                          size="mini"
                        ></el-input>
                    </el-form-item>
                   </el-col>
                </el-row>
                <el-row>
                    <el-col>
                    <div style="margin-top:30px">
                    <el-button  
                    type="primary" 
                    size="mini" 
                    style="margin-left: 110px;"
                    @click="addMec('addAndUpdateBranch')"
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
            department:{
                departName:'',
                branchName:'',
                principalUser:'',
                connectTelNo:'',
                connectMobileTelNo:'',
                faxes:''
            },
            departments:[]
        }
    },
    mounted:function(){
        this.loadDepartment();
    },
    methods:{
        loadDepartment(){
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
