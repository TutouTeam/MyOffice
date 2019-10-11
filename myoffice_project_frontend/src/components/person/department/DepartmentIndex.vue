<!--内容-->
<template>
    <div>
        <div>
            <el-header style="font-size:30px;">
                部门管理
                <hr width="100%" style="color:rgb(198,198,198)">
            </el-header>
        </div>
        <div style="margin-top:20px">
            <el-button  
                    type="primary" 
                    size="mini" 
                    style="margin-left: 900px;"
                    @click="addDep()"
                    :disabled="isDisabled=='1'">
                    添加部门
                   </el-button>
        </div>
        <!--表格-->  
        <div style="padding-left: 40px;padding-right: 40px;padding-top: 20px;">
            <!--:data="tables"的tables对应下面的tables-->
            <el-table
                :data="departments"
                border
                stripe
                size="mini"
                style="width: 100%"
                >
                <el-table-column
                    prop="departName"
                    label="部门名称"
                    width="120"
                    align="center">
                </el-table-column>

                <el-table-column
                    prop="branchName"
                    label="机构"
                    width=""
                    align="center">
                </el-table-column>

                <el-table-column
                    prop="principalUser"
                    label="负责人"
                    width="140"
                    align="center">
                </el-table-column>

                <el-table-column
                    prop="connectTelNo"
                    label="联系电话"
                    width="120"
                    align="center">
                </el-table-column>

                <el-table-column
                    prop="connectMobileTelNo"
                    label="移动电话"
                    width="140"
                    align="center">
                </el-table-column>

                <el-table-column
                    prop="faxes"
                    label="传真"
                    width="180"
                    align="center">
                </el-table-column>

                <el-table-column
                    width="60"
                    label="修改"
                    align="center">
                    <template slot-scope="scope">
                        <!--团队变更记录的变更按钮-->
                        <el-button @click="showDepView(scope.row)" style="padding: 3px 4px 3px 4px;margin: 2px"
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
        }
    },
    mounted:function(){
        this.loadDep();
    },
    methods:{
        addDep(){
             this.$router.push(
              {
               path:'/person/department/DepartmentSave',
              });
        },
       deleteDep(row){
          this.$confirm('你确定要删除'+row.departName+'吗？', '提示', {
          confirmButtonText: '确定',
          cancelButtonText: '取消',
          type: 'warning'
        }).then(() => {
          this.dodeleteDep(row.departId);
        }).catch(() => {
        });
       },
       dodeleteDep(ids){
        this.tableLoading = true;
        var _this = this;
        var datas = {
          departId:ids
        };
        this.postRequest("/home/departmessage/deleteDepartByDepartId",datas).then(resp=> {
          _this.tableLoading = false;
          if (resp && resp.status == 200) {
            var data = resp.data;
            this.$message({type: 'success', message: "删除成功！"});
            _this.loadDep();
          }
        })
       },
        showDepView(row){
            console.log(this.$router);
            this.$router.push(
              {
               name: '部门信息保存界面',
               //params不会在地址栏显示你传的参数比较安全，query也可以传参但是会显示参数
               params:{
                   departId:row.departId,
                   departName:row.departName,
                   branchName:row.branchName,
                   principalUser:row.principalUser,
                   connectTelNo:row.connectTelNo,
                   connectMobileTelNo:row.connectMobileTelNo,
                   faxes:row.faxes
               }
              });
        },
        loadDep(){
          var _this = this;
          var datas = {
           };
        this.tableLoading = true;
          
        this.postRequest("/home/departmessage/listDepartVo",datas).then(resp=> {
          this.tableLoading = false;
          if (resp.data && resp.status == 200) {
              console.log("11111111",resp)
            _this.departments = resp.data.obj;
          }
        })
      }
    }
}
</script>
<!--样式-->
<style scoped>

</style>