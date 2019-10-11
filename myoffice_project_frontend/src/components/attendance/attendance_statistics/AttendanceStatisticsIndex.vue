<!--内容-->
<template>
      <div>
      
       <!--标题-->
        <div>
            <el-header id="header">
                考勤统计主界面
                <hr width="300px" color="#20a0ff">
            </el-header>
        </div>

 <div class="content">
           <el-form :model="message" ref="search">
              <el-row style="margin-top: 40px">
              <el-col :span="6">
              <span>输入起始时间:</span>
              </el-col>

              <el-col :span="10">

                
                <el-form-item prop="startTime">
                  <el-input type="text" placeholder="yyyy-MM-dd" v-model="message.startTime" auto-complete="off" ></el-input>
                </el-form-item>

              </el-col>
              </el-row>
            

              <el-row style="margin-top: 0px">
              <el-col :span="6">
              <span>输入结束时间:</span>
              </el-col>

              <el-col :span="10">
    
                <el-form-item prop="stopTime">
                  <el-input type="text" placeholder="yyyy-MM-dd" v-model="message.stopTime" auto-complete="off" ></el-input>
                </el-form-item>

              <br><br>

              </el-col>
              </el-row>


       <hr>
        
          <br>
              
                <el-row>
                  <el-col :span="6">
                <el-form-item label="机构:" >
                  <el-select v-model="message.branchName" :disabled="ifSelectBranch" style="width: 150px" size="mini" @change="getBranch">
                    <el-option
                      v-for="item in this.branchNames"
                      :key="item.id"
                      :label="item.branchName"
                      :value="item.branchName">
                    </el-option>
                  </el-select>
                </el-form-item>
              </el-col>


              <el-col :span="6">
                    <el-form-item label="部门:" >
                    <el-select v-model="message.departName"  :disabled="ifSelectDepart" style="width: 150px" size="mini" @change="getDepart"  >
                      <el-option
                        v-for="item in this.departNames"
                        :key="item.id"
                        :label="item.departName"
                        :value="item.departName">
                      </el-option>
                    </el-select>
                  </el-form-item>
            </el-col>
              <el-col :span="5" :offset="8" >
                <el-button icon="el-icon-search" type="primary" size="mini" @click="searchEmp('search')">统计</el-button>
              </el-col>
            </el-row>
          </el-form>
        </div>


        <div class="main"  style= "margin-top:20px" v-if="show">
          <el-table
            :data="datas"
            border
            stripe
            @selection-change="handleSelectionChange"
            size="mini"
            style="width: 90%">
            <el-table-column
              prop="userName"
              align="center"    
              label="姓名"
              width="150">
            </el-table-column>
            <el-table-column
              prop="attendance"
              align="center"    
              label="出勤率"
              width="200">
            </el-table-column>
            <el-table-column
              prop="late"
              align="center"    
              label="迟到次数"
              width="100">
            </el-table-column>
             <el-table-column
              prop="leaveEarly"
              align="center"    
              label="早退次数"
              width="150">
            </el-table-column>
             <el-table-column
              prop="absenteeism"
              align="center"    
              label="旷工次数"
              width="150">
            </el-table-column>
             <el-table-column
              prop="departName"
              align="center"    
              label="所属机构"
              width="150">
            </el-table-column>
             <el-table-column
              prop="branchName"
              align="center"    
              label="所属部门"
              width="150">
            </el-table-column>
          </el-table>
     </div>

    </div>


        

        

</template>

<!--逻辑-->
<script>
export default {
data () {
    return {
    
      
      message:{
        startTime:'',
        stopTime:'',
        branchName:'',
      //  departmentName:'',
        departName:'',
        checkList:[],
        
      },

      //统计显示内容
       messages:[
        {
           "userName":"",
          "attendance": "",
          "late":"",
          "leaveEarly":"",
          "absenteeism":"",
          "departName":"",
          "branchName":" ",
        }
      ],
      tableLoading:false,
      show:false,

      datas:[],
      branchNames:[],
      departmentNames:[],
      departments: [],
      branchName:[],
      departNames:[],
      departName:[],
      allPrincipals:[],
    }
  },
   mounted: function () {
      this.loadMessages();
      this.getAllBranchsInfo();
      this.getAlldepartmentsInfo();
      this.getBranch();
      
    },

 watch:{
        branchNames:{
          handler(newValue, oldValue) {},
          deep:true
        },
        departNames:{
          handler(newValue, oldValue) {},
          deep:true
        }
    },


created(){
this.getBranch()
  
},


methods:{

getBranch(){
      
      let tempValue = []
      var branchNames = {"branchName":""}
          this.getRequest("/admin/attendsearch/branch").then(resp=> {
            console.log("所有机构信息",resp);
            this.branchNames= resp.data;
            console.log("当前选择机构名称：",this.message.branchName);
            this.getDepart();
          
        })
        
    },

      getDepart(){
      
      let tempValue = []
      var departNames = {"departName":""}
             console.log("当前选择机构名称：",this.message.branchName);
            this.getRequest("/admin/attendsearch/"+ this.message.branchName).then(resp=> {
           
            console.log("所有部门信息",resp);
            this.departNames = resp.data;
            console.log("已获得的部门信息",this.departNames);

            console.log("this.departNames：",this.departNames);
          
          
        })
         },


        searchEmp(){
          this.show= true;
           var _this = this;
       //搜索条件
        var datas = {
          "userName":"",
          "attendance": "",
          "late":'',
          "leaveEarly":'',
          "absenteeism":'',
          "departName":'',
          "branchName": '',
    //      "start": (this.currentPage-1)*10          
        };
    

        this.tableLoading = true;
        this.postRequest("/admin/attends",this.message).then(resp=> {
        //  this.tableLoading = false;
            console.log("test pass data:",this.message);
            console.log("received resp",resp);
            this.datas = resp.data.obj;
            console.log("data:",this.datas);
            
            _this.totalCount = resp.data.obj.listCount;
          
        })
   },

}
}
</script>

<!--样式-->
<style scoped>

    #header{
        font-size:30px;
    }
</style>