<template>

<div>
   <!--标题-->
        <div>
            <el-header id="header">
                员工签到、签退界面
                <hr width="300px" color="#20a0ff">
            </el-header>
        </div>



        <div class="content">
          <div class="first">
              <el-form :model="branch"  ref="addBranchForm" style="margin: 0px;padding: 0px;">
                <!-- <div style="text-align: center;margin-left:100px;"> -->

                  <!-- 行列样式设置 -->
                  <!-- <el-row style="margin-top:0px;padding: 0px;">
                  <el-col :span="10">
                  <div>
                    <el-form-item label="签卡日期:" prop="singinTime">
                    <el-input prefix-icon="el-icon-edit" v-model="branch.branchName" size="mini" style="width: 300px"
                           ></el-input>
                    </el-form-item>
                  </div>
                  </el-col>
                  </el-row> -->
          
            
                  <el-row>
                    <el-col :span="10">
                    <div>
                        <el-form-item label="签卡备注:" prop="signDesc">
                        <el-input type="textarea" prefix-icon="el-icon-edit" v-model="branch.signDesc" size="mini" style="width: 300px"
                            ></el-input>
                        </el-form-item>
                    </div>
                    </el-col>

                    <el-col :span="4">
                      <div style="margin-top:6px;">
                        <!-- <el-form-item prop="singinTag"> -->
                          <el-button size="mini" type="primary"  v-model="branch.singinTag" @click="singIn('addBranchForm')" :disabled="isDisabled=='1'">签到</el-button>
                          <el-button size="mini" type="primary" v-model="branch.singinTag" @click="singOut('addBranchForm')" :disabled="isDisabled=='0'">签退</el-button>
                        <!-- </el-form-item> -->
                      </div>    
                    </el-col>
                  </el-row>
              <!-- </div> -->
            </el-form>
          </div>
<!-- firstdiv结束 -->


<!-- 显示签到签退信息 -->
     <div class="main" v-if="show">
       <el-row>
         <el-col span="18">
           <p>您的签到信息</p> <br>
         </el-col>
       </el-row>
         <el-form :model="branch">
           <el-row>
             <el-col span="10">
                <el-form-item label="用 户 号:" prop="userId">
                  <el-input prefix-icon="el-icon-edit" v-model="branch.userId" size="mini" style="width: 300px"
                           ></el-input>
                </el-form-item>
             </el-col>
             <el-col span="10">
                <el-form-item label="姓 名:" prop="username">
                  <el-input prefix-icon="el-icon-edit" v-model="branch.username" size="mini" style="width: 300px"
                           ></el-input>
                </el-form-item>
             </el-col>
           </el-row>
            <el-row>
             <el-col span="10">
                <el-form-item label="所属部门:" prop="departName">
                  <el-input prefix-icon="el-icon-edit" v-model="branch.departName" size="mini" style="width: 300px"
                           ></el-input>
                </el-form-item>
             </el-col>
             <el-col span="10">
                <el-form-item label="所属机构:" prop="branchName">
                  <el-input prefix-icon="el-icon-edit" v-model="branch.branchName" size="mini" style="width: 300px"
                           ></el-input>
                </el-form-item>
             </el-col>
           </el-row>  
           <el-row>
             <el-col span="10">
               <el-form-item label="您的签到时间:" prop="signTime">
                   {{msg | compFilter('yyyy-MM-dd hh:mm') }}
                </el-form-item>
             </el-col>
           </el-row>
           <el-row>
             <el-col span="10">
               <el-form-item label="签卡备注:" prop="signDesc">
                  <el-input type="textarea" prefix-icon="el-icon-edit" v-model="branch.signDesc" size="mini" style="width: 300px"
                           ></el-input>
                </el-form-item>
             </el-col>
           </el-row>
         </el-form>
     </div>

     
     <div class="main" v-if="show2">
        <el-row>
         <el-col span="18">
           <p>您的签退信息</p> <br>
         </el-col>
       </el-row>
         <el-form :model="branch">
           <el-row>
             <el-col span="10">
                <el-form-item label="用 户 号:" prop="userId">
                  <el-input prefix-icon="el-icon-edit" v-model="branch.userId" size="mini" style="width: 300px"
                           ></el-input>
                </el-form-item>
             </el-col>
             <el-col span="10">
                <el-form-item label="姓 名:" prop="username">
                  <el-input prefix-icon="el-icon-edit" v-model="branch.username" size="mini" style="width: 300px"
                           ></el-input>
                </el-form-item>
             </el-col>
           </el-row>
            <el-row>
             <el-col span="10">
                <el-form-item label="所属部门:" prop="departName">
                  <el-input prefix-icon="el-icon-edit" v-model="branch.departName" size="mini" style="width: 300px"
                           ></el-input>
                </el-form-item>
             </el-col>
             <el-col span="10">
                <el-form-item label="所属机构:" prop="branchName">
                  <el-input prefix-icon="el-icon-edit" v-model="branch.branchName" size="mini" style="width: 300px"
                           ></el-input>
                </el-form-item>
             </el-col>
           </el-row>  
           <el-row>
             <el-col span="10">
               <el-form-item label="您的签退时间:" prop="signTime">
                   {{msg | compFilter('yyyy-MM-dd hh:mm') }}
                </el-form-item>
             </el-col>
           </el-row>
           <el-row>
             <el-col span="10">
               <el-form-item label="签卡备注:" prop="signDesc">
                  <el-input type="textarea" prefix-icon="el-icon-edit" v-model="branch.signDesc" size="mini" style="width: 300px"
                           ></el-input>
                </el-form-item>
             </el-col>
           </el-row>
         </el-form>
     </div>
   </div>
</div>
  
  
</template>
<script>
export default {
  
  data () {
    return {

      msg:new Date(),


      branch:{
        userId:'',
        username:'',
        signTime:'',
        signTag:'',
        signDesc:'',
        departName:'',
        branchName:'',
      },
      show2:false,
      show:false,
      isDisabled:0,
      totalCount: -1,
      currentPage: 1,
      tableLoading:false,
      multipleSelection:[],
      branchs: [{
          branchName:'华北电力科学研究院',
          branchShortName: '华电',
        }, {
           branchName: '中国科学院声学研究院',
          branchShortName: '中科声研究院',
        }, {
              branchName: '北大青岛集团',
          branchShortName: '青岛',
        }, {
             branchName: '大唐国际盘山发电有限公司',
          branchShortName: '盘电',
        }],
    }
  },

//签卡日期显示
filters: {
  compFilter: function(value, format) {
    let o = {
      "M+": value.getMonth()+1,
      "d+": value.getDate(),
      "h+": value.getHours(),
      "m+": value.getMinutes(),
      "s+": value.getSeconds(),
    }
    if(/(y+)/.test(format)){
      format = format.replace(RegExp.$1, (value.getFullYear() + "").substr(4-RegExp.$1.length));
      for(let k in o) {
        if(new RegExp(`(${k})`).test(format)){
          format = format.replace(RegExp.$1, (RegExp.$1.length == 1)?(o[k]):(("00" + o[k]).substr((""+o[k]).length)))
        }
      }
      return format;
    }
  }
},



    mounted: function () {

      this.loadBranchs();
 
    },
  methods:{
     handleSelectionChange(val) {
        this.multipleSelection = val;
      },
     keywordsChange(val){
        if (val == '') {
          this.loadBranchs();
        }
      },
     currentChange(currentChange){
        this.currentPage = currentChange;
        this.loadBranchs();
      },
 
      
      //增加
       singIn(formName){
        
        var _this = this;
        this.$refs[formName].validate((valid) => {
          if (valid) {
              this.postRequest("/admin/sign/in", this.branch).then(resp=> {
                console.log("增加部分",resp);

                 if (resp && resp.status == 200) {
                    this.show=true;
                    this.show2=false;
                    this.isDisabled = 1;
                    var data = resp.data.obj;
                    _this.showBranchView(data);
                 }
                 if (resp && resp.status == 500) {
                    this.show=false;
                    this.show2=true;
                    this.isDisabled = 0;
                 }
              }) 
          }
          else{
            return false;
          }
        });
      },
      singOut(formName){
        this.show=false;
        this.show2=true;
        this.isDisabled = 0;
        var _this = this;
        this.$refs[formName].validate((valid) => {
          if (valid) {
              this.postRequest("/admin/sign/off", this.branch).then(resp=> {
                console.log("增加部分",resp);
                 if (resp && resp.status == 200) {
                  var data = resp.data;
                   _this.showBranchView(data);
                 }
              })
          }
          else{
            return false;
          }
        });
      },
 
        showBranchView(row){
          this.branch.branchName = row.branchName;
         this.branch.departName = row.departName;
        this.branch.userId=row.userId;
         this.branch.username=row.username;
     //    this.branch.singinTime=row.singinTime;
      //   this.branch.singinDesc=row.singinDesc;
      },
     
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>

 #header{
        font-size:30px;
    }

.head{
  position: absolute;
  width:1200px;
  top:30px;
  left:50px;
  font-size: 30px;
}
.first{

  position: relative;
  width:1000px;
  top:50px;
  left:100px;
}
.main{
  position:relative;
  top:80px;
  left:100px;
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
