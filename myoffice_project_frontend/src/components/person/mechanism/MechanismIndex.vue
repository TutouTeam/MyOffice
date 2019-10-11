<!--内容-->
<template>
    
    <div>
        <!--标题-->
        <div>
            <el-header id="header">
                机构管理
                <hr width="100%" style="color:rgb(198,198,198)">
            </el-header>
        </div>

        <!--添加及修改的模态框，非弹窗模式-->
        <el-form :model="branch" ref="addAndUpdateBranch" :rules="rules">
           <div style="margin-top:20px">
             <el-row>
              <el-col :span="8">
                <div style="margin-left: 100px">
                  <el-form-item label="机构名称:" prop="branchName">
                    <el-input
                      style="width: 240px;margin: 0px;padding: 0px;"
                      v-model="branch.branchName"
                      size="mini"
                      >
                      </el-input>
                  </el-form-item>
                </div>
              </el-col>
              <el-col :span="8">
                <div style="margin-left: 100px">
                  <el-form-item label="机构简称:" prop="branchShortName">
                    <el-input
                      style="width: 240px;margin: 0px;padding: 0px;"
                      v-model="branch.branchShortName"
                      size="mini"
                      >
                      </el-input>
                  </el-form-item>
                </div>
              </el-col>
              <el-col :span="8">
                <div>
                  <el-form-item>
                   <el-button  
                    type="primary" 
                    size="mini" 
                    style="margin-left: 60px;"
                    @click="addMec('addAndUpdateBranch')"
                    :disabled="isDisabled=='1'">
                    添加
                   </el-button>
                   <el-button  
                    type="primary" 
                    size="mini" 
                    style="margin-left: 10px;"
                    @click="updateMec('addAndUpdateBranch')"
                    :disabled="isDisabled=='0'">
                     保存修改
                   </el-button>
                  </el-form-item>
                </div>
              </el-col>
             </el-row>
           </div>
        </el-form>
        <!--表格-->
        <div style="padding-left: 40px;padding-right: 40px;padding-top: 20px;">
            <!--:data="tables"的tables对应下面的tables-->
            <el-table
                :data="branchs"
                border
                stripe
                size="mini"
                style="width: 100%"
                >

                <el-table-column
                    prop="branchName"
                    label="机构名称"
                    width=""
                    align="center">
                </el-table-column>

                <el-table-column
                    prop="branchShortName"
                    label="机构简称"
                    width="240"
                    align="center">
                </el-table-column>

                <el-table-column
                    width="120"
                    label="修改"
                    align="center">
                    <template slot-scope="scope">
                        <!--团队变更记录的变更按钮-->
                        <el-button @click="showBranchView(scope.row)" style="padding: 3px 4px 3px 4px;margin: 2px"
                           size="mini">
                           <i class="el-icon-edit" ></i>
                </el-button>
                    </template>
                </el-table-column>

                <el-table-column
                    width="120"
                    label="删除"
                    align="center">
                    <template slot-scope="scope">
                        <!--团队变更记录的删除按钮-->
                        <el-button type="danger" style="padding: 3px 4px 3px 4px;margin: 2px" size="mini"
                           @click="deleteMec(scope.row)">
                           <i class="el-icon-delete"></i>
                        </el-button>
                    </template>
                </el-table-column>
            </el-table>
            <div style="display: flex;justify-content: space-between;margin: 2px">
              <div></div>
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

<!--Javascript-->
<script>
export default {
    //数据定义
    data() {
        return{ 
            isDisabled:0,
            currentPage:1,
            totalCount:-1,
            keywords: '',//查询的关键字

            branch:{//这个部分必须得写
                branchId: '',
                branchName: '',
                branchShortName: ''
            },
            branchs:[],
            rules: {
              branchName: [{ required: true, message: "机构名称不能为空", trigger: "blur" }],
              branchShortName: [{ required: true, message: "机构简称不能为空", trigger: "blur" }]
      }
        }
    },

    //挂载钩子
    mounted: function () {
      this.loadMec();
    },


    //方法集合
    methods:{
      loadMec(){
        var _this = this;
        var datas = {
        };
        this.tableLoading = true;
          
        this.postRequest("/home/branchmessage/listBranchVo",datas).then(resp=> {
          this.tableLoading = false;
          if (resp.data && resp.status == 200) {
            _this.branchs = resp.data.obj;
            // console.log("id不见了呀你妈的",resp.data.obj);
          }
        })
      },

      //增
      addMec(formName){
          var _this=this;
          this.$refs[formName].validate((valid) => {
            if(valid){
              this.postRequest("/home/branchmessage/addBranch",this.branch).then(resp=> {
                if(resp.data && resp.status == 200){
                  _this.branchs = resp.data.obj;
                  this.$message({type: 'success', message: "添加成功！"});
                 _this.emptyData();
                  this.loadMec();
                }
              })
            }
          });
      },
      //改
      updateMec(formName){
          var _this = this;
          _this.isDisabled=0;
          this.$refs[formName].validate((valid) => {
            if(valid){
              this.postRequest("/home/branchmessage/updateBranch",this.branch).then(resp=> {
                if(resp.data && resp.status == 200){
                  _this.branchs = resp.data.obj;
                 _this.emptyData();
                  this.loadMec();
                }
              })
            }
          });
      },
      showBranchView(row){
        console.log(row);
        this.isDisabled = 1;
        this.branch.branchId=row.branchId;
        this.branch.branchName = row.branchName;
        this.branch.branchShortName = row.branchShortName;
      },
      //删
      deleteMec(row){
          this.$confirm('此操作将永久删除, 是否继续?', '提示', {
          confirmButtonText: '确定',
          cancelButtonText: '取消',
          type: 'warning'
        }).then(() => {
          this.doDeleteMec(row.branchId);
        }).catch(() => {
        });
      },
      doDeleteMec(ids){
        this.tableLoading = true;
        var _this = this;
        var datas = {
          branchId:ids
        }
        this.postRequest("/home/branchmessage/deleteBranchByBranchId",datas).then(resp=> {
          _this.tableLoading = false;
          if (resp && resp.status == 200) {
            var data = resp.data;
            this.$message({type: 'success', message: "删除成功！"});
            _this.loadMec();

          }
        })
      },
      emptyData(){
       this.branch.branchId="";
        this.branch.branchName = "";
        this.branch.branchShortName = "";
      }
    }
}
</script>>

<!--CSS-->
<style scoped>
    #header{
        font-size:30px;
    }
</style>