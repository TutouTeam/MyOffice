<!--内容-->
<template>
    <!--外层容器-->
    <el-container>
        <!--顶栏容器-->
        <el-header>
            <!--标题-->
            <div>
                <el-header class="header">
                    消息管理主界面
                    <hr width="300px" color="#20a0ff">
                </el-header>
            </div>
        </el-header>

        <!--主要区域容器-->
        <el-main>
            <!--搜索范围表单-->
            <el-form :inline="true" :model="WriteTime" class="demo-form-inline" style="margin:20px auto">
                <!--<el-form-item label="开始时间">
                    <el-date-picker v-model="WriteTime.start" type="date" placeholder="请选择开始日期"></el-date-picker>
                </el-form-item>
                <span>_ _ _ _ _</span>
                <el-form-item label="结束时间">
                    <el-date-picker v-model="WriteTime.end" type="date" placeholder="请选择结束日期"></el-date-picker>
                </el-form-item>-->
                <el-form-item label="请选择时间搜索范围：">
                    <el-date-picker
                        v-model="WriteTime.dateScope"
                        type="datetimerange"
                        align="right"
                        unlink-panels
                        range-separator="至"
                        start-placeholder="开始时间"
                        end-placeholder="结束时间"
                        value-format="yyyy-MM-dd HH:mm:ss"
                        :picker-options="pickerOptions">
                    </el-date-picker>
                </el-form-item>

                <el-form-item>
                    <el-radio-group v-model="WriteTime.limit">
                        <el-radio :label="1">本日</el-radio>
                        <el-radio :label="2">本周</el-radio>
                        <el-radio :label="3">本月</el-radio>
                    </el-radio-group>
                </el-form-item>
                <el-form-item>
                    <el-button type="primary" size="mini" @click="searchMessage"><i class="el-icon-search"></i>搜索</el-button>
                </el-form-item>
            </el-form>

            <hr>

            <!--添加消息按钮-->
            <p>
                <el-button type="primary" @click="dialogMessageFormVisible = true" class="el-icon-circle-plus" size="middle">添加新消息</el-button>
            </p>

            <!--搜索结果表格-->
            <el-table :data="message" border style="width: 95%;margin:0 auto" size="mini" :header-cell-style="{background:'#eef1f6',color:'#606266'}">
                <el-table-column prop="messageTitle" label="消息标题" width="180px" align="center" fixed="left"></el-table-column>

                <el-table-column prop="messageTypeName" label="消息类型" width="180px" align="center"></el-table-column>

                <el-table-column prop="messageContent" label="消息内容" width="180px" align="center">
                    <template slot-scope="scope">
                        <span @click="showContentDetail(scope.row)">{{scope.row.messageContent}}</span>
                    </template>
                </el-table-column>

                <el-table-column prop="createUserName" label="创建者" width="180px" align="center"></el-table-column>

                <el-table-column prop="recipients" label="发送对象" width="180px" align="center">
                    <template slot-scope="scope">
                        <!--<span @click="showToUserId(scope.row)">{{scope.row.chineseName}}</span>-->
                        <i class="el-icon-user" @click="showToUserId(scope.row)"></i>
                    </template>
                </el-table-column>

                <el-table-column prop="beginTime" label="开始时间" width="180px" align="center"></el-table-column>

                <el-table-column prop="endTime" label="结束时间" width="180px" align="center"></el-table-column>

                <el-table-column prop="createTime" label="创建时间" width="180px" align="center"></el-table-column>

                <el-table-column label="修改" align="center" fixed="right">
                    <template slot-scope="scope">
                        <i class="el-icon-edit" @click="editMessage(scope.row)"></i>
                    </template>
                </el-table-column>

                <el-table-column label="删除" align="center" fixed="right">
                    <template slot-scope="scope">
                        <i class="el-icon-close colorRed" @click="deleteMessage(scope.row)"></i>
                    </template>
                </el-table-column>

                <el-table-column label="发布" align="center" width="100px" fixed="right">
                    <template slot-scope="scope">
                        <el-button @click="pulish(scope.row)" :disabled="ifPublish(scope.row)" type="primary" size="mini">发 布</el-button>
                    </template>
                </el-table-column>

            </el-table>

            <!-- 点击表格消息内容字段，显示消息基本内容的弹窗 -->
            <el-dialog title="该消息的基本内容" :visible.sync="dialogMessageVisible">
                <el-form :model="basicContent" ref="basicContent">
                    <el-form-item>
                        <el-input type="textarea" v-model="basicContent.content" autocomplete="off"></el-input>
                    </el-form-item>
                </el-form>
                <div slot="footer" class="dialog-footer" align="center">
                    <el-button @click="dialogMessageVisible = false" type="danger">退 出</el-button>
                </div>
            </el-dialog>

            <!-- 点击表格发送对象字段，显示发送对象的弹窗 -->
            <el-dialog title="消息的发送对象" :visible.sync="dialogToUserVisible">
                <el-form :model="basicContent" ref="basicContent">
                    <el-form-item>
                        <el-input type="textarea" v-model="basicContent.chineseName" autocomplete="off"></el-input>
                    </el-form-item>
                </el-form>
                <div slot="footer" class="dialog-footer" align="center">
                    <el-button @click="leave" type="danger">退 出</el-button>
                </div>
            </el-dialog>

            <!--点击添加新消息按钮，显示消息添加/修改的弹窗-->
            <el-dialog title="消息填写" :visible.sync="dialogMessageFormVisible">
                <el-form :model="messageInfoForm">
                    <!--第一行-->
                    <el-row>
                        <el-col :span="12">
                            <el-form-item label="消息标题" :label-width="formLabelWidth">
                                <el-input v-model="messageInfoForm.title" autocomplete="off" placeholder="请输入消息标题" style="width:100%"></el-input>
                            </el-form-item>
                        </el-col>
                    </el-row>

                    <!--第二行-->
                    <el-row>
                        <el-col :span="12">
                            <el-form-item label="消息类型" :label-width="formLabelWidth">
                                <el-select v-model="messageInfoForm.type" placeholder="请选择消息类型" style="width:100%">
                                    <el-option label="一般消息" value=1></el-option>
                                    <el-option label="紧急消息" value=2></el-option>
                                </el-select>
                            </el-form-item>
                        </el-col>
                    </el-row>

                    <!--第三行<el-row>
                        <el-col :span="12">
                            <el-form-item label="开始时间" :label-width="formLabelWidth">
                                <el-date-picker v-model="messageInfoForm.startTime" type="datetime" placeholder="请选择开始时间" style="width:100%"></el-date-picker>
                            </el-form-item>
                        </el-col>
                    </el-row>-->
                    
                    
                    <!--第四行<el-row>
                        <el-col :span="12">
                            <el-form-item label="结束时间" :label-width="formLabelWidth">
                                <el-date-picker v-model="messageInfoForm.endTime" type="datetime" placeholder="请选择结束时间" style="width:100%"></el-date-picker>
                            </el-form-item>
                        </el-col>
                    </el-row>-->

                    <!--第三、四行-->
                    <el-row>
                        <el-col :span="12">
                            <el-form-item label="请选择时间搜索范围：">
                                <el-date-picker
                                    v-model="messageInfoForm.dateScope"
                                    type="datetimerange"
                                    align="right"
                                    unlink-panels
                                    range-separator="至"
                                    start-placeholder="开始时间"
                                    end-placeholder="结束时间"
                                    value-format="yyyy-MM-dd HH:mm:ss"
                                    :picker-options="pickerOptions">
                                </el-date-picker>
                            </el-form-item>
                        </el-col>
                    </el-row>
                    

                    <!--第五行-->
                    <el-row>
                        <el-col :span="12">
                            <el-form-item label="发送对象" :label-width="formLabelWidth">
                                <!--messageInfoForm.toUserId和label的值是对应的，事件监听根据change函数进行控制-->
                                <el-radio-group v-model="messageInfoForm.toUserId" @change="toUserChange">
                                    <el-radio label="1" :disabled="toUserIdButton">所有人</el-radio>
                                    <el-radio label="2" :disabled="toUserIdButton">选择特定对象</el-radio>
                                </el-radio-group>
                            </el-form-item>
                        </el-col>
                    </el-row>

                    <!--第六行-->
                    <!-- 筛选特定对象信息的表单 -->
                    <el-row v-if="showRange">
                        <fieldset>
                            <legend align="left"><i class="el-icon-search"></i>筛选范围</legend>
                            <el-form>
                                <!--第一行-->
                                <el-row>
                                    <el-col :span="3">
                                        <el-form-item>
                                            <el-checkbox v-model="checkedByBranch" @change="showScreenRange()">按机构</el-checkbox>
                                        </el-form-item>
                                    </el-col>
                                    <el-col :span="3">
                                        <el-form-item>
                                            <el-checkbox v-model="checkedByDepart" @change="showScreenRange()">按部门</el-checkbox>
                                        </el-form-item>
                                    </el-col>
                                    <el-col :span="3">
                                        <el-form-item>
                                            <el-checkbox v-model="checkedByUserId" @change="showScreenRange()">按员工号</el-checkbox>
                                        </el-form-item>
                                    </el-col>
                                    <el-col :span="3">
                                        <el-form-item>
                                            <el-checkbox v-model="checkedByUserName" @change="showScreenRange()">按姓名</el-checkbox>
                                        </el-form-item>
                                    </el-col>
                                </el-row>

                                <!--第二行-->
                                <el-row>
                                    <el-col :span="6">
                                        <el-form-item label="机构" label-width="50px">
                                            <el-select v-model="branchName" placeholder="请选择机构" :disabled="ifSelectBranch" @change="getBranch">
                                                <el-option 
                                                    v-for="item in branchs" 
                                                    :key="item.branchId" 
                                                    :label="item.branchName" 
                                                    :value="item.branchName">
                                                </el-option>
                                            </el-select>
                                        </el-form-item>
                                    </el-col>
                                    <el-col :span="6">
                                        <el-form-item label="部门" label-width="50px">
                                            <el-select v-model="departName" placeholder="请选择部门" :disabled="ifSelectDepart" @change="getDepart">
                                                <el-option 
                                                    v-for="item in branchSubDepart" 
                                                    :key="item.departId" 
                                                    :label="item.departName" 
                                                    :value="item.departName">
                                                </el-option>
                                            </el-select>
                                        </el-form-item>
                                    </el-col>
                                    <el-col :span="6">
                                        <el-form-item label="员工号" label-width="70px">
                                            <el-input v-model="selectUserId" placeholder="请输入员工号" :disabled="ifInputUserId"></el-input>
                                        </el-form-item>
                                    </el-col>
                                    <el-col :span="6">
                                        <el-form-item label="姓名" label-width="50px">
                                            <el-input v-model="selectUserName" placeholder="请输入姓名" :disabled="ifInputUserName"></el-input>
                                        </el-form-item>
                                    </el-col>
                                </el-row>
                                
                                <!--第三行-->
                                <el-row>
                                    <el-button type="primary" @click="getUser">确定选择范围</el-button>
                                </el-row>
                            </el-form>
                        </fieldset>
                    </el-row>

                    <!--第七行-->
                    <el-row>
                        <fieldset v-if="showUser">
                            <legend align="left"><i class="el-icon-user"></i>请选择发送对象</legend>
                            <el-form>
                                <!--第一行-->
                                <el-row>
                                    <template>
                                        <el-checkbox :indeterminate="isIndeterminate" v-model="checkAll" @change="handleCheckAllChange">全选</el-checkbox>
                                        <div style="margin: 15px 0;"></div>
                                        <el-checkbox-group v-model="checkedUsers" @change="handleCheckedUsersChange">
                                            <el-checkbox v-for="user in userOptions" :label="user" :key="user.userId">{{user.chineseName}}</el-checkbox>
                                        </el-checkbox-group>
                                    </template>
                                </el-row>
                            </el-form>
                        </fieldset>
                    </el-row>

                    <!--第八行-->
                    <el-row>
                        <el-col>
                            <el-form-item label="消息内容" :label-width="formLabelWidth">
                                <el-input type="textarea" v-model="messageInfoForm.content" autocomplete="off" placeholder="请填写消息内容" style="width:100%"></el-input>
                            </el-form-item>
                        </el-col>
                    </el-row>
                </el-form>

                <div slot="footer" class="dialog-footer" style="text-align:center">
                    <el-button type="primary" @click="addOrUpdateMessage">保存消息</el-button>
                    <el-button @click="cancel()">返 回</el-button>
                </div>
            </el-dialog>  
        </el-main>
    </el-container>
</template>

<!--逻辑-->
<script>
export default {
    //数据定义
    data() {
        return {
            
            WriteTime: {
                dateScope: [],
                limit: ''
            },

            message: [],

            basicContent: {
                content: '',
                toUserId: [],
                chineseName: []
            },

            dialogMessageVisible: false,
            dialogToUserVisible: false,
            dialogMessageFormVisible: false,

            messageInfoForm: {
                messageId: null,
                title: '',
                type: '',
                //startTime: '',
                //endTime: '',
                dateScope: [],
                toUserIds: [],
                content: ''
            },

            toUserIdButton: false,
            showRange: false,//范围选择模块是否显示的标志
            showUser: false,//人员名单是否显示的标志

            checkedByBranch: '',
            checkedByDepart: '',
            checkedByUserId: '',
            checkedByUserName: '',

            selectBranchId: '',
            ifSelectBranch: '',

            selectDepartId: '',
            ifSelectDepart: '',

            selectUserId: '',
            ifInputUserId: '',

            selectUserName: '',
            ifInputUserName: '',

            pulishButton: false,

            branchs: [],
            branchSubDepart: [],

            branchName:'',
            departName:'',

            userDatas: [],
            userOptions: [],
            checkAll: false,
            checkedUsers: [],
            users: [],
            isIndeterminate: true,

        }
    },

    //生命周期函数钩子
    created(){
        this.getBranch()
    },

    //生命周期函数钩子
    mounted() {
      //this.loadMessages();
      this.getAllBranchsInfo();
      this.getAlldepartmentsInfo();
      this.getBranch();//获得机构信息
    },

    watch:{
        branchs:{
          handler(newValue, oldValue) {},
          deep:true
        },
        branchSubDepart:{
          handler(newValue, oldValue) {},
          deep:true
        }
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

        //获得机构的信息，机构下拉框的值改变，部门下拉框实现二级联动
        getBranch(){
            let tempValue = []
            var branchs = {"branchName":""}
            this.getRequest("/admin/attendsearch/branch").then(resp=> {
                //console.log("所有机构信息",resp);
                this.branchs= resp.data;
                //console.log("当前选择机构名称：",this.message.branchName);
                this.getDepart();
            
            })
        },

        //获得部门的信息
        getDepart(){
            let tempValue = []
            var branchSubDepart = {"departName":""}
            //console.log("当前选择机构名称：",this.message.branchName);
            this.getRequest("/admin/attendsearch/"+ this.branchName).then(resp=> {
                //console.log("所有部门信息",resp);
                this.branchSubDepart = resp.data;
                //console.log("已获得的部门信息",this.departNames);
                //console.log("this.departNames：",this.departNames);
            })
        },

        WriteTime(){

        },

        basicContent(){

        },

        messageInfoForm(){

        },

        //搜索并获得消息列表
        searchMessage(){
            var _this = this;
            var datas = {
                "endTime": _this.WriteTime.dateScope[1],
                "limit": _this.WriteTime.limit,
                "messageTypeId": 0,
                "query": null,
                //"size": 0,
                //"start": 0,
                "startTime": _this.WriteTime.dateScope[0]
            }
            this.postRequest('/message/list', datas).then(resp => {
                if (resp && resp.status === 200) {
                    console.log("test",resp)
                    _this.message = resp.data.obj.vos
                }
            })
        },

        //判断消息是否发送，从而决定发布按钮是否可用
        ifPublish(row){
            console.log("=================================")
            console.log(row)
            console.log("=================================")
            if(row.isPublished === '0'){//消息未发送，按钮可用
                return this.pulishButton = false;
            }else{//消息已发送，按钮不可用
                return this.pulishButton = true;
            }
        },

        //搜索结果表格中点击消息内容字段后显示消息内容
        showContentDetail(row){
            this.dialogMessageVisible = true
            this.basicContent.content = row.messageContent
        },

        //搜索结果表格点击发送对象字段后显示发送对象
        showToUserId(row){
            this.dialogToUserVisible = true
            this.basicContent.toUserId = row.recipients
            console.log("testArray",this.basicContent.toUserId)
            //this.basicContent.chineseName = row.recipients[0].chineseName
            for(var i of row.recipients){
                this.basicContent.chineseName.push(i.chineseName)
            }
        },

        //退出按钮
        leave(){
            this.dialogToUserVisible = false;
            for(;this.basicContent.chineseName.length>0;){
                this.basicContent.chineseName.pop()
            }
        },

        //添加/修改消息：根据messageId判断是添加还是修改
        addOrUpdateMessage(){
            this.dialogMessageFormVisible = true
            var _this = this
            if(_this.messageInfoForm.type === "一般消息"){
                _this.messageInfoForm.type = 1
            }else{
                _this.messageInfoForm.type = 2
            }
            var datas = {
                "beginTime": _this.messageInfoForm.dateScope[0],
                "createTime": _this.getCurrentDate(),
                "createUserId": _this.$store.state.user.userId,
                "endTime": _this.messageInfoForm.dateScope[1],
                "messageContent": _this.messageInfoForm.content,
                "messageId": _this.messageInfoForm.messageId,
                "messageTitle": _this.messageInfoForm.title,
                "messageTypeId": _this.messageInfoForm.type,
                "recipientIds": _this.messageInfoForm.toUserIds
            }
            console.log("datas",datas)

            if(_this.messageInfoForm.messageId === null){//如果消息id为空，则为添加页面
                
                this.postRequest('/message/add', datas).then(resp => {
                    if (resp && resp.status === 200) {
                        _this.emptyMessageInfoForm()//清空缓存
                        _this.searchMessage()//刷新
                    }
                })
            }else{//如果消息id不为空，则为修改页面
                this.postRequest('/message/update', datas).then(resp =>{
                    if (resp && resp.status === 200) {
                        _this.emptyMessageInfoForm()//清空缓存
                        _this.searchMessage()//刷新
                    }
                })
            }
            
        },

        //清空添加/修改页面的缓存数据
        emptyMessageInfoForm(){
            this.dialogMessageFormVisible = false
            this.messageInfoForm.messageId = null
            this.messageInfoForm.title = ''
            this.messageInfoForm.type = ''
            for(;this.messageInfoForm.dateScope.length>0;){
                this.messageInfoForm.dateScope.pop()
            }
            //this.messageInfoForm.toUserIds = row.
            for(;this.messageInfoForm.toUserIds.length>0;){
                this.messageInfoForm.toUserIds.pop()
            }
            this.messageInfoForm.content = ''

            this.showRange = false
            this.showUser = false

            this.branchName = ''
            this.departName = ''
            this.selectUserId = ''
            this.selectUserName = ''

            for(;this.checkedUsers.length>0;){
                this.checkedUsers.pop()
            }

            for(;this.userOptions.length>0;){
                this.userOptions.pop()
            }
                
            
        },

        //修改消息按钮
        editMessage(row){
            this.dialogMessageFormVisible = true
            this.showRange = true
            this.showUser = true
            this.messageInfoForm.messageId = row.messageId
            this.messageInfoForm.title = row.messageTitle
            this.messageInfoForm.type = row.messageTypeName
            this.messageInfoForm.dateScope[0] = row.beginTime
            this.messageInfoForm.dateScope[1] = row.endTime
            //this.messageInfoForm.toUserIds = row.recipients.userId
            for(var i of row.recipients){
                this.messageInfoForm.toUserIds.push(i.userId)
                this.checkedUsers.push(i.userId)
                this.userOptions.push(i)
            }
            this.messageInfoForm.content = row.messageContent
        },

        //删除消息按钮
        deleteMessage(row){
            var _this = this;
            var ids = []
            ids.push(row.messageId)
            var datas = {
                "ids": ids
            }
            this.postRequest('/message/deleteMessages', datas).then(resp => {
                if (resp && resp.status === 200) {
                   _this.searchMessage()//刷新
                }
            })
        },

        //发布消息按钮
        pulish(row){ 
            var _this = this
            var messageId = row.messageId
            this.getRequest('/message/publish/'+messageId).then(resp => {
                if (resp && resp.data.status === 200) {
                    _this.pulishButton = true;//发布按钮变灰色（不可用）
                    _this.searchMessage();//刷新
                }
            })
        },

        //发送对象单选触发方法
        toUserChange(value){
            //在获得数据之前，先清空之前的数据
            for(;this.checkedUsers.length>0;){
                this.checkedUsers.pop()
            }
            for(;this.userOptions.length>0;){
                this.userOptions.pop()
            }
            for(;this.messageInfoForm.toUserIds.length>0;){
                this.messageInfoForm.toUserIds.pop()
            }

            if(value === '1'){
                this.showRange = false;
                this.showUser = false;
            }
            if(value === '2'){
                //console.log("testRadio")
                this.showRange = true;
            }
        },
        
        //筛选范围多选触发方法
        showScreenRange(){
            if (this.checkedByBranch) {//按机构
                this.ifSelectBranch = false
                this.ifSelectDepart = true
                this.ifInputUserId = true
                this.ifInputUserName = true
                this.checkedByDepart = false
                this.checkedByUserId = false
                this.checkedByUserName = false
            } else if (this.checkedByDepart) {//按部门
                this.ifSelectBranch = false
                this.ifSelectDepart = false
                this.ifInputUserId = true
                this.ifInputUserName = true
                this.checkedByBranch = false
                this.checkedByUserId = false
                this.checkedByUserName = false
            } else if (this.checkedByUserId) {//按员工号
                this.ifSelectBranch = true
                this.ifSelectDepart = true
                this.ifInputUserId = false
                this.ifInputUserName = true
                this.checkedByBranch = false
                this.checkedByDepart = false
                this.checkedByUserName = false
            } else if (this.checkedByUserName) {//按姓名
                this.ifSelectBranch = true
                this.ifSelectDepart = true
                this.ifInputUserId = true
                this.ifInputUserName = false
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
                this.ifInputUserId = true
                this.ifInputUserName = true
                this.checkedByBranch = false
                this.checkedByDepart = false
                this.checkedByUserId = false
                this.checkedByUserName = false
            }
        },

        //返回按钮
        cancel(){
            this.emptyMessageInfoForm()
        },

        //获得发送对象人员信息
        getUser(){
            //在获得数据之前，先清空之前的数据
            for(;this.checkedUsers.length>0;){
                this.checkedUsers.pop()
            }

            for(;this.userOptions.length>0;){
                this.userOptions.pop()
            }

            for(;this.messageInfoForm.toUserIds.length>0;){
                this.messageInfoForm.toUserIds.pop()
            }

            this.showUser = true
            var _this = this
            var datas = {
                "branchName": _this.branchName,
                "chineseName": _this.selectUserName,
                "departName": _this.departName,
                "userId": _this.selectUserId
            }
            this.postRequest('/message/selectUsers', datas).then(resp => {
                if (resp && resp.status === 200) {
                   //_this.searchMessage()//刷新
                   console.log("testSelectUsers",resp)
                   _this.userOptions = resp.data.obj
                   for(var user of _this.userOptions){

                       _this.userDatas.push(user.chineseName)
                   }
                   _this.users = _this.userDatas
                   console.log("testUsers",_this.users)
                }
            })
        },

        //是否全选发送对象
        handleCheckAllChange(val) {
            this.checkedUsers = val ? userOptions : [];
            this.isIndeterminate = false;
            for(var check of this.checkedUsers){
                this.messageInfoForm.toUserIds.push(check.userId)
            }
        },

        //多选：选择发送对象
        handleCheckedUsersChange(value) {
            let checkedCount = value.length;
            this.checkAll = checkedCount === this.users.length;
            this.isIndeterminate = checkedCount > 0 && checkedCount < this.users.length;
            for(var check of this.checkedUsers){
                this.messageInfoForm.toUserIds.push(check.userId)
            }
            console.log("toUserIds",this.messageInfoForm.toUserIds)
        }
    }
}
</script>

<!--样式-->
<style scoped>
    .header{
        font-size:20px;text-align: center;
    }
</style>