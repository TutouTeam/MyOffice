<!--内容-->
<template>
    <!--外层容器-->
    <el-container>
        <!--顶栏容器-->
        <el-header>
            <!--标题-->
            <div>
                <el-header class="header">
                    信箱主界面
                    <hr width="300px" color="#20a0ff">
                </el-header>
            </div>
        </el-header>

        <!--主要区域容器-->
        <el-main>
            <!--主界面表格-->
            <el-form style="width:90%;margin:0 auto">
                <!--围栏-->
                <fieldset>
                    <legend align="left">个人消息管理区</legend>
                    <!--加一张图片-->
                    <div style="width:39%;float:left;">
                        <!--插入图片链接的代码-->
                        <img src="../../../assets/logo.png" alt="" style="width: 250px;height: 250px;">
                    </div>
                    <el-table :data="mailBox" border style="width:60%;float:right" :header-cell-style="{background:'#eef1f6',color:'#606266'}">
                        <el-table-column prop="file" label="本地文件夹" align="center" >
                            <template slot-scope="scope" style="color: red">
                                <i class="el-icon-message" @click="showDetail(scope.row)" ></i>{{scope.row.file}}
                            </template>
                        </el-table-column>
                        <el-table-column prop="fileNum" label="文件个数" align="center"></el-table-column>
                        <el-table-column prop="noReadFile" label="未读邮件" align="center"></el-table-column>
                    </el-table>
                </fieldset>
            </el-form>


            <!--收件箱弹窗-->
            <el-dialog title="收件箱"  :visible.sync="dialogInboxVisible">
                <!--收件箱列表-->
                <el-table :data="messages" border @selection-change="handleSelectionChange" :header-cell-style="{background:'#eef1f6',color:'#606266'}" size="mini" >
                    <el-table-column type="selection" fixed="left"></el-table-column>
                    <!-- 
                    <el-table-column prop="messageId" label="消息Id" width="150px" align="center">
                    </el-table-column> -->

                    <el-table-column prop="createUserName" label="发件人" width="150px" align="center">
                    </el-table-column>

                    <el-table-column prop="messageTitle" label="主题" width="250px" align="center">
                    </el-table-column>

                    <el-table-column prop="beginTime" label="发送时间" width="200px" align="center">
                    </el-table-column>

                    <el-table-column prop="messageTypeName" label="紧急程度" align="center">
                    </el-table-column>

                    <el-table-column label="操作" align="center" fixed="right" width="200px">
                        <template slot-scope="scope">
                            <el-button @click="showMessageDetail(scope.row)" :type="ifColor(scope.row)">{{ifRead(scope.row)}}</el-button>
                              <!-- <el-button @click="deleteInboxMessage(scope.row)">删除</el-button> -->
                        </template>
                    </el-table-column>
                </el-table>

                <div slot="footer" class="dialog-footer" align="right">
                    <el-button type="danger" @click="deleteInboxMessage()" size="mini">删除</el-button>
                    <el-button @click="dialogInboxVisible = false" size="mini">返 回</el-button>
                </div>
                

                <!--收件箱信件详情信息(收件箱2级弹框)-->
                <el-dialog title="消息详情" :visible.sync="dialogMessageDetail" append-to-body>
                    <el-form :model="message1">

                         <el-row>
                            <el-col :span="12">
                                <el-form-item label="消息Id">
                                    <span>{{this.message1.messageId}}</span>
                                </el-form-item>
                            </el-col>
                        </el-row>
                        <el-row>
                            <el-col :span="12">
                                <el-form-item label="消息主题">
                                    <span>{{this.message1.messageTitle}}</span>
                                </el-form-item>
                            </el-col>
                        </el-row>
                        <el-row>
                            <el-col :span="12">
                                <el-form-item label="重要程度">
                                    <span>{{this.message1.messageTypeName}}</span>
                                </el-form-item>
                            </el-col>
                        </el-row>
                        <el-row>
                            <el-col :span="12">
                                <el-form-item label="消息内容">
                                    <span>{{this.message1.messageContent}}</span>
                                </el-form-item>
                            </el-col>
                        </el-row>
                        <el-row>
                            <el-col :span="12">
                                <el-form-item label="发件人">
                                    <span>{{this.sender}}</span>
                                </el-form-item>
                            </el-col>
                        </el-row>
                        <el-row>
                            <el-col :span="12">
                                <el-form-item label="发送时间">
                                    <span>{{this.message1.publishTime}}</span>
                                </el-form-item>
                            </el-col>
                        </el-row>
                    </el-form>
                    <div slot="footer" class="dialog-footer" align="center">
                        <el-button @click="dialogMessageDetail = false" size="mini">关 闭</el-button>
                    </div>
                </el-dialog>
            </el-dialog>



            <!--已发送弹窗-->
            <el-dialog title="已发送" :visible.sync="dialogSendedVisible">
                <!--已发送列表-->
                <el-table :data="sendDetail" border @selection-change="handleSelectionChange" :header-cell-style="{background:'#eef1f6',color:'#606266'}" size="mini">
                    <el-table-column type="selection" fixed="left"></el-table-column>


                    <el-table-column prop="messageTitle" label="主题" width="250px" align="center">
                        
                    </el-table-column>
                    <el-table-column prop="beginTime" label="发送时间" width="200px" align="center">
                       
                    </el-table-column>
                    <el-table-column prop="messageTypeName" label="紧急程度" align="center">
                    </el-table-column>
<!-- 
                    <el-table-column prop="recipients[].chineseName" label="收件人" align="center">
                    </el-table-column> -->


                    
                    <el-table-column label="操作" align="center" fixed="right" width="200px">
                        <template slot-scope="scope">
                            <el-button @click="showMessageDetail(scope.row)">查看详情</el-button>
                            <!-- <el-button @click="deleteSendedMessage(scope.row)">删除</el-button> -->
                        </template>
                    </el-table-column>

                     </el-table>

                <div slot="footer" class="dialog-footer" align="right">
                    <el-button type="danger" @click="deleteSendedMessage()" size="mini">删除</el-button>
                    <el-button @click="dialogSendedVisible = false" size="mini">返 回</el-button>
                </div>

                <!--已发送信件详情-->
                <el-dialog title="消息详情" :visible.sync="dialogSendedMessageDetail" append-to-body>
                    <el-form :model="messageDetail">
                        <el-row>
                            <el-col :span="12">
                                <el-form-item label="消息ID">
                                    <span>{{messageDetail.title}}</span>
                                </el-form-item>
                            </el-col>
                        </el-row>
                        <el-row>
                            <el-col :span="12">
                                <el-form-item label="紧急程度">
                                    <span>{{messageDetail.massageDesc}}</span>
                                </el-form-item>
                            </el-col>
                        </el-row>
                        <el-row>
                            <el-col :span="12">
                                <el-form-item label="消息内容">
                                    <span>{{messageDetail.content}}</span>
                                </el-form-item>
                            </el-col>
                        </el-row>
                        <el-row>
                            <el-col :span="12">
                                <el-form-item label="发件人">
                                    <span>{{messageDetail.fromUser}}</span>
                                </el-form-item>
                            </el-col>
                        </el-row>
                        <el-row>
                            <el-col :span="12">
                                <el-form-item label="发送时间">
                                    <span>{{messageDetail.recordTime }}</span>
                                </el-form-item>
                            </el-col>
                        </el-row>
                    </el-form>
                    <div slot="footer" class="dialog-footer" align="center">
                        <el-button @click="dialogSendedMessageDetail = false" size="mini">关 闭</el-button>
                    </div>
                </el-dialog>
            </el-dialog>


            <!--草稿箱弹窗-->
            <el-dialog title="草稿箱" :visible.sync="dialogDraftVisible">
                <!--草稿箱列表-->
                 <el-table :data="draftDetail" border @selection-change="handleSelectionChange" :header-cell-style="{background:'#eef1f6',color:'#606266'}" size="mini">
                    <el-table-column type="selection" fixed="left"></el-table-column>
                     
                    <!-- <el-table-column  prop="messageId" label="消息Id" width="150px" align="center"></el-table-column> -->


                    <el-table-column prop="messageTitle" label="主题" width="250px" align="center">
                        
                    </el-table-column>
                    <el-table-column prop="beginTime" label="发送时间" width="200px" align="center">
                       
                    </el-table-column>
                    <el-table-column prop="messageTypeName" label="紧急程度" align="center">
                    </el-table-column>

                    
                    <el-table-column label="操作" align="center" fixed="right" width="200px">
                        <template slot-scope="scope">
                            <el-button @click="showMessageDetail(scope.row)">查看详情</el-button>
                            <!-- <el-button @click="deleteDraftMessage(scope.row)">删除</el-button> -->
                        </template>
                    </el-table-column>
                </el-table>

                <div slot="footer" class="dialog-footer" align="right">
                    <el-button type="danger" @click="deleteDraftMessage()" size="mini">删除</el-button>
                    <el-button @click="dialogDraftVisible = false" size="mini">返 回</el-button>
                </div>

                <!--草稿箱信件详情-->
                <el-dialog title="消息详情" :visible.sync="dialogDraftMessageDetail" append-to-body>
                    <el-form :model="messageDetail">
                        <el-row>
                            <el-col :span="12">
                                <el-form-item label="消息主题">
                                    <span>{{messageDetail.title}}</span>
                                </el-form-item>
                            </el-col>
                        </el-row>
                        <el-row>
                            <el-col :span="12">
                                <el-form-item label="紧急程度">
                                    <span>{{messageDetail.massageDesc}}</span>
                                </el-form-item>
                            </el-col>
                        </el-row>
                        <el-row>
                            <el-col :span="12">
                                <el-form-item label="消息内容">
                                    <span>{{messageDetail.content}}</span>
                                </el-form-item>
                            </el-col>
                        </el-row>
                        
                        
                    </el-form>
                    <div slot="footer" class="dialog-footer" align="center">
                        <el-button @click="dialogDraftMessageDetail = false" size="mini">关 闭</el-button>
                    </div>
                </el-dialog>
            </el-dialog>



            <!--已删除弹窗-->
            <el-dialog title="已删除" :visible.sync="dialogDeletedVisible">
                <!--已删除列表-->
                 <el-table :data="deleteDetail" border @selection-change="handleSelectionChange" :header-cell-style="{background:'#eef1f6',color:'#606266'}" size="mini">
                    <el-table-column type="selection" fixed="left"></el-table-column>
                     
                    <!-- <el-table-column  prop="messageId" label="消息Id" width="150px" align="center"> -->
                        
                
                    <el-table-column prop="messageTitle" label="主题" width="250px" align="center">
                        
                    </el-table-column>
                    <el-table-column prop="beginTime" label="发送时间" width="200px" align="center">
                       
                    </el-table-column>
                    <el-table-column prop="messageTypeName" label="紧急程度" align="center">
                    </el-table-column>

                    
                    <el-table-column label="操作" align="center" fixed="right" width="200px">
                        <template slot-scope="scope">
                            <el-button @click="showMessageDetail(scope.row)" :type="ifColor(scope.row)">{{ifRead(scope.row)}}</el-button>
                             <!-- <el-button @click="deleteDeletedMessage(scope.row)">删除</el-button> -->
                        </template>
                    </el-table-column>
                </el-table>

                <div slot="footer" class="dialog-footer" align="right">
                    
                    <el-button type="danger" @click="deleteMultipMessage" size="mini">删除</el-button>
                    <el-button @click="dialogDeletedVisible = false" size="mini">返 回</el-button>
                    
                </div>

    
                <!--已删除信件详情-->
                <el-dialog title="消息详情" :visible.sync="dialogDeletedMessageDetail" append-to-body>
                    <el-form :model="messageDetail">
                        <el-row>
                            <el-col :span="12">
                                <el-form-item label="消息主题">
                                    <span>{{messageDetail.title}}</span>
                                </el-form-item>
                            </el-col>
                        </el-row>
                        <el-row>
                            <el-col :span="12">
                                <el-form-item label="紧急程度">
                                    <span>{{messageDetail.massageDesc}}</span>
                                </el-form-item>
                            </el-col>
                        </el-row>
                        <el-row>
                            <el-col :span="12">
                                <el-form-item label="消息内容">
                                    <span>{{messageDetail.content}}</span>
                                </el-form-item>
                            </el-col>
                        </el-row>
                        <el-row>
                            <el-col :span="12">
                                <el-form-item label="发件人">
                                    <span>{{messageDetail.fromUser}}</span>
                                </el-form-item>
                            </el-col>
                        </el-row>
                        <el-row>
                            <el-col :span="12">
                                <el-form-item label="发送时间">
                                    <span>{{messageDetail.recordTime }}</span>
                                </el-form-item>
                            </el-col>
                        </el-row>
                    </el-form>
                    <div slot="footer" class="dialog-footer" align="center">
                        <el-button @click="dialogDeletedMessageDetail = false" size="mini">关 闭</el-button>
                    </div>
                </el-dialog>
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
            //信箱主界面表格内容数据
            mailBox: [{
                file: '收件箱',
                fileNum: 0,
                noReadFile: 0
            },
            {
                file: '草稿箱',
                fileNum: 0,
                noReadFile: 0
            },
            {
                file: '已发送',
                fileNum: 0,
                noReadFile:0
            },
            {
                file: '已删除',
                fileNum: 0,
                noReadFile: 0
            }
            ],

            sendedInfo: [],
            draftInfo: [],
            deletedInfo: [],


 //接收收件箱的数据

            messageDetail: [
                {
                    size:"",
                    messageTitle:"",
                    messageTypeName:"",
                    createUserName:"",
                }

            ],


//（已发送）发件箱信息详情
            sendMessageDetail:[
                {
                    size:"",
                    messageId:"",
                    messageTypeName:"",
                    messageTitle:"",
                    beginTime:""
                }
            ],

            //草稿箱信息详情
            draftMessageDetail:[
                {
                    size:"",
                     messageId:"",
                    messageTypeName:"",
                    messageTitle:"",
                    beginTime:""

                }
            ],

             deleteMessageDetail:[
                {
                    size:"",
                     messageId:"",
                    messageTypeName:"",
                    messageTitle:"",
                    beginTime:""

                }
            ],


            // 收件人信息
            recipientsContent: [
                {
                    userId:"",
                    chineseName:"",
                    
                }
            ],


            messages:[],
            message1:[],
            sendDetail:[],
            draftDetail:[],
            deleteDetail:[],
            sender:'',
            receivedmessage:[],

            dialogInboxVisible: false,
            dialogSendedVisible: false,
            dialogDraftVisible: false,
            dialogDeletedVisible: false,

            dialogMessageDetail: false,
            dialogSendedMessageDetail: false,
            dialogDraftMessageDetail: false,
            dialogDeletedMessageDetail: false,

            newMessgae: true,
            multipleSelection: []
        }
    },

    //生命周期函数钩子
    mounted() {
      this.getAllInboxInfo()
      this.getAllSendedInfo()
      this.getAllDraftInfo()
      this.getAllDeletedInfo()
    },

    //功能函数
    methods: {
        //根据信件是否已读，改变按钮类型 (蓝色已读，红色未读)
        ifColor(row){
            if(row.ifReadByUser === "1"){
                return "primary"
            }else{
                return "danger"
            }
        },

        //判断信件是否已读
        ifRead(row){
            if(row.ifReadByUser === "1"){
                return "已读"
            }else{
                return "未读"
            }
        },

        //获得所有收件箱消息
        getAllInboxInfo() {
             var messageDetail = {
                 "size":"",
                 "notReadSize":""
             }

             
            this.getRequest('/message/').then(resp => {
            console.log("receiveResp:",resp);
                this.messageDetail.size = resp.data.obj.size;
                this.messageDetail.notReadSize = resp.data.obj.notReadSize;
                this.messageDetail.ifReadByUser = resp.data.obj.ifReadByUser;
                this.messages = resp.data.obj.vos;
                
                console.log("=====收件箱 收到信息个数：",this.messageDetail.size);
                console.log("未读个数:",this.messageDetail.notReadSize);
                console.log("ifReadByUser?:",this.messageDetail.ifReadByUser);
                console.log("收件箱列表",this.messages);
                this.mailBox[0].fileNum = this.messageDetail.size;
                this.mailBox[0].noReadFile = this.messageDetail.notReadSize;
                
            })
        },
        
        //获得所有已发送消息
        getAllSendedInfo() {
            var sendMessageDetail = {
                 "size":"",
             }
            this.getRequest('/message/getPublishedMessages').then(resp => {
                console.log("已发送receiveResp:",resp);
                this.sendMessageDetail.size = resp.data.obj.size;
                this.sendDetail = resp.data.obj.vos;
                console.log("已发送信息个数：",this.sendMessageDetail.size);
                console.log("发件箱列表",this.sendDetail);
                this.mailBox[2].fileNum = this.sendMessageDetail.size;
                
            })
        },

        //获得所有草稿箱消息
        getAllDraftInfo(){
           var draftMessageDetail = {
                 "size":"",
             }
            this.getRequest('/message/getNotPublishedMessages').then(resp => {
                console.log("草稿箱receiveResp:",resp);
                this.draftMessageDetail.size = resp.data.obj.size;
                this.draftMessageDetail.ifReadByUser = resp.data.obj.ifReadByUser;

                this.draftDetail = resp.data.obj.vos;
                
                console.log("=====草稿箱信息个数：",this.draftMessageDetail.size);
                console.log("草稿箱列表",this.draftDetail);
                console.log("ifNotReadByUser?:",this.draftMessageDetail.ifReadByUser);
                this.mailBox[1].fileNum = this.draftMessageDetail.size;
                
            })
        },

        //获得所有已删除消息
        getAllDeletedInfo(){
           var deleteMessageDetail = {
                 "size":"",
                 "notReadSize" : ""
             }
            this.getRequest('/message/getDeletedMessages').then(resp => {
                console.log("已删除 receiveResp:",resp);
                this.deleteMessageDetail.size = resp.data.obj.size;
                this.deleteDetail = resp.data.obj.vos;
                this.deleteMessageDetail.notReadSize = resp.data.obj.notReadSize;
                console.log("=====未读邮件个数",this.deleteMessageDetail.notReadSize);
                console.log("已删除信息个数：",this.deleteMessageDetail.size);
                console.log("已删除列表",this.deleteDetail);
                this.mailBox[3].fileNum = this.deleteMessageDetail.size;
                this.mailBox[3].noReadFile = this.deleteMessageDetail.notReadSize;
                
            })
        },

        //主界面表格细节展示
        showDetail(row) {
            if (row.file === '收件箱') {
            this.dialogInboxVisible = true
            console.log("进入 收件箱 showDetail");
            
            this.getAllInboxInfo(row)

            } else if (row.file === '已发送') {
            this.dialogSendedVisible = true
            console.log("进入 已发送 showDetail");
            this.getAllSendedInfo(row)

            } else if (row.file === '草稿箱') {
            this.dialogDraftVisible = true
            console.log("进入 草稿箱 showDetail");
            this.getAllDraftInfo(row)

            } else if (row.file === '已删除') {
            this.dialogDeletedVisible = true
            console.log("进入 已删除 showDetail");
            this.getAllDeletedInfo(row)
            }
        },
        
        //显示收件箱消息详情
        showMessageDetail(row) {
            var _this = this
            _this.dialogMessageDetail = true
    
            this.message1 = row;
        
            this.receivedmessage = row.recipients;

            this.sender = row.createUserName;
            console.log("=====收件箱：查看recipients",this.receivedmessage)
            console.log("查看发件人：",this.sender)
            console.log("查看收件箱详情:",this.message1)

            var datas = {
                "currentUserId": this.$store.state.user.userId,
                "messageIds": [
                    row.messageId
                ]
            }
            this.postRequest('/message/read', datas).then(resp => {
                if (resp && resp.status === 200) {
                    this.$message({
                        type: 'success',
                        message: '查看成功!'
                    })
                }
                this.getAllInboxInfo()
            })
        },
        
        //显示已发送消息详情
        showSendedMessageDetail(row) {
            var _this = this
            _this.dialogSendedMessageDetail = true
            
            _this.messageDetail = row
            for (let i = 0; i < _this.sendedInfo.length; i++) {
            if (_this.sendedInfo[i].id === row.id) {
                _this.sendedInfo[i].newMessage = ''
            }
            }
            console.log(_this.sendedInfo)
        },

        //显示草稿箱消息详情
        showDraftMessageDetail(row){
            var _this = this
            _this.dialogDraftMessageDetail = true
            _this.messageDetail = row
            for (let i = 0; i < _this.draftInfo.length; i++) {
            if (_this.draftInfo[i].id === row.id) {
                _this.draftInfo[i].newMessage = ''
            }
            }
            console.log(_this.draftInfo)
        },

        //显示已删除消息详情
        showDeletedMessageDetail(row){
            var _this = this
            _this.dialogDeletedMessageDetail = true
            _this.messageDetail = row
            for (let i = 0; i < _this.deletedInfo.length; i++) {
            if (_this.deletedInfo[i].id === row.id) {
                _this.deletedInfo[i].newMessage = ''
            }
            }
            console.log(_this.deletedInfo)

            var datas = {
                "currentUserId": this.$store.state.user.userId,
                "messageIds": [
                    row.messageId
                ]
            }
            this.postRequest('/message/read', datas).then(resp => {
                if (resp && resp.status === 200) {
                    this.$message({
                        type: 'success',
                        message: '查看成功!'
                    })
                }
                this.getAllInboxInfo()
            })
        },
        
        //表格多项选择
        handleSelectionChange(val) {
            this.multipleSelection = val
        },
       

//删除收件箱信息
        // deleteInboxMessage(row) {
        //     this.$confirm('此操作将删除[' + this.multipleSelection.length + ']条数据, 是否继续?', '提示', {
        //     // this.$confirm('此操作将删除此条数据, 是否继续?', '提示', {
        //     confirmButtonText: '确定',
        //     cancelButtonText: '取消',
        //     type: 'warning'
        //     }).then(() => {
        //     var ids = []
        //     ids.push(row.messageId)
        //     var datas ={
        //         "ids":ids
        //     }
        //     console.log("shima",datas);
        //     console.log("ids:",ids);
        //     this.postRequest('/message/deleteMessagesToCollection', datas).then(resp => {
        //         this.tableLoading = false
        //         console.log("PassId",datas);
        //         console.log("进入deleteMesagesToCollection");
        //         if (resp.status === 200) {
        //         this.$message({
        //             type: 'success',
        //             message: '删除成功!'
        //         })
        //         this.getAllInboxInfo()
        //         }
        //      }
        //     )
        //     }).catch(() => {})
        // },


          deleteInboxMessage(row) {
             this.$confirm('此操作将删除[' + this.multipleSelection.length + ']条数据, 是否继续?', '提示', {
          confirmButtonText: '确定',
          cancelButtonText: '取消',
          type: 'warning'
        }).then(() => {
          var ids = []
          for (var i = 0; i < this.multipleSelection.length; i++) {
                ids.push(this.multipleSelection[i].messageId)
          }
          var datas ={
            ids:ids
            }
         console.log("选定要彻底删除的信息：",datas);
          this.postRequest('/message/deleteMessagesToCollection', datas).then(resp => {
            this.tableLoading = false
            if (resp && resp.status === 200) {
              this.$message({
                type: 'success',
                message: '删除成功!'
              })
              this.getAllDeletedInfo()
            }
          })
        }).catch(() => {})
        },
        


        
        //删除已发送消息
        // deleteSendedMessage(row) {
        //      this.$confirm('此操作将删除[' + this.multipleSelection.length + ']条数据, 是否继续?', '提示', {
        //     confirmButtonText: '确定',
        //     cancelButtonText: '取消',
        //     type: 'warning'
        //     }).then(() => {
        //     var ids = []
        //     ids.push(row.messageId)
        //     var datas ={
        //         "ids":ids
        //     }
        //     console.log("shima",datas);
        //     console.log("ids:",ids);
        //     this.postRequest('/message/deleteMessagesToCollection', datas).then(resp => {
        //         this.tableLoading = false
        //         console.log("PassId",datas);
        //         console.log("进入deleteMesagesToCollection");
        //         if (resp.status === 200) {
        //         this.$message({
        //             type: 'success',
        //             message: '删除成功!'
        //         })
        //         this.getAllSendedInfo()
        //         }
        //      }
        //     )
        //     }).catch(() => {})
        // },

deleteSendedMessage() {
            this.$confirm('此操作将删除[' + this.multipleSelection.length + ']条数据, 是否继续?', '提示', {
          confirmButtonText: '确定',
          cancelButtonText: '取消',
          type: 'warning'
        }).then(() => {
          var ids = []
          for (var i = 0; i < this.multipleSelection.length; i++) {
                ids.push(this.multipleSelection[i].messageId)
          }
          var datas ={
            ids:ids
            }
         console.log("选定要彻底删除的信息：",datas);
          this.postRequest('/message/deleteMessagesToCollection', datas).then(resp => {
            this.tableLoading = false
            if (resp && resp.status === 200) {
              this.$message({
                type: 'success',
                message: '删除成功!'
              })
              this.getAllDeletedInfo()
            }
          })
        }).catch(() => {})
        },




        //删除草稿箱消息
        // deleteDraftMessage(row){
        //     this.$confirm('此操作将删除[' + this.multipleSelection.length + ']条数据, 是否继续?', '提示', {
        //     confirmButtonText: '确定',
        //     cancelButtonText: '取消',
        //     type: 'warning'
        //     }).then(() => {
        //     var ids = []
        //     ids.push(row.messageId)
        //     var datas ={
        //         "ids":ids
        //     }
        //     console.log("shima",datas);
        //     console.log("ids:",ids);
        //     this.postRequest('/message/deleteMessagesToCollection', datas).then(resp => {
        //         this.tableLoading = false
        //         console.log("PassmessageId",datas);
        //         console.log("进入deleteMesagesToCollection");
        //         if (resp.status === 200) {
        //         this.$message({
        //             type: 'success',
        //             message: '删除成功!'
        //         })
        //         this.getAllDraftInfo()
        //         }
        //      }
        //     )
        //     }).catch(() => {})
        // },


         deleteDraftMessage(){
           this.$confirm('此操作将删除[' + this.multipleSelection.length + ']条数据, 是否继续?', '提示', {
          confirmButtonText: '确定',
          cancelButtonText: '取消',
          type: 'warning'
        }).then(() => {
          var ids = []
          for (var i = 0; i < this.multipleSelection.length; i++) {
                ids.push(this.multipleSelection[i].messageId)
          }
          var datas ={
            ids:ids
            }
         console.log("选定要彻底删除的信息：",datas);
          this.postRequest('/message/deleteMessagesToCollection', datas).then(resp => {
            this.tableLoading = false
            if (resp && resp.status === 200) {
              this.$message({
                type: 'success',
                message: '删除成功!'
              })
              this.getAllDeletedInfo()
            }
          })
        }).catch(() => {})
      },



        //删除已删除消息
        // deleteDeletedMessage(row){
        //     this.$confirm('此操作将删除[' + this.multipleSelection.length + ']条数据, 是否继续?', '提示', {
        //     confirmButtonText: '确定',
        //     cancelButtonText: '取消',
        //     type: 'warning'
        //     }).then(() => {
        //     var ids = []
        //     ids.push(row.messageId)
        //     var datas ={
        //         ids:ids
        //     }
        //     console.log(datas)
        //     this.postRequest('/message/deleteMessages', datas).then(resp => {
        //         this.tableLoading = false
        //         if (resp && resp.status === 200) {
        //             this.$message({
        //                 type: 'success',
        //                 message: '删除成功!'
        //             })
        //             this.getAllDeletedInfo();
        //             }
        //         })
        //     }).catch(() => {})
        // },


        deleteDeletedMessage(){
             this.$confirm('此操作将删除[' + this.multipleSelection.length + ']条数据, 是否继续?', '提示', {
          confirmButtonText: '确定',
          cancelButtonText: '取消',
          type: 'warning'
        }).then(() => {
          var ids = []
          for (var i = 0; i < this.multipleSelection.length; i++) {
                ids.push(this.multipleSelection[i].messageId)
          }
          var datas ={
            ids:ids
            }
         console.log("选定要彻底删除的信息：",datas);
          this.postRequest('/message/deleteMessages', datas).then(resp => {
            this.tableLoading = false
            if (resp && resp.status === 200) {
              this.$message({
                type: 'success',
                message: '删除成功!'
              })
              this.getAllDeletedInfo()
            }
          })
        }).catch(() => {})
        },



         


     //删除多条消息
        deleteMultipMessage(){
            this.$confirm('此操作将删除[' + this.multipleSelection.length + ']条数据, 是否继续?', '提示', {
          confirmButtonText: '确定',
          cancelButtonText: '取消',
          type: 'warning'
        }).then(() => {
          var ids = []
          for (var i = 0; i < this.multipleSelection.length; i++) {
                ids.push(this.multipleSelection[i].messageId)
          }
          var datas ={
            ids:ids
            }
         console.log("选定要彻底删除的信息：",datas);
          this.postRequest('/message/deleteMessages', datas).then(resp => {
            this.tableLoading = false
            if (resp && resp.status === 200) {
              this.$message({
                type: 'success',
                message: '删除成功!'
              })
              this.getAllDeletedInfo()
            }
          })
        }).catch(() => {})
      },


    },     


}
</script>

<!--样式-->
<style scoped>
    .header{
        font-size:20px;text-align: center;
    }
</style>