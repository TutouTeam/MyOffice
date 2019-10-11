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
                    width="80"
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
                    width="80"
                    label="删除"
                    align="center">
                    <template slot-scope="scope">
                        <!--团队变更记录的删除按钮-->
                        <el-button type="danger" style="padding: 3px 4px 3px 4px;margin: 2px" size="mini"
                           @click="deleteEmp(scope.row)">
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
                userId:'',
                username:'',
                chineseName:'',
                roleName:''
            },
            emps:[]
        }
    },
    mounted:function(){
       this.loadEmp();
    },
    methods:{
        loadEmp(){
            var _this = this;
            var datas = {};
            this.tableLoading = true;
          
            this.postRequest("/home/usermessage/listUserVo",datas).then(resp=> {
             this.tableLoading = false;
             if (resp.data && resp.status == 200) {
                _this.emps = resp.data.obj;
            console.log("id不见了呀你妈的",resp.data.obj);
             }
           })
        },
        addEmp(){
              this.$router.push(
              {
               path:'/person/employee/EmployeeSave',
              });
        },
        updateEmp(row){
            console.log("这是一个router",this.$router);
            this.$router.push(
              {
               name: '员工信息保存界面',
               //params不会在地址栏显示你传的参数比较安全，query也可以传参但是会显示参数
               params:{
                   userId:row.userId,
                   username:row.username,
                   chineseName:row.chineseName,
                   roleName:row.roleName,
               }
              });
        },
        deleteEmp(row){
          this.$confirm('你确定要删除'+row.chineseName+'吗？', '提示', {
            confirmButtonText: '确定',
            cancelButtonText: '取消',
            type: 'warning'
            }).then(() => {
          this.doDeleteEmp(row.userId);
          }).catch(() => {
          });
        },
        doDeleteEmp(ids){
            this.tableLoading = true;
            var _this = this;
            var datas = {
              userId:ids
            };
            this.postRequest("/home/usermessage/deleteUserById",datas).then(resp=> {
               _this.tableLoading = false;
              if (resp && resp.status == 200) {
                var data = resp.data;
                this.$message({type: 'success', message: "删除成功！"});
                _this.loadEmp();
              }
        })
        },
        showEmp(row){
            console.log(this.$router);
            this.$router.push(
              {
               name: '员工信息详情界面',
               //params不会在地址栏显示你传的参数比较安全，query也可以传参但是会显示参数
               params:{
                    userId:row.userId,
                   username:row.username,
                   chineseName:row.chineseName,
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