<!--内容-->
<template>
    <div>
        <div>
            <el-header style="font-size:30px;">
                员工管理
                <hr width="100%" style="color:rgb(198,198,198)">
            </el-header>
        </div>
        <div style="margin-top:20px">
            <el-button  
                    type="primary" 
                    size="mini" 
                    style="margin-left: 680px;"
                    @click="addEmp()"
                    :disabled="isDisabled=='1'">
                    添加用户
                   </el-button>
        </div>
        <!--表格-->  
        <div style="padding-left: 40px;padding-right: 40px;padding-top: 20px;margin-left:180px;">
            <!--:data="tables"的tables对应下面的tables-->
            <el-table
                :data="emps"
                border
                stripe
                size="mini"
                style="width: 80%"
                >
                <el-table-column
                    prop="username"
                    label="用户ID"
                    width="140"
                    align="center">
                </el-table-column>

                <el-table-column
                    prop="chineseName"
                    label="姓名"
                    width="140"
                    align="center">
                </el-table-column>

                <el-table-column
                    prop="passWord"
                    label="密码"
                    width="140"
                    align="center">
                </el-table-column>

                <el-table-column
                    prop="roleName"
                    label="角色"
                    width=""
                    align="center">
                </el-table-column>

                <el-table-column
                    label="用户详情"
                    width="120"
                    align="center">
                    <template slot-scope="scope">
                        <!--团队变更记录的变更按钮-->
                        <el-button @click="showEmp(scope.row)" style="padding: 3px 4px 3px 4px;margin: 2px"
                           size="mini">
                           详情
                        </el-button>
                    </template>
                </el-table-column>

                <el-table-column
                    width="60"
                    label="修改"
                    align="center">
                    <template slot-scope="scope">
                        <!--团队变更记录的变更按钮-->
                        <el-button @click="updateEmp(scope.row)" style="padding: 3px 4px 3px 4px;margin: 2px"
                           size="mini">
                           <i class="el-icon-edit" ></i>
                        </el-button>
                    </template>
                </el-table-column>

                <el-table-column
                    width="60"
                    label="删除"
                    align="center">
                    <template slot-scope="scope">
                        <!--团队变更记录的删除按钮-->
                        <el-button type="danger" style="padding: 3px 4px 3px 4px;margin: 2px" size="mini"
                           @click="deleteDep(scope.row)">
                           <i class="el-icon-delete"></i>
                        </el-button>
                    </template>
                </el-table-column>
            </el-table>
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
                roleName:''
            },
            emps:[
                {
                  username:'1',
                  chineseName:'测试1',
                  passWord:'213',
                  roleName:'测试账号'
                }
            ]
        }
    },
    methods:{
        addEmp(){
              this.$router.push(
              {
               path:'/person/employee/EmployeeSave',
              });
        },
        updateEmp(row){
            console.log(this.$router);
            this.$router.push(
              {
               name: '员工信息保存界面',
               //params不会在地址栏显示你传的参数比较安全，query也可以传参但是会显示参数
               params:{
                   username:row.username,
                   chineseName:row.chineseName,
                   passWord:row.passWord,
                   roleName:row.roleName,
               }
              });
        },
        showEmp(row){
            console.log(this.$router);
            this.$router.push(
              {
               name: '员工信息详情界面',
               //params不会在地址栏显示你传的参数比较安全，query也可以传参但是会显示参数
               params:{
                   username:row.username,
                   chineseName:row.chineseName,
                   passWord:row.passWord,
                   roleName:row.roleName,
               }
              });
        }
    }
}
</script>
<!--样式-->
<style scoped>
</style>