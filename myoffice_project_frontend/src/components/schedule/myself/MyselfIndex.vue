<!--内容-->
<template>
    <!--外层容器-->
    <el-container>
        <!--顶栏容器-->
        <el-header>
            <!--标题-->
            <div>
                <el-header class="header">
                    我的日程主界面
                    <hr width="300px" color="#20a0ff">
                </el-header>
            </div>
        </el-header>

        <!--主要区域容器-->
        <el-main>
           
            <div>
                <!--日历结构-->
                <el-calendar>
                    <template slot="dateCell" slot-scope="{date, data}">
                        <p :class="data.isSelected ? 'is-selected' : ''"  @click="showScheduleDetail(data.day)">
                            {{ data.day.split('-').slice(1).join('-') }} {{ data.isSelected ? '✔️' : ''}}
                            <br>
                            {{showDaySchedule(data.day)}}
                        </p>
                    </template>
                </el-calendar>

                <!--添加我的日程详情-->
                <el-dialog :title="dialogScheduleTitle" :visible.sync="dialogScheduleVisible">
                    <!--表单-->
                    <el-form :model="schedule"> 
                        <!--利用<el-row>和<el-col>进行布局-->
                        <!--第一行-->
                        <el-row>
                            <el-col :span="24">
                                <el-form-item prop="title">
                                    <span>主题：</span>
                                    <el-input placeholder="请输入主题" style="width: 73%" v-model="mySchedule.schedule.title"></el-input>
                                </el-form-item>
                            </el-col>
                        </el-row>

                        <!--第二行-->
                        <el-row>
                            <el-col :span="12">
                                <el-form-item prop="address">
                                    <span>地点：</span>
                                    <el-input placeholder="请输入地点" style="width: 46%" v-model="mySchedule.schedule.address"></el-input>
                                </el-form-item>
                            </el-col>
                            <el-col :span="12">
                                <el-form-item prop="meetingName">
                                    <span>会议类型：</span>
                                    <el-select style="width: 38%" v-model="mySchedule.meetingInfo.meetingName" clearable>
                                        <el-option v-for="item in meetings" :key="item.id" :label="item.name" :value="item.name">
                                        </el-option>
                                    </el-select>
                                </el-form-item>
                            </el-col>
                        </el-row>

                        <!--第三行-->
                        <el-row>
                            <!--<el-col :span="12">
                                <el-form-item prop="stratTime">
                                    <span>开始时间：</span>
                                    <el-input type="date" placeholder="请选择开始时间" style="width: 40%" v-model="mySchedule.schedule.startTime"></el-input>
                                </el-form-item>
                            </el-col>
                            <el-col :span="12">
                                <el-form-item prop="endTime">
                                    <span>结束时间：</span>
                                    <el-input type="date" placeholder="请选择结束时间" style="width: 40%" v-model="mySchedule.schedule.endTime"></el-input>
                                </el-form-item>
                            </el-col>-->
                            <el-col :span="24">
                                请选择日程的时间范围:
                                <el-date-picker
                                    v-model="dateScope"
                                    type="datetimerange"
                                    align="right"
                                    unlink-panels
                                    range-separator="至"
                                    start-placeholder="开始时间"
                                    end-placeholder="结束时间"
                                    value-format="yyyy-MM-dd HH:mm:ss"
                                    :picker-options="pickerOptions">
                                </el-date-picker>
                            </el-col>
                        </el-row>

                        <!--第四行-->
                        <el-row>
                            <el-col>
                                <el-form-item prop="schContent">
                                    <span style="position:absolute;left: 70px;">日程内容：</span><br>
                                    <el-input placeholder="请输入日程内容" type="textarea" :rows="10" style="width: 80%" v-model="mySchedule.schedule.schContent"></el-input>
                                </el-form-item>
                            </el-col>
                        </el-row>

                        <!--第五行-->
                        <el-row>
                            <el-col>
                                <el-form-item>
                                    <span style="position:absolute;left: 70px;">预约他人：</span>
                                    <el-button type="primary" icon="el-icon-edit" size="mini" circle style="position:absolute;left: 140px;" @click="reserve"></el-button>
                                    <br>
                                    <el-button type="danger" size="mini" style="position:absolute;left: 70px;">删除选定预约人</el-button>
                                    <br>
                                    <el-input placeholder="请选择预约人" type="textarea" :rows="5" style="position:absolute;left: 70px;width: 20%"></el-input>
                                    <br>
                                    <br>
                                    <br>
                                </el-form-item>
                            </el-col>
                        </el-row>

                        <!--第六行-->
                        <el-row>
                            <el-col :span="8">
                                <el-form-item label="选项" :label-width="formLabelWidth">
                                    <el-checkbox v-model="mySchedule.schedule.ifPrivate">是否公开</el-checkbox>
                                </el-form-item>
                            </el-col>
                            <el-col :span="8">
                                <el-form-item>
                                    <span>创建者：{{this.$store.state.user.username}}</span>
                                </el-form-item>
                            </el-col>
                            <el-col :span="8">
                                <el-form-item>
                                    <span>创建日期：{{getCurrentDate()}}</span>
                                </el-form-item>
                            </el-col>
                        </el-row>

                        <!--第七行-->
                        <el-row>
                            <el-col :span="8">
                                <el-button type="primary" @click="addSchedule">保存退出</el-button>
                            </el-col>
                            <el-col :span="8">
                            <el-button type="danger" @click="deleteSchedule" :disabled="deleteButton">删除</el-button>
                            </el-col>
                            <el-col :span="8">
                            <el-button type="info" @click="cancel">退出</el-button>
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
    //数据定义
    data() {
        return {
            dateScope:[],//起始时间和结束时间
            schedules: [],
            schedulesInfo:[],
            schedule: {
                address: '',
                meetingId: '',
                meetingName: '',
                title: '',
                startTime: '',
                endTime: '',
                //radio: '1',
                schContent: '',
                ifprivate: '',
            },
            mySchedule: {
                meetingInfo: {
                    meetingId: '',
                    meetingName: ''
                },
                schedule: {
                    //scheduleId: '',
                    title: '',
                    address: '',
                    meetingId: '',
                    beginTime: '',
                    endTime: '',
                    schContent: '',
                    createUser: '',
                    createTime: '',
                    ifPrivate: '',
                    precontractUser: []
                },
                
            },
            reserveMessage: {
                userId: '',
                userName: '',
                departName: '',
                branchName: '',
            },
            meetings: [
                {
                    id: 1,
                    name: '公司年会'
                },
                {
                    id: 2,
                    name: '机构会议'
                },
                {
                    id: 3,
                    name: '部门会议'
                },
                {
                    id: 4,
                    name: '小组会议'
                },
                {
                    id: 5,
                    name: '外部合作会议'
                },
            ],
            formLabelWidth: '120px',
            dialogScheduleVisible: false,
            dialogScheduleTitle: '我的日程安排',
            deleteButton: true
        }
    },

    //生命周期函数钩子
    mounted() {
      this.loadScheduleInfo()
    },

    //功能函数
    methods:{
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

        //获得所有会议信息
        getAllMeethingInfo() {
            var _this = this
            this.postRequest('/listMeetingInfo', {}).then(resp => {
                if (resp && resp.data.status === 200) {
                    _this.meetings = resp.data.obj.meetingInfoVos
                }
            })
        },

        //加载日程安排信息
        loadScheduleInfo() {
            var _this = this
            var userName = this.$store.state.user.username
            //{createUser: this.$store.state.user.userName}
            this.getRequest('/myschedule/listallschedule/'+userName).then(resp => {
                if (resp && resp.data.status === 200) {
                    console.log("testLoad",resp)
                    _this.schedules = resp.data.obj
                    for (let schedule of _this.schedules) {
                        //schedule的generalize的格式：@13:30 会议标题...
                        var generalize = '@' + (schedule.beginTime).toString().slice(11, 16) + ' ' + schedule.title.slice(0, 3) + '...'
                        schedule.generalize = generalize
                    }
                }
            })
        },

        //根据日程开始时间判断是否能显示在日历表上
        showDaySchedule(day) {
            var daySchedule = []
            for (var i of this.schedules) {
                var begin = (i.beginTime).toString().slice(0, 10)
                if (day === begin) {
                    daySchedule.push(i.generalize)
                }
            }
            if (daySchedule.length > 0) {
                return daySchedule
            }
        },

        //根据会议名称找到会议Id
        findMeetingIdByMeetingName(meetingName){
            //便利meetings数组
            for (var i of this.meetings){
                if(meetingName === i.name){
                    return i.id
                    break
                }
            }
        },

        //显示日程表详情信息
        showScheduleDetail(day) {
            this.dialogScheduleVisible = true
            //console.log("test1",this.schedules);
            //var item = []
            for (var i of this.schedules) {
                var begin = (i.beginTime).toString().slice(0, 10)
                
                if (day === begin) {//有日程,向服务器发送请求获取该日程的详细信息
                    var _this = this
                    var scheduleId = i.scheduleId
                    this.getRequest('/myschedule/listmyschedule/'+scheduleId).then(resp => {
                        if (resp && resp.data.status === 200) {
                            console.log("testLoadScheduleDetial",resp)
                            _this.schedulesInfo = resp.data.obj
                            //item.push(i) //把i的数据放进item
                            //console.log("test2",item)
                            
                            this.dateScope.push(new Date(_this.schedulesInfo.schedule.beginTime))
                            this.dateScope.push(new Date(_this.schedulesInfo.schedule.endTime))
                            //console.log("dateScop[0]",this.dateScope)

                            this.mySchedule.schedule.scheduleId = _this.schedulesInfo.schedule.scheduleId
                            this.mySchedule.schedule.title = _this.schedulesInfo.schedule.title
                            this.mySchedule.schedule.address = _this.schedulesInfo.schedule.address
                            this.mySchedule.schedule.meetingId = _this.schedulesInfo.schedule.meetingId
                            this.mySchedule.meetingInfo.meetingName = _this.schedulesInfo.meetingInfo.meetingName
                            this.mySchedule.schedule.beginTime = _this.schedulesInfo.schedule.beginTime
                            this.mySchedule.schedule.endTime = _this.schedulesInfo.schedule.endTime
                            this.mySchedule.schedule.schContent = _this.schedulesInfo.schedule.schContent
                            this.mySchedule.schedule.ifPrivate = _this.schedulesInfo.schedule.ifPrivate
                            this.mySchedule.schedule.createUser = _this.schedulesInfo.schedule.createUser
                            this.mySchedule.schedule.createTime = _this.schedulesInfo.schedule.createTime
                            this.deleteButton = false //删除按钮可用
                        }
                    })
                    
                    break
                }
                
            }
            if(i === null) {//无日程
                emptySchedule();
                //this.deleteButton = true //删除按钮不可用
            }
            
        },

        //清空日程详情信息
        emptySchedule(){
            this.schedule.scheduleId = ""
            this.schedule.title = ""
            this.schedule.address = ""
            this.schedule.meetingId = ""
            this.schedule.beginTime = ""
            this.schedule.endTime = ""
            this.schedule.schContent = ""
            this.schedule.ifPrivate = ""
            this.schedule.createUser = ""
            this.schedule.createTime = ""

            this.mySchedule.schedule.scheduleId = ""
            this.mySchedule.schedule.title = ""
            this.mySchedule.schedule.address = ""
            this.mySchedule.schedule.meetingId = ""
            this.mySchedule.schedule.beginTime = ""
            this.mySchedule.schedule.endTime = ""
            this.mySchedule.schedule.schContent = ""
            this.mySchedule.schedule.ifPrivate = ""
            this.mySchedule.schedule.createUser = ""
            this.mySchedule.schedule.createTime = ""

            this.mySchedule.meetingInfo.meetingId = ""
            this.mySchedule.meetingInfo.meetingName = ""

            for(;this.dateScope.length>0;){
                this.dateScope.pop()
            }

            this.deleteButton = true
        },

        //添加日程
        addSchedule() {
            var _this = this
            this.dialogScheduleVisible = false
            this.mySchedule.schedule.createUser = this.$store.state.user.username
            this.mySchedule.schedule.createTime = _this.getCurrentDate()
            this.mySchedule.schedule.meetingId = _this.findMeetingIdByMeetingName(this.mySchedule.meetingInfo.meetingName)
            this.mySchedule.meetingInfo.meetingId = _this.findMeetingIdByMeetingName(this.mySchedule.meetingInfo.meetingName)
            this.mySchedule.schedule.precontractUser.push("傻子婷");

            if (this.mySchedule.schedule.ifPrivate) {
                this.mySchedule.schedule.ifPrivate = 1
            } else {
                this.mySchedule.schedule.ifPrivate = 0
            }
            if (this.mySchedule.schedule.scheduleId) {
                this.postRequest('/myschedule/editmyschedule', this.mySchedule.schedule).then(resp => {
                    if (resp && resp.status === 200) {
                        _this.emptySchedule()
                        _this.loadScheduleInfo()
                    }
                })
            } else { 
                this.mySchedule.schedule.beginTime = this.dateScope[0]
                this.mySchedule.schedule.endTime = this.dateScope[1]
                //this.mySchedule.schedule.createTime = getCurrentDate()
                console.log("testAddSchedule",this.mySchedule.schedule)
                this.postRequest('/myschedule/addmyschedule', this.mySchedule.schedule).then(resp => {
                    if (resp && resp.status === 200) {
                        _this.emptySchedule()
                        _this.loadScheduleInfo()
                    }
                })
            }
        },

        //删除日程
        deleteSchedule() {
            this.$confirm('此操作将永久删除[' + this.mySchedule.schedule.title + ']的日程是否继续?', '提示', {
                confirmButtonText: '确定',
                cancelButtonText: '取消',
                type: 'warning'
            }).then(() => {
                this.postRequest('/myschedule/deletemyschedule', {
                    scheduleId: this.mySchedule.schedule.scheduleId
                }).then(resp => {
                    if (resp && resp.status === 200) {
                        this.$message({
                            type: 'success',
                            message: '删除成功!'
                        })
                        this.dialogScheduleVisible = false
                        this.loadScheduleInfo()
                    }
                })
            }).catch(() => {})
        },

        //退出
        cancel() {
            this.dialogScheduleVisible = false
            this.emptySchedule()    
        },
    },

    //计算属性
    computed: {
        user() {
            return this.$store.state.user
        },
    }
}
</script>

<!--样式-->
<style scoped>
    .header{
        font-size:20px;text-align: center;
    }

    <!--选择日历的时候会变色-->
    .is-selected {
        color: #1989FA;
    }
</style>