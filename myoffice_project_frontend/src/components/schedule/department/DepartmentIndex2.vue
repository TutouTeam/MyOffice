<!--内容-->
<template>
    <!--外层容器-->
    <el-container>
        <!--顶栏容器-->
        <el-header>
            <!--标题-->
            <div>
                <el-header class="header">
                    部门日程主界面
                    <hr width="300px" color="#20a0ff">
                </el-header>
            </div>    
        </el-header>

        <!--主要区域容器-->
        <el-main>
            <!--模糊搜索部分-->
            <div>
                <!--在表单内设置模糊查询的操作选择框-->
                <el-form >
                    <!--利用<el-row>和<el-col>进行布局-->
                    <!--第一行-->
                    <el-row >

                        <el-col :span="8">
                            <div>
                                <el-form-item>
                                    <span>选择机构:</span>
                                    <el-select v-model="message.branchName" style="width: 70%" @change="getBranch">
                                        <el-option
                                            v-for="item in this.branchNames"
                                            :key="item.id"
                                            :label="item.branchName"
                                            :value="item.branchName">
                                        </el-option>
                                    </el-select>
                                </el-form-item>
                            </div>
                        </el-col>

                        <el-col :span="8">
                            <div>
                                <el-form-item>
                                    <span>选择部门:</span>
                                    <el-select v-model="message.departName" style="width:70%" @change="getDepart">
                                         <el-option
                                            v-for="item in this.departNames"
                                            :key="item.id"
                                            :label="item.departName"
                                            :value="item.departName">
                                        </el-option>
                                    </el-select>
                                </el-form-item>
                            </div>
                        </el-col>

                        <el-col :span="8">
                            <div>
                                <el-form-item>
                                    <sapn>姓名:</sapn>
                                    <el-input prefix-icon="el-icon-edit" v-model="name" placeholder="请输入员工姓名" style="width: 50%"></el-input>
                                </el-form-item>
                            </div>
                        </el-col>

                    </el-row>

                    <!--第二行-->
                    <el-row style="margin-top: 20px;padding: 0px;">

                        <el-col :span="8">
                            <div>
                                <el-form-item>
                                    <sapn>日期: {{this.schedule.title}}</sapn>
                                    <el-input prefix-icon="el-icon-date" v-model="selectTime" placeholder="yyyy-MM-dd" style="width: 60%"></el-input>
                                </el-form-item>
                            </div>
                        </el-col>

                        <el-col :span="8">
                            <div>
                                <el-button icon="el-icon-search" type="primary" style="width: 200px" @click="Search()">搜索</el-button>
                            </div>
                        </el-col>

                    </el-row>

                </el-form>
            </div>

            <!--搜索结果部分-->
            <div>
                
                <span>{{this.selectTime}}</span> 
                <br/>
                 <el-table
                        :data="datas"
                        border
                        style="width: 100%"
                        v-if="show"
                        >
                        

                        <el-table-column
                        fixed
                        prop="chineseName"
                        label="人员姓名"
                        width="150">
                        </el-table-column>

                        <el-table-column
                        prop="scheduleList[0].title"
                        :label="'星期天 '+this.Sunday"
                        width="160" >
                       <template slot-scope="scope"> 
                          <el-button  type="primary" 
                          style="width: 150px" 
                          @click="showDetail(scope.row.scheduleList[0])"
                          v-if="ifVisible(scope.row.scheduleIdList[0])">{{scope.row.scheduleList[0].title}} 
                          查看日程详情</el-button>
                        </template>
                        </el-table-column>
                       

                        <el-table-column
                        prop="scheduleList[1].title"
                        :label="'星期一 '+this.Monday"
                        width="160">
                        <template slot-scope="scope"> 
                          <el-button  type="primary" 
                          style="width: 150px" 
                          @click="showDetail(scope.row.scheduleList[1])"
                          v-if="ifVisible(scope.row.scheduleIdList[1])">{{scope.row.scheduleList[1].title}} 
                          查看日程详情</el-button>
                        </template>
                        </el-table-column>

                        <el-table-column
                        prop="scheduleList[2].title"
                        :label="'星期二 '+this.Tuesday"
                        width="160">
                         <template slot-scope="scope"> 
                          <el-button  type="primary" 
                          style="width: 150px" 
                          @click="showDetail(scope.row.scheduleList[2])"
                          v-if="ifVisible(scope.row.scheduleIdList[2])">{{scope.row.scheduleList[2].title}} 
                          查看日程详情</el-button>
                        </template>
                        </el-table-column>

                        <el-table-column
                        prop="scheduleList[3].title"
                        :label="'星期三 '+this.Wednesday"
                        width="160">
                       <template slot-scope="scope"> 
                          <el-button  type="primary" 
                          style="width: 150px" 
                          @click="showDetail(scope.row.scheduleList[3])"
                          v-if="ifVisible(scope.row.scheduleIdList[3])">{{scope.row.scheduleList[3].title}} 
                          查看日程详情</el-button>
                        </template>
                        </el-table-column>

                        <el-table-column
                        prop="scheduleList[4].title"
                        :label="'星期四 '+this.Thursday"
                        width="160"> 
                       <template slot-scope="scope"> 
                          <el-button  type="primary" 
                          style="width: 150px" 
                          @click="showDetail(scope.row.scheduleList[4])"
                          v-if="ifVisible(scope.row.scheduleIdList[4])">{{scope.row.scheduleList[4].title}} 
                          查看日程详情</el-button>
                        </template>
                        </el-table-column>



                        <el-table-column
                        
                        prop="scheduleList[5].title"
                        :label="'星期五 '+this.Friday"
                        width="160">

                        <!-- 取到当前单元格 scop.row直接取到该单元格对象 -->

                       <template slot-scope="scope"> 
                          <el-button  type="primary" 
                          style="width: 150px" 
                          @click="showDetail(scope.row.scheduleList[5])"
                          v-if="ifVisible(scope.row.scheduleIdList[5])">{{scope.row.scheduleList[5].title}} 
                          查看日程详情</el-button>
                        </template>
                        </el-table-column>
                        
                        <el-table-column
                        prop="scheduleList[6].title"
                        :label="'星期六 '+this.Saturday"
                        width="185">
                         <template slot-scope="scope"> 
                          <el-button  type="primary" 
                          style="width: 150px" 
                          @click="showDetail(scope.row.scheduleList[6])"
                          v-if="ifVisible(scope.row.scheduleIdList[6])">{{scope.row.scheduleList[6].title}} 
                          查看日程详情</el-button>
                        </template>
                        </el-table-column>


                    </el-table>
               

            </div>


            <div>
                <!--查看日程详情-->
                <el-dialog :title="dialogScheduleTitle" :visible.sync="dialogScheduleVisible">
                    <!--表单-->
                    <el-form :model="schedule"> 
                        <!--利用<el-row>和<el-col>进行布局-->
                        <!--第一行-->
                        <el-row>
                            <el-col :span="24">
                                <el-form-item prop="title">
                                    <span>主题：</span>
                                    <el-input  style="width: 73%" v-model="this.schedule.title"></el-input>
                                </el-form-item>
                            </el-col>
                        </el-row>

                        <!--第二行-->
                        <el-row>
                            <el-col :span="12">
                                <el-form-item prop="address">
                                    <span>地点：</span>
                                    <el-input style="width: 46%" v-model="this.schedule.address"></el-input>
                                </el-form-item>
                            </el-col>
                            <el-col :span="12">
                                <el-form-item prop="meetingName">
                                    <span>会议类型：</span>
                                     <el-input style="width: 46%" v-model="this.schedule.meetingName"></el-input>
                                </el-form-item>
                            </el-col>
                        </el-row>

                        <!--第三行-->
                        <el-row>
                            <el-col :span="24">

                                <el-form-item prop="beginTime">
                                    <span>起始时间：</span>
                                    <el-input style="width: 46%" v-model="this.schedule.beginTime"></el-input>
                                </el-form-item>

                                <el-form-item prop="endTime">
                                    <span>结束时间：</span>
                                    <el-input style="width: 46%" v-model="this.schedule.endTime"></el-input>
                                </el-form-item>
                               
                            </el-col>
                        </el-row>

                        <!--第四行-->
                        <el-row>
                            <el-col>
                                <el-form-item prop="schContent">
                                    <span style="position:absolute;left: 70px;">日程内容：</span><br>
                                    <el-input  type="textarea" :rows="10" style="width: 80%" v-model="this.schedule.schContent"></el-input>
                                </el-form-item>
                            </el-col>
                        </el-row>

                        <!--第五行-->
                        <el-row>
                            <el-col>
                                <el-form-item>
                                    <span style="position:absolute;left: 70px;">预约他人：</span>
                                    <!-- <el-button type="primary"  size="mini" circle style="position:absolute;left: 140px;" ></el-button> -->
                                    <br>
                                    <el-button type="danger"  :disabled="deletePeople" size="mini" style="position:absolute;left: 70px;" >删除选定预约人</el-button>
                                    <br>
                                    <el-input  type="textarea" :rows="5" style="position:absolute;left: 70px;width: 20%"></el-input>
                                    <br>
                                    <br>
                                    <br>
                                </el-form-item>
                            </el-col>
                        </el-row>

                        <!--第六行-->
                        <el-row>
                            <el-col :span="8">
                                <el-form-item prop="ifPrivate">
                                    <span>是否公开：</span>
                                    <el-input style="width: 46%" v-model="this.schedule.ifPrivate"></el-input>
                                </el-form-item>
                            </el-col>
                            <el-col :span="8">
                                <el-form-item prop="createUser">
                                    <span>创建者：</span>
                                     <el-input style="width: 46%" v-model="this.schedule.createUser"></el-input>
                                </el-form-item>
                            </el-col>
                            <el-col :span="8">
                                <el-form-item prop="createTime">
                                    <span>创建日期：</span>
                                     <el-input style="width: 50%" v-model="this.schedule.createTime" ></el-input>
                                </el-form-item>
                            </el-col>
                        </el-row>

                        <!--第七行-->
                        <el-row>
                            <el-col :span="8">
                                <el-button type="primary"  :disabled="save">保存退出</el-button>
                            </el-col>
                            <el-col :span="8">
                            <el-button type="danger"  :disabled="deleteButton">删除</el-button>
                            </el-col>
                            <el-col :span="8">
                            <el-button type="info" @click="cancel()" >退出</el-button>
                            </el-col>
                        </el-row>
                    </el-form>
                </el-dialog>

            </div>
        </el-main>
    </el-container>
</template>

<!--逻辑-->
<script>
export default {
    data(){
        return {

            dateScope:[],//起始时间和结束时间
            schedules: [],
            schedulesInfo:[],
            test1:[],

            name:"",
            selectTime:"",
            startDate:"",
               
    //接收查询日期所在一周的日期
                    Sunday:"",
                    Monday:"",
                    Tuesday:"",
                    Wednesday:"",
                    Thursday:"",
                    Friday:"",
                    Saturday:"",
    
                
            show:false,
            message:{
                chineseName:'',
                branchName:'',
                departName:'',
            },


            //接收查询返回的信息
    
            branchNames:[],
            departNames:[],
            dateList:[],


            schedule: {
                address: '',
                meetingId: '',
                meetingName: '',
                title: '',
                startTime: '',
                endTime: '',
                schContent: '',
                ifPrivate: '',
                chineseName:'',

            },
            yyy:'',

            dialogScheduleVisible: false,
            dialogScheduleTitle: '我的日程安排',
            formLabelWidth: '120px',
             deleteButton: true,
             deletePeople:true,
             save:true,

              mySchedule: {
                meetingInfo: {
                    meetingId: '',
                    meetingName: ''
                },
                schedule: {
                    chineseName:'',
                    title: '',
                    address: '',
                    meetingId: '',
                    meetingName: '',
                    beginTime: '',
                    endTime: '',
                    schContent: '',
                    createUser: '',
                    createTime: '',
                    ifPrivate: '',
                    precontractUser: []
                },

                
            },

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
        Search(){
          
            var selectTime = ''
            var name = ''
            var datas = {
                "chineseName":"",
                "title":"",
                "schContent":"",

            }

            console.log("Enter Search Method.....")
            this.show = true;
            this.postRequest("/myschedule/departschedule" ,{
                // departId: this.$store.state.user.departId,
                name: this.name,
                selectTime: this.selectTime

            }).then(resp => {
               
                if (resp && resp.status == 200) 
                {
                    this.datas = resp.data.obj;
                    var data = resp.data.obj;
                    console.log("resp",resp);
                //    console.log("--------resp",resp.data.obj.scheduleList[2].title);
                
                //查询日期所在周
                    this.Sunday = data[0].dateList[0];
                    this.Monday = data[0].dateList[1];
                    this.Tuesday = data[0].dateList[2];
                    this.Wednesday = data[0].dateList[3];
                    this.Thursday = data[0].dateList[4];
                    this.Friday = data[0].dateList[5];
                    this.Saturday = data[0].dateList[6];
                //
                console.log(this.Tuesday)
                    
                }
        });
    },


    ifVisible(row){
      console.log(row)
        if(row == null)
        {
            return false;
            console.log("---if")
        }
        else{
            console.log("---else")
            return true;
        }
    },

     //获得当前时间，时间格式："2019-09-19 12:57:41"
        getCurrentDate() {
            var now = new Date();
            var year = now.getFullYear(); //得到年份
            var month = now.getMonth();//得到月份
            var date = now.getDate();//得到日期
            //var day = now.getDay();//得到周几
            var hour = now.getHours();//得到小时
            var minu = now.getMinutes();//得到分钟
            var sec = now.getSeconds();//得到秒
            month = month + 1;
            if (month < 10) month = "0" + month;
            if (date < 10) date = "0" + date;
            if (hour < 10) hour = "0" + hour;
            if (minu < 10) minu = "0" + minu;
            if (sec < 10) sec = "0" + sec;
            var time = "";
            //时间格式："2019-09-19 12:57:41"
            time = year + "-" + month + "-" + date+ " " + hour + ":" + minu + ":" + sec;
            return time;
        },


    cancel(){
        this.dialogScheduleVisible = false;
    },

    showDetail (scope){
        this.dialogScheduleVisible = true;
        console.log("---进入当前日程详情！")

        
       var schedule = {
               
                "title": "",
                "address":"",
                "meetingId":"",
                "meetingName":"",
                "beginTime":"",
                "endTime":"",
                "schContent":"",
                "chineseName":"",
                "ifPrivate":"",
                "createTime":"",
                "createUser":"",
                
            }
        this.schedule = scope;
        console.log("---scope.row:",this.schedule);
        this.schedule.title = scope.title;
        this.schedule.address = scope.address;
        this.schedule.beginTime = scope.beginTime;
        this.schedule.endTime = scope.endTime;
        this.schedule.schContent = scope.schContent;
        this.schedule.meetingId = scope.meetingId;
        this.schedule.createUser = scope.createUser;
        this.schedule.ifPrivate = scope.ifPrivate;
        this.schedule.createTime = scope.createTime;
        this.schedule.meetingName = scope.meetingName;
        console.log("---ifPrivate(0/1):",this.schedule.ifPrivate);
       

        if(this.schedule.ifPrivate == 0)
        {
            this.schedule.ifPrivate = "公开"
        }
        if(this.schedule.ifPrivate == 1)
        {
            this.schedule.ifPrivate = "不公开"
        }

        console.log("---该条日程详情：",this.schedule)
        console.log("---ifPrivate（公开/不公开）:",this.schedule.ifPrivate);
        console.log("---title传过来了吗？",this.schedule.title)
        
    },





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
            console.log("已获得的部门信息：",this.departNames);
            console.log("this.departNames：",this.departNames);  
        })
         },


    
}
}
</script>

<!--样式-->
<style scoped>
    .header{
        font-size:20px;text-align: center;
    }
</style>