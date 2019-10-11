<!--内容-->
<template>
  <div>
      <div>
            <el-header style="font-size:20px;">
                操&nbsp;作&nbsp;日&nbsp;志
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
                      value-format="yyyy-MM-dd">
                    </el-date-picker>
          </el-col>
          <el-col :span="12" :offset="0" style="margin-top:1px;">
            <el-form-item style="margin-left:35px;">
                <el-radio v-model="datevalue" label="1">本日</el-radio>
                <el-radio v-model="datevalue" label="2">本周</el-radio>
                <el-radio v-model="datevalue" label="3">本月</el-radio>
                <el-button icon="el-icon-search" type="primary" size="mini" @click="searchRec">搜索</el-button>
            </el-form-item>
          </el-col>
        </el-row>
            </div>
        </div>
       </el-form>
       <div class="main"  v-if="show">
          <el-table
            :data="operationRecords"
            v-loading="tableLoading"
            border
            stripe
            @selection-change="handleSelectionChange"
            size="mini"
            style="width: 80%;margin-left:110px;">
            <el-table-column
              type="selection"
              align="left"
              width="30">
            </el-table-column>
            <el-table-column
              prop="operateId"
              label="序号"
              align="center"
              width="100">
            </el-table-column>
            <el-table-column
              prop="objectId"
              align="center"    
              label="操作用户"
              width="150">
            </el-table-column>
            <el-table-column
              prop="operateName"
              align="center"    
              label="事件"
              width="120">
            </el-table-column>
            <el-table-column
              prop="operateDesc"
              align="center"    
              label="操作描述"
              width="">
            </el-table-column>
             <el-table-column
              prop="operateTime"
              align="center"    
              label="操作时间"
              width="280">
            </el-table-column>
          </el-table>
          <div style="display: flex;justify-content: space-between;margin-left: 105px;margin-top:10px;">
            <el-button type="danger" size="mini" :disabled="multipleSelection.length==0"
                       @click="deleteManyOperaRecords">批量删除
            </el-button>
          </div> 
     </div>
  </div>
</template>

<!--逻辑-->
<script>
export default {
    data(){
        return{
            operationlog:{
                operateId:'',
                userId:'',
                operateName:'',
                objectId:'',
                operateDesc:'',
                operateTime:''
            },
            operationRecords:[],
            dateScope:'',
            datevalue:'',
            show:false,
            multipleSelection:[]
        } 
    },
    mounted:function(){
        this.display();
        this.loadOpreationRecords();
    },
    methods:{
        searchRec(){
         this.show=true;
         this.loadOpreationRecords();
        },
        display(){
            if(this.departments.length>0){
            this.show=true
          }
        },
        loadOpreationRecords(){
          var _this = this;
        var datas = {
          "start":_this.dateScope[0],
          "end":_this.dateScope[1],
          "limit":_this.datevalue
        };
        this.tableLoading = true;
          
        this.postRequest("/system/operatelog/selectalloperatelog",datas).then(resp=> {
          this.tableLoading = false;
          if (resp.data && resp.status == 200) {
            console.log("接收到了什么呢",resp);
            _this.operationRecords = resp.data.obj;
          }
        })
        },
        handleSelectionChange(val) {
        this.multipleSelection = val;
      },
      deleteManyOperaRecords(){
         this.$confirm('此操作将删除[' + this.multipleSelection.length + ']条数据, 是否继续?', '提示', {
          confirmButtonText: '确定',
          cancelButtonText: '取消',
          type: 'warning'
        }).then(() => {
          var ids = '';
          for (var i = 0; i < this.multipleSelection.length; i++) {
            ids += this.multipleSelection[i].operateId + ",";
          }

          this.doDeleteManyOperaRecords(ids);
        }).catch(() => {
        });
      },
      doDeleteManyOperaRecords(ids){
        console.log("不进来",ids)
        var _this = this;
        var datas = {
          deleteList:ids,
        }
        this.postRequest("/system/operatelog/deleteOperateLoginLogs",datas).then(resp=> {
          console.log("111111111111")
          _this.tableLoading = false;
          if (resp && resp.status == 200) {
            var data = resp.data;
            this.$message({type: 'success', message: "删除成功！"});
            _this.loadOpreationRecords();
          }
        })
      }
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