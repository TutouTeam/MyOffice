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
                        <p :class="data.isSelected ? 'is-selected' : ''" @click="dialogScheduleVisible = true">
                            {{ data.day.split('-').slice(1).join('-') }} {{ data.isSelected ? '✔️' : ''}}
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
                                    <el-input placeholder="请输入主题" style="width: 73%" v-model="schedule.title"></el-input>
                                </el-form-item>
                            </el-col>
                        </el-row>

                        <!--第二行-->
                        <el-row>
                            <el-col :span="12">
                                <el-form-item prop="address">
                                    <span>地点：</span>
                                    <el-input placeholder="请输入地点" style="width: 46%" v-model="schedule.address"></el-input>
                                </el-form-item>
                            </el-col>
                            <el-col :span="12">
                                <el-form-item prop="meetingId">
                                    <span>会议类型：</span>
                                    <el-select style="width: 38%" v-model="schedule.meetingId" clearable>
                                        <el-option v-for="item in meetings" :key="item.id" :label="item.name" :value="item.name">
                                        </el-option>
                                    </el-select>
                                </el-form-item>
                            </el-col>
                        </el-row>

                        <!--第三行-->
                        <el-row>
                            <el-col :span="12">
                                <el-form-item prop="stratTime">
                                    <span>开始时间：</span>
                                    <el-input type="date" placeholder="请选择开始时间" style="width: 40%" v-model="schedule.startTime"></el-input>
                                </el-form-item>
                            </el-col>
                            <el-col :span="12">
                                <el-form-item prop="endTime">
                                    <span>结束时间：</span>
                                    <el-input type="date" placeholder="请选择结束时间" style="width: 40%" v-model="schedule.endTime"></el-input>
                                </el-form-item>
                            </el-col>
                        </el-row>

                        <!--第四行-->
                        <el-row>
                            <el-col>
                                <el-form-item prop="schContent">
                                    <span style="position:absolute;left: 70px;">日程内容：</span><br>
                                    <el-input placeholder="请输入日程内容" type="textarea" :rows="10" style="width: 80%" v-model="schedule.schContent"></el-input>
                                </el-form-item>
                            </el-col>
                        </el-row>

                        <!--第五行-->
                        <el-row>
                            <el-col>
                                <el-form-item>
                                    <span style="position:absolute;left: 70px;">预约他人：</span>
                                    <el-button type="primary" icon="el-icon-edit" size="mini" circle style="position:absolute;left: 140px;" @click="reserve()"></el-button>
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
                                    <el-checkbox v-model="schedule.ifPrivate">是否公开</el-checkbox>
                                </el-form-item>
                            </el-col>
                            <el-col :span="8">
                                <el-form-item>
                                    <span>创建者：{{schedule.createUser}}</span>
                                </el-form-item>
                            </el-col>
                            <el-col :span="8">
                                <el-form-item>
                                    <span>创建日期：{{schedule.createTime}}</span>
                                </el-form-item>
                            </el-col>
                        </el-row>

                        <!--第七行-->
                        <el-row>
                            <el-col :span="8">
                                <el-button type="primary" @click="addSchedule()">保存退出</el-button>
                            </el-col>
                            <el-col :span="8">
                            <el-button type="danger" @click="deleteSchedule()">删除</el-button>
                            </el-col>
                            <el-col :span="8">
                            <el-button type="info" @click="cancel()">退出</el-button>
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
            schedule: {
                address: '',
                meetingId: '',
                title: '',
                startTime: '',
                endTime: '',
                radio: '1',
                schContent: '',
                ifprivate: ''
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
        }
    },

    //功能函数
    methods:{
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
            this.postRequest('/myschedule/listallschedule/{userName}', {
                createUser: this.$store.state.user.userName
            }).then(resp => {
                if (resp && resp.data.status === 200) {
                    _this.schedules = resp.data.obj.myScheduleVos
                    for (let schedule of _this.schedules) {
                        var generalize = '@' + (schedule.beginTime).toString().slice(11, 16) + ' ' + schedule.title.slice(0, 3) + '...'
                        schedule.generalize = generalize
                    }
                }
            })
        },
        showDaySchedule(day) {
            var daySchedule = []
            for (var i of this.schedules) {
                var begin = (i.beginTime).toString().slice(0, 10)
                if (day === begin) {
                    daySchedule.push(i)
                }
            }
            if (daySchedule.length > 0) {
                return daySchedule
            }
        },
        showScheduleDetail(item) {
            this.dialogScheduleVisible = true
            this.schedule.scheduleId = item.scheduleId
            this.schedule.title = item.title
            this.schedule.address = item.address
            this.schedule.meetingId = item.meetingId
            this.schedule.beginTime = item.beginTime
            this.schedule.endTime = item.endTime
            this.schedule.schContent = item.schContent
            this.schedule.ifPrivate = item.ifPrivate
            this.schedule.createUser = item.createUser
            this.schedule.createTime = item.createTime
            this.deleteButton = false
        },
        //添加日程
        addSchedule() {
            var _this = this
            this.dialogScheduleVisible = false
            this.$refs['schedule'].validate((valid) => {
                if (valid) {
                    if (this.schedule.ifPrivate) {
                        this.schedule.ifPrivate = 1
                    } else {
                        this.schedule.ifPrivate = 0
                    }
                    if (this.schedule.scheduleId) {
                        this.postRequest('/schedule/myschedule/updateSchedule', this.schedule).then(resp => {
                            if (resp && resp.status === 200) {
                                _this.emptyScheduleForm()
                                _this.loadScheduleInfo()
                            }
                        })
                    } else { 
                        this.postRequest('/schedule/myschedule/insertSchedule', this.schedule).then(resp => {
                            if (resp && resp.status === 200) {
                                _this.emptySchedule()
                                _this.loadScheduleInfo()
                            }
                        })
                    }
                } else {
                    return false
                }
            })
        },

        //删除日程
        deleteSchedule() {
            this.$confirm('此操作将永久删除[' + this.schedule.title + ']的日程是否继续?', '提示', {
                confirmButtonText: '确定',
                cancelButtonText: '取消',
                type: 'warning'
            }).then(() => {
                this.postRequest('/schedule/myschedule/delteScheduleByScheduleId/{scheduleId}', {
                    scheduleId: this.schedule.scheduleId
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