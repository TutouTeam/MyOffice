<!--内容-->
<template>
    <div>
        <div>
            <el-header style="font-size:20px;">
                登&nbsp;陆&nbsp;日&nbsp;志
                <hr width="100%" style="color:rgb(198,198,198)">
            </el-header>
        </div>
       <el-form>
        <div class="content">
            <div class="second">
                <el-row style="margin-top: 10px">
                <el-col :span="10">
                   请选择查询日期范围:
                   <el-date-picker
                      size="mini"
                      v-model="dateScope"
                      type="daterange"
                      align="right"
                      unlink-panels
                      range-separator="至"
                      start-placeholder="开始日期"
                      end-placeholder="结束日期"
                      value-format="yyyy-MM-dd"
                      :picker-options="pickerOptions">
                    </el-date-picker>
          </el-col>
          <el-col :span="12" :offset="0" style="margin-top:1px;">
            <el-form-item style="margin-left:35px;">
                <el-radio v-model="datevalue" label="1">本日</el-radio>
                <el-radio v-model="datevalue" label="2">本周</el-radio>
                <el-radio v-model="datevalue" label="3">本月</el-radio>
                <el-button icon="el-icon-search" type="primary" size="mini" @click="searchEmp">搜索</el-button>
            </el-form-item>
          </el-col>
        </el-row>
            </div>
        </div>
       </el-form>
        <div class="main" v-if="show">
          <el-table
            :data="loginRecords"
            v-loading="tableLoading"
            border
            stripe
            @selection-change="handleSelectionChange"
            size="mini"
            style="width: 100%">
            <el-table-column
              type="selection"
              align="left"
              width="30">
            </el-table-column>
            <el-table-column
              prop="loginId"
              label="序号"
              align="center"
              width="60">
            </el-table-column>
            <el-table-column
              prop="chineseName"
              align="center"    
              label="登录用户"
              width="120">
            </el-table-column>
            <el-table-column
              prop="loginTime"
              align="center"    
              label="登录时间"
              width="">
            </el-table-column>
            <el-table-column
              prop="loginUserIp"
              align="center"    
              label="Ip地址"
              width="240">
            </el-table-column>
             <el-table-column
              prop="ifSuccess"
              align="center"    
              label="是否成功"
              width="120">
            </el-table-column>
             <el-table-column
              prop="loginDesc"
              align="center"    
              label="登录备注"
              width="240">
            </el-table-column>
            <el-table-column
              align="center"
              label="删除"
              width="80">
              <template slot-scope="scope">
                <el-button type="danger" style="padding: 3px 4px 3px 4px;margin: 2px" size="mini"
                           @click="deleteLoginRecord(scope.row)">
                           <i class="el-icon-delete"></i>
                </el-button>
              </template>
            </el-table-column>
          </el-table>
          <div style="display: flex;justify-content: space-between;margin: 2px">
            <el-button type="danger" size="mini"  :disabled="multipleSelection.length==0"
                       @click="deleteManyLoginRecord">批量删除
            </el-button>
            <el-pagination
               background
              :page-size="10"
              :current-page="currentPage"
              @current-change="currentChange"
              layout="prev, pager, next"
              :total="totalCount">
            </el-pagination>
          </div> 
     </div>
    </div>
</template>

<!--逻辑-->
<script>
export default {
     data () {
    return {
      loginRecord:{
        loginId:'',
        userId:'',
        chineseName:'',
        loginTime:'',
        loginUserIp:'',
        ifSuccess:'',
        loginDesc:''
      },
      show:false,
      loginRecords:[],
      multipleSelection: [],
      dateScope:'',
      datevalue:'',
      isDisabled:0,
      totalCount: -1,
      currentPage: 1,
      tableLoading:false,
      pickerOptions: {
        },
    }
  },
    mounted: function () {
      this.loadLoginRecords();
      this.disPlay();
    },
   methods:{
       searchEmp(){
         this.show=true;
         this.loadLoginRecords();
       },
        disPlay(){
          if(this.departments.length>0){
            this.show=true
          }
        },
      
     handleSelectionChange(val) {
        this.multipleSelection = val;
      },
     keywordsChange(val){
        if (val == '') {
          this.loadLoginRecords();
        }
      },
     currentChange(currentChange){
        this.currentPage = currentChange;
        this.loadLoginRecords();
      },
      

     deleteManyLoginRecord(){
        this.$confirm('此操作将删除[' + this.multipleSelection.length + ']条数据, 是否继续?', '提示', {
          confirmButtonText: '确定',
          cancelButtonText: '取消',
          type: 'warning'
        }).then(() => {
          var ids = '';
          for (var i = 0; i < this.multipleSelection.length; i++) {
            ids += this.multipleSelection[i].loginId + ",";
          }
          this.doDeleteMultiLoginRecord(ids);
        }).catch(() => {
        });
      },
      doDeleteMultiLoginRecord(ids){
        this.tableLoading = true;
        var _this = this;
        var datas = {
          deleteList:ids,
        }
        this.postRequest("/system/loginlog/deleteBatchLoginLogs",datas).then(resp=> {
          _this.tableLoading = false;
          if (resp && resp.status == 200) {
            var data = resp.data;
            this.$message({type: 'success', message: "删除成功！"});
            _this.loadLoginRecords();
          }
        })
      },
       loadLoginRecords(){
           var _this = this;
        var datas = {
          "loginId": "",
          "start":_this.dateScope[0],
          "end":_this.dateScope[1],
          "limit":_this.datevalue
        };
        this.tableLoading = true;
          
        this.postRequest("/system/loginlog/loadLoginLog",datas).then(resp=> {
          this.tableLoading = false;
          if (resp.data && resp.status == 200) {
            _this.loginRecords = resp.data.obj;
          }
        })
      },
  
      deleteLoginRecord(row){
          console.log(row.loginId)
          this.$confirm('此操作将永久删除, 是否继续?', '提示', {
          confirmButtonText: '确定',
          cancelButtonText: '取消',
          type: 'warning'
        }).then(() => {
          this.doDeleteLoginRecord(row.loginId);
           console.log("!!!!!!!!!!!!!"+row.loginId);
        }).catch(() => {
        });
      },
      doDeleteLoginRecord(ids){
        this.tableLoading = true;
        var _this = this;
        var loginLogId=ids;
        var datas = {
          operationUserId:1
        }
        this.deleteRequest("/system/loginlog/deleteLoginLogById/"+loginLogId,datas).then(resp=> {
          _this.tableLoading = false;
          console.log(datas);
          if (resp && resp.status == 200) {
            var data = resp.data;
            this.$message({type: 'success', message: "删除成功！"});
            _this.loadLoginRecords();
          }
        })
      },
      emptyLoginRecordData(){
        this.branch = {
         loginId:'',
         loginTime:'',
         loginIp:'',
         isSuccess:'',
         loginDesc:'',
         name:'',
        }
      },
       cancelEidt(){
        this.recipientIdButton=false;
        this.dialogVisible = false;

        this.emptyLoginRecordData();
      },
  }
}
</script>

<!--样式-->
<style scoped>
.second{
  position:relative;
  left:150px;
}
</style>