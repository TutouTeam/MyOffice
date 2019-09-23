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
                    @click="addMec()"
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
                    width="180"
                    align="center">
                </el-table-column>

                <el-table-column
                    prop="faxes"
                    label="传真"
                    width="120"
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
                departName:'',
                branchName:'',
                principalUser:'',
                connectTelNo:'',
                connectMobileTelNo:'',
                faxes:''
            },
            departments:[
                {
                departName:'测试',
                branchName:'测试用数据',
                principalUser:'我也不晓得写谁',
                connectTelNo:'123',
                connectMobileTelNo:'123456',
                faxes:'321'
                }
            ],
        }
    },
    methods:{
        addMec(){
             this.$router.push(
              {
               path:'/person/department/DepartmentSave',
              });
        },
        showDepView(row){
            console.log(this.$router);
            this.$router.push(
              {
               name: '部门信息保存界面',
               //params不会在地址栏显示你传的参数比较安全，query也可以传参但是会显示参数
               params:{
                   departName:row.departName,
                   branchName:row.branchName,
                   principalUser:row.principalUser,
                   connectTelNo:row.connectTelNo,
                   connectMobileTelNo:row.connectMobileTelNo,
                   faxes:row.faxes
               }
              });
        }
    }
}
</script>
<!--样式-->
<style scoped>

</style>