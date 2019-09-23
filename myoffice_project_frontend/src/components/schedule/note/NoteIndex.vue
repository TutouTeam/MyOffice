<!--内容-->
<template>
    <!--外层容器-->
    <el-container>
        <!--顶栏容器-->
        <el-header>
            <!--标题-->
            <div>
                <el-header class="header">
                    便签主界面
                    <hr width="300px" color="#20a0ff">
                </el-header>
            </div>
        </el-header>

        <!--主要区域容器-->
        <el-main>
            <div>
                <!--新增便签按钮-->
                <el-row>
                    <el-col>
                        <el-button type="primary" icon="el-icon-circle-plus" @click="dialogNoteVisible = true">新增便签</el-button>
                    </el-col>
                </el-row>
                <br>
                <!--便签表格展示-->
                <!--以表格的形式记性展示，主要字段为序号、便签标题和操作（修改按钮和删除按钮）-->
                <el-row>
                    <el-col>
                        <el-table border stripe size="mini" sytle="width: 100%" :data="noteList">
                            <!--字段：序号-->
                            <el-table-column
                                prop="id"
                                label="序号"
                                align="center"
                                width="100">
                            </el-table-column>

                            <!--字段：便签标题-->
                            <el-table-column
                                prop="title"
                                label="便签标题"
                                align="center"
                                width="800">
                            </el-table-column>

                            <!--字段：操作-->
                            <el-table-column
                                prop="operation"
                                label="操作"
                                align="center"
                                width="354">
                                    <template slot-scope="scope">
                                        <!--便签查看按钮-->
                                        <el-button type="primary" style="padding: 3px 4px 3px 4px;margin: 2px" size="mini" @click="lookNote(scope.row.noteTitle)">
                                            查看便签
                                        </el-button>
                                        <!--便签删除按钮
                                        <el-button type="danger" style="padding: 3px 4px 3px 4px;margin: 2px" size="mini" @click="deleteNote(scope.row)">
                                            删除便签
                                        </el-button>
                                        -->
                                        
                                    </template>
                            </el-table-column>
                        </el-table>
                    </el-col>
                </el-row>

                <!--分页结构-->
                <el-row>
                </el-row>
            </div>

            <!--添加便签弹出框（里面有添加按钮）-->
            <el-dialog :title="dialogNoteTitle" :visible.sync="dialogNoteVisible">
                <!--表单-->
                <el-form :model="note">
                    <!--利用<el-row>和<el-col>进行布局-->
                    <el-row>
                        <el-col>
                            <el-form-item>
                                <span style="position:absolute;left:10px;">便签标题：</span><br>
                                <el-input placeholder="请输入标题" v-model="note.noteTitle">

                                </el-input>
                            </el-form-item>
                        </el-col>

                        <el-col>
                            <el-form-item>
                                <span style="position:absolute;left:10px;">便签内容：</span><br>
                                <el-input placeholder="请输入内容" type="textarea" :rows="10" v-model="note.noteContent">

                                </el-input>
                            </el-form-item>
                        </el-col>

                        <el-col>
                            <el-form-item>
                                <span>创建人：</span>
                                <span>创建时间：{{noteDetail.createTime}}</span>
                            </el-form-item>
                        </el-col>

                        <el-col>
                            <el-button type="primary" @click="addNote()">添加</el-button>
                        </el-col>
                    </el-row>
                </el-form>
            </el-dialog>

            <!--查看便签弹出框（里面有修改按钮和删除按钮）-->
            <el-dialog :title="dialogNoteDetailTitle" :visible.sync="dialogNoteDetailVisible">
                <!--表单-->
                <el-form :model="noteDetail">
                    <!--利用<el-row>和<el-col>进行布局-->
                    <el-row>
                        <el-col>
                            <el-form-item>
                                <span style="position:absolute;left:10px;">便签标题：</span><br>
                                <el-input placeholder="请输入标题" v-model="noteDetail.noteTitle">

                                </el-input>
                            </el-form-item>
                        </el-col>

                        <el-col>
                            <el-form-item>
                                <span style="position:absolute;left:10px;">便签内容：</span><br>
                                <el-input placeholder="请输入内容" type="textarea" :rows="10" v-model="noteDetail.noteContent">

                                </el-input>
                            </el-form-item>
                        </el-col>

                        <el-col>
                            <el-form-item>
                                <span>创建人：{{noteDetail.createUser}}</span>
                                <span>创建时间：{{noteDetail.createTime}}</span>
                            </el-form-item>
                        </el-col>

                        <el-col>
                            <el-button type="primary" @click="updateNote()">修改</el-button>
                            <el-button type="danger" @click="deleteNote()">删除</el-button>
                        </el-col>
                    </el-row>
                </el-form>
            </el-dialog>

        </el-main>
    </el-container>
</template>

<!--逻辑-->
<script>
export default {
    //数据定义
    data(){
        return{
            noteList: [],
            notesList: [],
            note: {
                noteId: '',
                noteTitle: '',
                noteContent: '',
                createTime: '',
                createUser: ''
            },
            noteDetail: {
                noteId: '',
                noteTitle: '',
                noteContent: '',
                createTime: '',
                createUser: ''
            },
            formLabelWidth: '120px',
            dialogTableVisible: false,
            dialogNoteVisible: false,
            dialogNoteTitle: '添加便签',
            dialogNoteDetailVisible: false,
            dialogNoteDetailTitle: '查看便签',
        }
    },

    //功能函数
    mothods:{
        //加载我的便签
        loadMyNote()  {      
            var  _this  =  this      
            var  datas  =   {        
            //'createUser': this.$store.state.user.cname
            //'createUser': "string"
                'userId': 1
            }   
            this.postRequest('/mynote/listnotebyid', datas).then(resp  =>  {        
            if  (resp.data  &&  resp.data.status  ===  200)  {               
                _this.noteList = resp.data.obj.myNoteTitleRespList
            }      
            })    
        },
        //添加便签
        addNote() {
            var _this = this
            this.dialogShowNoteVisible = false
            //this.note.createUser=this.$store.state.user.cname
            this.note.createUser="杨文君"
            if(this.note.noteTitle!=null && this.note.noteTitle!=""){
                this.postRequest('/mynote/addnote', this.note).then(resp => {
                    if (resp && resp.status === 200) {
                        this.dialogNoteVisible = false
                        _this.loadMyNote()
                        this.$message({
                        type: 'success',
                        message: "添加成功！"
                        });
                    }
                })
            }         
                else{
                this.$message({
                type: 'error',
                message: "标题不为空"
                });
                }
        },
        //删除便签
        deleteNote() {
            this.$confirm('此操作将永久删除[' + this.noteDetail.noteTitle + ']的便签是否继续?', '提示', {
            confirmButtonText: '确定',
            cancelButtonText: '取消',
            type: 'warning'
            }).then(() => {
                var  datas  =   {        
            noteId: this.noteDetail.noteId
            }   
        
            this.deleteRequest('/schedule/note/deleteNote', {noteId: this.noteDetail.noteId}).then(resp => {
                if (resp && resp.status === 200) {
                this.dialogNoteDetailVisible = false
                this.loadMyNote()
                }
            })
            }).catch(() => {})
        },
        //修改便签
        updateNote() {
            var datas = {
                'noteId': this.noteDetail.noteId,
                'noteTitle': this.noteDetail.noteTitle,
                'noteContent': this.noteDetail.noteContent
            }
            this.putRequest('/schedule/note/updateNote', datas).then(resp => {
                if (resp && resp.status === 200) {
                this.dialogNoteDetailVisible = false
                this.loadMyNote()
                }
            })
        },
        //显示编辑便签页面
        LookNote(title) {
             
            this.dialogNoteDetailVisible = true
            this.initMyNote(title)
            // console.log(this.notesList)
            // this.note.noteId = this.notesList.noteId
            // this.note.noteTitle = this.notesList.noteTitle
            // this.note.noteContent = this.notesList.noteContent
            // this.note.createUser = this.notesList.createUser
            // this.note.createTime = this.notesList.createTime
        },
        //初始化我的便签
        initMyNote(title)  {      
            var  _this  =  this      
            var  datas  =   {        
            'noteTitle': title   
            }   
            this.postRequest('/schedule/note/myNotesSearch', datas).then(resp  =>  {        
            if  (resp  &&  resp.status  ===  200)  {     
                _this.notesList = resp.data.obj.myNoteRespList
                console.log(this.notesList[0])  
                this.noteDetail.noteId = this.notesList[0].noteId
                this.noteDetail.noteTitle = this.notesList[0].noteTitle
                this.noteDetail.noteContent = this.notesList[0].noteContent
                this.noteDetail.createUser = this.notesList[0].createUser
                this.noteDetail.createTime = this.notesList[0].createTime       
            }      
            })    
        },
    },

    //生命周期函数
    mounted() {
      this.loadMyNote()
      // this.initMyNote()
    },
    
}
</script>

<!--样式-->
<style scoped>
    .header{
        font-size:20px;text-align: center;
    }
</style>