<template>

<div>
   <!--标题-->
        <div>
            <el-header id="header">
                考勤历史查询
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
           <el-row style="margin-top:20px;" >
              <el-col :span="15">
                <el-form-item label="查找范围"  >
                  <el-checkbox v-model="checkedByBranch"  @change="showScreenRange()">按机构</el-checkbox>
                  <el-checkbox  v-model="checkedByDepart" @change="showScreenRange()">按部门</el-checkbox>
                  <el-checkbox  v-model="checkedByUserId" @change="showScreenRange()">按员工号</el-checkbox>
                  <el-checkbox  v-model="checkedByName" @change="showScreenRange()">按姓名</el-checkbox>
                </el-form-item>
              </el-col>
            </el-row>


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
            <el-col :span="6">
               <el-form-item label="员工号:" >
                    <el-input prefix-icon="el-icon-edit" v-model="message.userId" :disabled="ifSelectUserId" size="mini" style="width: 120px"
                    ></el-input>
               </el-form-item>
            </el-col> 
            <el-col :span="6">
               <el-form-item label="姓名:" >
                 <el-input prefix-icon="el-icon-edit" v-model="message.username"  :disabled="ifSelectName" size="mini" style="width: 100px"
                 ></el-input>
              </el-form-item>
           </el-col>
        </el-row>

        <hr>
         <el-row>
           <el-col :span="5" :offset="8" >
             <el-button icon="el-icon-search" type="primary" size="mini" @click="searchEmp('search')">搜索</el-button>
           </el-col>
        </el-row>
       </el-form>
     </div>


<!-- 显示查询结果 -->
     <div class="main" v-if="show2" >
       
          <el-table
            :data="datass"
            border
            stripe
            @selection-change="handleSelectionChange"
            size="mini"
            style="width: 100%">
            <el-table-column
              prop="username"
              align="center"    
              label="签到员工"
              width="150">
            </el-table-column>
            <el-table-column
              prop="signTime"
              align="center"    
              label="签卡时间"
              width="235">
            </el-table-column>
            <el-table-column
              prop="signTag"
              align="center"    
              label="签卡标记"
              width="150">
            </el-table-column>
             <el-table-column
              prop="signDesc"
              align="center"    
              label="签卡备注"
              width="250">
            </el-table-column>
             <el-table-column
              prop="departName"
              align="center"    
              label="所属部门"
              width="180">
            </el-table-column>
             <el-table-column
              prop="branchName"
              align="center"    
              label="所属机构"
              width="180">
            </el-table-column>
          </el-table>
      
     </div>
</div>

</template>
<script>
export default {
data () {
    return {
     
      message:{
        dateScope:'',
        username:'',
        signTime:'',
        startTime:'',
        stopTime:'',
        signTag:'',
        signDesc:'',
        branchName:'',
        departName:'',
        checkList:[],
        departmentId:'',
        messageTitle:'',
        messageType:'',
        messageContent:'',
        
      
      },

      show2:false,


      //查询结果显示信息
       messages:[
        {
          username:"",
          signTime:"",
          signTag:"",
          signDesc:"",
          branchName:"",
          departName:"",
        }
      ],

      //接收查询返回的信息
      datass:[],
      branchNames:[],
      toUserIdButton: false,
      pulishButton: false,
      checkedByDay:'',
      checkedByWeek:'',
      checkedByMonth:'',
      checkedByBranch:'',
      checkedByDepart:'',
      checkedByUserId:'',
      checkedByName:'',
      ifSelectDay:'',
      ifSelectWeek:'',
      ifSelectMonth:'',
      ifSelectBranch:'',
      ifSelectDepart:'',
      ifSelectUserId:'',
      ifSelectName:'',
      dialogMessageVisible: false,
      dialogToUserVisible: false,
      showRange:true,
      dialogVisible: false,
      isDisabled:0,
      totalCount: -1,
      currentPage: 1,
      tableLoading:false,
      multipleSelection:[],
      show:false,
      branchNames:[],
      departNames:[],
      departmentNames:[],
      departments: [],
      allPrincipals:[],
    }
  },


   mounted: function () {
      this.loadMessages();
      this.getAllBranchsInfo();
      this.getAlldepartmentsInfo();
      this.getBranch();
      // this.disPlay();

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
//机构下拉框的值改变，部门下拉框实现二级联动
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





    showScreenRange(){
       if (this.checkedByBranch) {
        this.ifSelectBranch = false
        this.ifSelectDepart = true
        this.ifSelectUserId = true
        this.ifSelectName = true
        this.checkedByDepart = false
        this.checkedByUserId = false
        this.checkedByName = false
      } else if (this.checkedByDepart) {
        this.ifSelectBranch = false
        this.ifSelectDepart = false
        this.ifSelectUserId = true
        this.ifSelectName = true
        this.checkedByBranch = false
        this.checkedByUserId = false
        this.checkedByName = false
      } else if (this.checkedByUserId) {
        this.ifSelectBranch = true
        this.ifSelectDepart = true
        this.ifSelectUserId = false
        this.ifSelectName = true
        this.checkedByBranch = false
        this.checkedByDepart = false
        this.checkedByName = false
      } else if (this.checkedByName) {
        this.ifSelectBranch = true
        this.ifSelectDepart = true
        this.ifSelectUserId = true
        this.ifSelectName = false
        this.checkedByBranch = false
        this.checkedByDepart = false
        this.checkedByUserId = false
      } else if(this.checkedByDay)
      {
        this.ifSelectWeek = true
        this.ifSelectMonth = true
        this.checkedByWeek = false
        this.checkedByMonth = false
      }
      else if(this.checkedByWeek)
      {
        this.ifSelectDay = true
        this.ifSelectMonth = true
        this.ifSelectDay = false
        this.checkedByMonth = false
      }else if(this.checkedByMonth)
      {
        this.ifSelectWeek = true
        this.ifSelectDay = true
        this.ifSelectDay = false
        this.checkedByWeek = false
      }
      
      
      
      else {
        this.ifSelectBranch = true
        this.ifSelectDepart = true
        this.ifSelectUserId = true
        this.ifSelectName = true
        this.checkedByBranch = false
        this.checkedByDepart = false
        this.checkedByUserId = false
        this.checkedByName = false
      }
    },


        searchEmp(formName){
         
        this.show2 = true;
        var _this = this;
        var datas = {
          "username":"",
          "signTime":"",
          "signTag":"",
          "signDesc":"",
          "branchName":"",
          "departName":"",
          "beginTime":'',
          "endTime":'',

         // "start": (this.currentPage-1)*10          
        };
        this.tableLoading = true;
       

        this.postRequest("/admin/ManualSearch",this.message).then(resp=> {
          this.tableLoading = false;
          console.log("test",resp);
          console.log("ffffffffff",this.message);
         if (resp.data && resp.status == 200) {
            this.datass = resp.data.obj;
             console.log("hhhhhhhhhhh",this.datass);
            _this.totalCount = resp.data.obj.listCount;
          }
        })
        },
         disPlay(){
          if(this.messages.length>0){
            this.show=true
          }
        },


   
  },
}
</script>
<style scoped>

 #header{
        font-size:30px;
    }

.head{
  position: absolute;
  width:1200px;
  top:30px;
  left:50px;
  font-size: 20px;
}
.second{
  font-family: Georgia, Times, 'Times New Roman', serif;
  position:relative;
  top:140px;
  left:100px;

}
.first{
  font-family:  Georgia, Times, 'Times New Roman', serif;
  position: relative;
  width:1000px;
  top:150px;
  left:0px;
}
.main{
  position:relative;
  top:50px;
  left:0px;
}
h1, h2 {
  font-weight: normal;
}
ul {
  list-style-type: none;
  padding: 0;
}
li {
  display: inline-block;
  margin: 0 10px;
}
a {
  color: #42b983;
}
</style>