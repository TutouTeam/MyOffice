<!--内容-->
<template>
    <!--外层容器-->
    <el-container>
        <!--顶栏容器-->
        <el-header>
            <!--标题-->
            <div>
                <el-header class="header">
                    添加我的日程界面
                    <hr width="300px" color="#20a0ff">
                </el-header>
            </div>    
        </el-header>

        <!--主要区域容器-->
        <el-main>
            <div>
                <!--表单-->
                <el-form :model="schedule"> 
                    <!--利用<el-row>和<el-col>进行布局-->
                    <!--第一行-->
                    <el-row>
                        <el-col :span="24">
                            <el-form-item prop="title">
                                <span style="position:absolute;left: 125px;">主题：</span>
                                <el-input placeholder="请输入主题" style="width: 73%" v-model="schedule.title"></el-input>
                            </el-form-item>
                        </el-col>
                    </el-row>

                    <!--第二行-->
                    <el-row>
                        <el-col :span="12">
                            <el-form-item prop="address">
                                <span style="position:absolute;left: 125px;">地点：</span>
                                <el-input placeholder="请输入地点" style="width: 46%" v-model="schedule.address"></el-input>
                            </el-form-item>
                        </el-col>
                        <el-col :span="12">
                            <el-form-item prop="meetingId">
                                <span>会议类型：</span>
                                <el-select style="width: 50%" v-model="schedule.meetingId" clearable>
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
                                <span style="position:absolute;left: 125px;">开始时间：</span>
                                <el-input type="date" placeholder="请选择开始时间" style="width: 37%" v-model="schedule.startTime"></el-input>
                            </el-form-item>
                        </el-col>
                        <el-col :span="12">
                            <el-form-item prop="endTime">
                                <span>结束时间：</span>
                                <el-input type="date" placeholder="请选择结束时间" style="width: 37%" v-model="schedule.endTime"></el-input>
                            </el-form-item>
                        </el-col>
                    </el-row>

                    <!--第四行-->
                    <el-row>
                        <el-col>
                            <el-form-item prop="schContent">
                                <span style="position:absolute;left: 125px;">日程内容：</span><br>
                                <el-input placeholder="请输入日程内容" type="textarea" :rows="10" style="width: 80%" v-model="schedule.schContent"></el-input>
                            </el-form-item>
                        </el-col>
                    </el-row>

                    <!--第五行-->
                    <el-row>
                        <el-col>
                            <el-form-item>
                                <span style="position:absolute;left: 125px;">预约他人：</span>
                                <el-button type="primary" icon="el-icon-edit" size="mini" circle style="position:absolute;left: 200px;" @click="reserve()">预约他人></el-button>
                                <br>
                                <el-button type="danger" size="mini" style="position:absolute;left: 125px;">删除选定预约人</el-button>
                                <br>
                                <el-input placeholder="请选择预约人" type="textarea" :rows="5" style="position:absolute;left: 125px;width: 20%"></el-input>
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
            </div>
        </el-main>
    </el-container>
</template>

<!--逻辑-->
<script>
export default {
    
}
</script>

<!--样式-->
<style scoped>
    #header{
        font-size:20px;
    }
</style>