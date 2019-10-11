<!--内容-->
<template>
    <!--外层容器-->
    <el-container>
        <!--顶栏容器-->
        <el-header>
            <!--标题-->
            <div>
                <el-header class="header">
                    文件管理主界面
                    <hr width="300px" color="#20a0ff">
                </el-header>
            </div>
        </el-header>

        <!--主要区域容器-->
        <el-main>
            <el-container>
                <!--文档树形结构-->
                <div>
                    <el-row>
                        <span class="header">文档目录</span>
                        <hr>
                    </el-row>
                    <el-row>
                        <el-tree :data="treeData" :props="defaultProps" @node-click="handleNodeClick"></el-tree>
                    </el-row>
                </div>
                
                <!--文档内容主结构-->
                <el-main>
                    <el-header>
                        <p align="left" style="margin-top:0">
                            <el-button round type="danger"><i class="el-icon-back" @click="back">后退</i></el-button>
                            <el-button type="info"><i class="el-icon-back" @click="backRoot">回到根目录</i></el-button>
                            <el-button type="primary"><i class="el-icon-search" @click="dialogSearch = true">搜索</i></el-button>
                            <el-button type="warning"><i class="el-icon-folder" @click="file">文件夹</i></el-button>
                            <el-button type="success"><i class="el-icon-circle-plus-outline" @click="dialogAddFolder = true;dialogFolderName = '新增文件夹';emptyFile()">新增文件夹</i></el-button>
                            <el-button type="success"><i class="el-icon-plus" @click="dialogAddFile = true;dialogFileName = '新增文件';emptyFile()">新增文件</i></el-button>
                        </p>
                    </el-header>
                    <el-main>
                        <el-form>
                            <el-row>
                                <el-col :span="16">
                                    <el-form-item label="地址:" label-width="50px">
                                        <el-input v-model="address" style="width:100%"></el-input>
                                    </el-form-item>
                                </el-col>
                                <el-col :span="1">
                                    <el-form-item>
                                        <el-button type="warning"><i class="el-icon-folder"></i></el-button>
                                    </el-form-item>
                                </el-col>
                                <el-col :span="6">
                                    <el-form-item>
                                        <el-button class="el-icon-refresh-right" type="success">转到</el-button>
                                    </el-form-item>
                                </el-col>
                            </el-row>
                        </el-form>
                        <el-table :data="file" border size="mini" v-loading="tableLoading" :header-cell-style="{background:'#eef1f6',color:'#606266'}">
                            <el-table-column prop="label" v-model="file.label" align="center" label="名称" width="200px" fixed="fixed">
                            </el-table-column>
                            <el-table-column prop="fileType" v-model="file.fileType" align="center" label="类型" width="200px">
                            </el-table-column>
                            <el-table-column prop="remark" v-model="file.remark" align="center" label="备注" width="200px">
                            </el-table-column>
                            <el-table-column prop="fileOwner" v-model="file.fileOwner" align="center" label="所有者" width="200px">
                            </el-table-column>
                            <el-table-column prop="createDate" v-model="file.createDate" align="center" label="创建日期" width="200px">
                            </el-table-column>
                            <el-table-column fixed="right" label="操作" width="240">
                                <template slot-scope="scope">
                                    <el-button @click="showFile(scope.row)" type="primary" size="mini">查看附件</el-button>
                                    <el-button @click="editFile(scope.row)" type="success" size="mini" :disabled="ifButton">编辑</el-button>
                                    <el-button @click="deleteFile(scope.row)" type="danger" size="mini">删除</el-button>
                                </template>
                            </el-table-column>
                        </el-table>

                        <div v-if="showAccessoryFileTable">
                            <br>
                            <span>{{this.fileName}}文件的附件表</span>
                            <hr color="#20a0ff">
                            <el-table :data="accessoryFile" border size="mini" v-loading="tableLoading" :header-cell-style="{background:'#eef1f6',color:'#606266'}">
                                <el-table-column prop="accessoryName" v-model="file.label" align="center" label="名称" width="200px" fixed="fixed">
                                </el-table-column>
                                <el-table-column prop="accessoryTypeName" v-model="file.fileType" align="center" label="类型" width="200px">
                                </el-table-column>
                                <el-table-column prop="accessorySize" v-model="file.remark" align="center" label="大小（KB）" width="200px">
                                </el-table-column>
                                <el-table-column prop="accessoryPath" v-model="file.fileOwner" align="center" label="路径" width="200px">
                                </el-table-column>
                                <el-table-column prop="createDate" v-model="file.createDate" align="center" label="创建日期" width="200px">
                                </el-table-column>
                                <el-table-column fixed="right" label="操作" width="240">
                                    <template slot-scope="scope">
                                        <el-button @click="showAccessoryFile(scope.row)" type="primary" size="mini">查看属性</el-button>
                                        <el-button @click="downLoadAccessoryFile(scope.row)" type="success" size="mini">下载</el-button>
                                        <el-button @click="deleteAccessoryFile(scope.row)" type="danger" size="mini">删除</el-button>
                                    </template>
                                </el-table-column>
                            </el-table>
                        </div>
                        

                        <!--搜索功能弹窗-->
                        <el-dialog :visible.sync="dialogSearch">
                            <!--外层容器-->
                            <el-container>
                                <!--顶栏容器-->
                                <el-header>
                                    <!--标题-->
                                    <div>
                                        <el-header class="header">
                                            搜索
                                            <hr width="300px" color="#20a0ff">
                                        </el-header>
                                    </div>
                                </el-header>

                                <!--主要区域容器-->
                                <el-main>
                                </el-main>
                            </el-container>
                        </el-dialog>

                        <!--新增文件夹弹窗-->
                        <el-dialog :visible.sync="dialogAddFolder">
                            <!--外层容器-->
                            <el-container>
                                <!--顶栏容器-->
                                <el-header>
                                    <!--标题-->
                                    <div>
                                        <el-header class="header">
                                            {{dialogFolderName}}
                                            <hr width="300px" color="#20a0ff">
                                        </el-header>
                                    </div>
                                </el-header>

                                <!--主要区域容器-->
                                <el-main>
                                    <el-row>
                                        <el-col span="4">
                                            <span><i class="el-icon-folder" ></i>文件夹名称:</span>
                                        </el-col>
                                        <el-col span="20"> 
                                            <el-input v-model="folderData.label" style="width:100%" size="mini" placeholder="请输入文件夹名称"></el-input>
                                        </el-col>
                                    </el-row>

                                    <br>

                                    <el-row>
                                        <el-col span="4">
                                            <span><i class="el-icon-location-outline"></i>位置：</span>
                                        </el-col>
                                        <el-col span="20">
                                            <span>{{this.allData.filePath}}</span>
                                        </el-col>
                                    </el-row>

                                    <br>

                                    <el-row>
                                        <el-col span="4">
                                            <span><i class="el-icon-edit"></i>备注：</span>
                                        </el-col>
                                        <el-col span="20">
                                            <el-input v-model="folderData.remark" type="textarea" :rows="3" placeholder="请输入备注内容" size="mini"></el-input>
                                        </el-col>
                                    </el-row>

                                    <br>

                                    <el-row>
                                        <el-col span="12">
                                            <span>创建时间：{{getCurrentDate()}}</span>
                                        </el-col>
                                        <el-col span="12">
                                            <span>所有者：{{this.$store.state.user.roles[0].roleName}}</span>
                                        </el-col>
                                    </el-row>

                                    <br>

                                    <el-row>
                                        <br>
                                        <hr style="color: #20a0ff">
                                        <br>
                                        <el-col span="12">
                                            <el-button type="primary" size="mini" @click="addFolder">
                                                保存
                                            </el-button>
                                        </el-col>
                                        <el-col span="12">
                                            <el-button type="danger" size="mini" @click="cancleFolder">
                                                退出
                                            </el-button>
                                        </el-col>
                                    </el-row>
                                </el-main>
                            </el-container>
                        </el-dialog>

                        <!--新增文件(文件属性)弹窗-->
                        <el-dialog :visible.sync="dialogAddFile">
                            <!--外层容器-->
                            <el-container>
                                <!--顶栏容器-->
                                <el-header>
                                    <!--标题-->
                                    <div>
                                        <el-header class="header">
                                            {{dialogFileName}}
                                            <hr width="300px" color="#20a0ff">
                                        </el-header>
                                    </div>
                                </el-header>

                                <!--主要区域容器-->
                                <el-main>
                                    <el-row>
                                        <el-col span="4">
                                            <span><i class="el-icon-folder" ></i>文件名：</span>
                                        </el-col>
                                        <el-col span="20">
                                            <el-input v-model="oneAccessoryFile.label" size="mini" placeholder="请输入文件名"></el-input>
                                        </el-col>
                                    </el-row>
                                    <br>
                                    <el-row>
                                        <el-col span="4">
                                            <span><i class="el-icon-location-outline"></i>位置：</span>
                                        </el-col>
                                        <el-col span="20">
                                            <span>{{this.allData.filePath}}</span>
                                        </el-col>
                                    </el-row>
                                    <br>
                                    <el-row>
                                        <el-col span="4">
                                            <span><i class="el-icon-edit" ></i>备注：</span>
                                        </el-col>
                                        <el-col span="20">
                                            <el-input v-model="oneAccessoryFile.remark" type="textarea" :rows="3" placeholder="请输入备注内容" size="mini"></el-input>
                                        </el-col>
                                    </el-row>
                                    <br>
                                    <hr style="color: #20a0ff">
                                    <el-row>
                                        <el-col span="12">
                                            <span>创建时间：{{getCurrentDate()}}</span>
                                        </el-col>
                                        <el-col span="12">
                                            <span>所有者：{{this.$store.state.user.roles[0].roleName}}</span>
                                        </el-col>
                                    </el-row>
                                    <br>
                                    <el-row>
                                        <el-col span="4">
                                            <span>文件图标>></span>
                                        </el-col>
                                        <el-col span="20">
                                            <template>
                                                <el-radio-group v-model="radio">
                                                    <el-radio :label="1">备选</el-radio>
                                                    <el-radio :label="2">备选</el-radio>
                                                    <el-radio :label="3">备选</el-radio>
                                                    <el-radio :label="4">备选</el-radio>
                                                    <el-radio :label="5">备选</el-radio>
                                                    <el-radio :label="6">备选</el-radio>
                                                    <el-radio :label="7">备选</el-radio>
                                                    <el-radio :label="8">备选</el-radio>
                                                    <el-radio :label="9">备选</el-radio>
                                                    <el-radio :label="10">备选</el-radio>
                                                    <el-radio :label="11">备选</el-radio>
                                                    <el-radio :label="12">备选</el-radio>
                                                </el-radio-group>
                                            </template>
                                        </el-col>
                                    </el-row>
                                    <br>
                                    <hr style="color: #20a0ff">
                                    <el-row v-if="showTable">
                                        <el-col>
                                            <el-table  border stripe size="mini" sytle="width: 100%" :data="oneAccessoryFileData" :header-cell-style="{background:'#eef1f6',color:'#606266'}">
                                                <el-table-column
                                                    prop="accessoryName"
                                                    label="名称"
                                                    align="center"
                                                    width="150">
                                                </el-table-column>
                                                <el-table-column
                                                    prop="accessorySize"
                                                    label="大小（KB）"
                                                    align="center"
                                                    width="100">
                                                </el-table-column>
                                                <el-table-column
                                                    prop="accessoryTypeName"
                                                    label="类型"
                                                    align="center"
                                                    width="100">
                                                </el-table-column>
                                                <el-table-column
                                                    prop="createDate"
                                                    label="创建日期"
                                                    align="center"
                                                    width="150">
                                                </el-table-column>
                                                <el-table-column
                                                    label="操作"
                                                    align="center"
                                                    width="150"
                                                    fixed="right">
                                                    <template slot-scope="scope">
                                                        <el-button @click="deleteAccessoryFile(scope.row)" type="danger" size="mini">删除</el-button>
                                                        <el-button @click="downLoadAccessoryFile(scope.row)" type="success" size="mini">下载</el-button>
                                                    </template>
                                                </el-table-column>
                                            </el-table>
                                        </el-col>
                                    </el-row>
                                    <el-row>
                                        <span style="color: green">操作提示：请在文件名处单击右键，并选取“目标另存为”以下载文件！</span>
                                    </el-row>
                                    <br>
                                    <el-row>
                                        <el-col span="4">
                                            <span><i class="el-icon-folder"></i>上传附件</span>
                                        </el-col>
                                    </el-row>
                                    <el-row>
                                        <el-col span="6">
                                            <el-upload
                                                class="upload-demo"
                                                ref="upload"
                                                action="/file/filemanagement/addAccessoryToDesk"
                                                :data="upLoadData"
                                                :before-upload="handleBefore"
                                                :on-preview="handlePreview"
                                                :on-remove="handleRemove"
                                                :file-list="fileList"
                                                :auto-upload="false">
                                                <el-button slot="trigger" size="small" type="primary">浏览...</el-button>
                                                <el-button style="margin-left: 10px;" size="small" type="success" @click="submitUpload">上传</el-button>
                                            </el-upload>
                                        </el-col>
                                    </el-row>
                                    <br>
                                    <hr style="color: #20a0ff">
                                    <el-row>
                                        <el-col span="12">
                                            <el-button size="mini" type="primary" @click="addFile">保存</el-button>
                                        </el-col>
                                        <el-col span="12">
                                            <el-button size="mini" type="danger" @click="cancleFile">退出</el-button>
                                        </el-col>
                                    </el-row>
                                </el-main>
                            </el-container>
                        </el-dialog>

                        <!--查看功能弹窗-->
                        <el-dialog :visible.sync="dialogFileInfo">
                            <!--外层容器-->
                            <el-container>
                                <!--顶栏容器-->
                                <el-header>
                                    <!--标题-->
                                    <div>
                                        <el-header class="header">
                                            文件属性
                                            <hr width="300px" color="#20a0ff">
                                        </el-header>
                                    </div>
                                </el-header>

                                <!--主要区域容器-->
                                <el-main>
                                </el-main>
                            </el-container>
                        </el-dialog>

                        <!--编辑功能弹窗-->
                        <el-dialog :visible.sync="dialogEdit">
                            <!--外层容器-->
                            <el-container>
                                <!--顶栏容器-->
                                <el-header>
                                    <!--标题-->
                                    <div>
                                        <el-header class="header">
                                            编辑
                                            <hr width="300px" color="#20a0ff">
                                        </el-header>
                                    </div>
                                </el-header>

                                <!--主要区域容器-->
                                <el-main>
                                </el-main>
                            </el-container>
                        </el-dialog>
                    </el-main>
                </el-main>
            </el-container>
        </el-main>
    </el-container>
</template>

<!--逻辑-->
<script>
export default {
    data() {
      return {
        treeData: [],
        file: [],
        allData: [],

        address: '',
        formLabelWidth: '120px',
        tableLoading: false,
        defaultProps: {
          children: 'children',
          label: 'label'
        },

        dialogSearch: false,
        dialogAddFolder: false,
        dialogAddFile: false,
        dialogFileInfo: false,
        dialogEdit: false,

        radio: '',//单选结果：radio和label值相同
        fileList: [],
        showTable: false,
        dialogFileName: '',
        dialogFolderName: '',
        showAccessoryFileTable: false,
        accessoryFile: [],

        fileName: '',

        oneAccessoryFile: {
            //文件信息
            label: '',
            filePath: '',
            remark: '',

            //附件信息
            accessoryId: '',
            accessoryName: '',
            accessoryPath: '',
            accessorySize: '',
            accessoryType: '',
            accessoryTypeName: '',
            createDate: '',
            fileId: ''
        },

        oneAccessoryFileData: [],

        folderData: {
            createDate: '',
            fileId: '',
            fileOwner: '',
            filePath: '',
            fileType: '',
            label: '',
            parentId: '',
            remark: ''
        },

        showFileRow: [],//缓存table的row

        treeClickData: [],//缓存tree节点下的data

        ifButton: false,

        //上传某附件的地址
        upLoadData: {
            accessoryPath: ''
        },

        //请求下载某附件的地址
        download: {
            filePath: ''
        },

        //文件类型数据：12种文件类型
        fileTypeData: [
            {
                id: 11,
                type: 'text/plain'

            },
            {
                id: 12,
                type: 'application/msword'

            },
            {
                id: 13,
                type: 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet'

            },
            {
                id: 14,
                type: 'application/vnd.openxmlformats-officedocument.presentationml.presentation'

            },
            {
                id: 15,
                type: 'application/pdf'

            },
            {
                id: 16,
                type: 'image/jpeg'

            },
            {
                id: 17,
                type: '附件1'

            },
            {
                id: 18,
                type: '附件1'

            },
            {
                id: 19,
                type: '附件1'

            },
            {
                id: 20,
                type: '附件1'

            },
            {
                id: 21,
                type: '附件1'

            },
            {
                id: 22,
                type: '附件1'

            },
        ]

        
      }
    },
    mounted: function() {
        this.allData.parentId = 1
        this.allData.filePath = 'D:\\\\MyOffice\\\\文档管理\\\\公共文档'
        this.getTreeMenu();
        //this.initData();
    },
    methods: {
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
        //初始化动态获取树形文档目录
        getTreeMenu(){
            this.postRequest("/menu/menuTree").then(resp => {
                if (resp && resp.status == 200) {
                    this.treeData = resp.data.obj;
                    console.log("testTreeData",resp)
                }
            })
        },

        //点击树形结构的某节点，获取该节点下的所有数据，牛逼！
        handleNodeClick(data) {
            this.treeClickData = data
            console.log("treeMessageData",data)
            this.allData = data
            this.file = data.children
            this.showAccessoryFileTable = false

        },

        //加载树形菜单下的节点菜单
        loadTreeTable(data){
            this.file = data.children
        },

        //初始化搜索表格的数据
        initData: function() {
            this.getRequest("/person/depart/getalldepartinfo").then(resp => {
                if (resp && resp.status == 200) {
                    this.tableData = resp.data;
                }
            })
        },

        //后退
        back(){

        },

        //返回根目录
        backRoot(){
            this.$router.go('/file/file/FileTree')
        },

        //搜索
        searchFile(){

        },

        //查看文件下的附件列表
        showFile(row){
            this.showFileRow = row
            if(row.fileType == 1){//如果类型为文件夹，则不可以查看文件属性，用提示框进行提示
                this.$message.warning(`当前为文件夹，无法查看附件（只有文件可以查看附件）！`);
            }else{//如果类型为文件，则可以查看该文件下的附件列表
                //this.dialogFileName = '文件属性'
                //this.dialogAddFile = true
                //this.showTable = true

                this.fileName = row.label

                //缓存该文件的基本信息
                this.oneAccessoryFile.label = row.label
                this.oneAccessoryFile.filePath = row.filePath
                this.oneAccessoryFile.remark = row.remark
                this.oneAccessoryFile.fileId = row.fileId 

                var datas = {
                    "fileId": this.oneAccessoryFile.fileId
                }
                this.postRequest("/file/filemanagement/listAccessory", datas).then(resp => {
                    if (resp && resp.status == 200) {
                            
                        console.log("accessoryFile",resp);
                        this.accessoryFile = resp.data.obj;

                        if(this.accessoryFile.length === 0){//该文件下没有附件
                            this.$message.warning(`该文件没有附件，请点击编辑，进行添加附件操作！`);
                        }else{//该文件下有附件
                            this.showAccessoryFileTable = !this.showAccessoryFileTable
                        }
                    }
                })

                
            
            }
            
        },

        //删除文件或者文件夹
        deleteFile(row){
            this.$confirm('此操作将永久删除[' + row.label + ']，是否继续?', '提示', {
            confirmButtonText: '确定',
            cancelButtonText: '取消',
            type: 'warning'
            }).then(() => {
                var datas = {
                    "fileId": row.fileId,
                    "parentId": row.parentId
                }
                this.postRequest("/file/filemanagement/MoveFileToRecycleBin",datas).then(resp => {
                    if (resp && resp.status == 200) {
                        //刷新
                        this.getTreeMenu()
                        //this.handleNodeClick(this.treeClickData)
                        //this.loadTreeTable(this.treeClickData)
                    }
                })
            }) 
            
            
            
        },

        //查看附件属性
        showAccessoryFile(row){
            this.dialogFileName = '文件属性'
            this.dialogAddFile = true
            this.showTable = true
            this.oneAccessoryFile.accessoryId = row.accessoryId
            this.oneAccessoryFile.accessoryName = row.accessoryName
            this.oneAccessoryFile.accessoryPath = row.accessoryPath
            this.oneAccessoryFile.accessorySize = row.accessorySize
            this.oneAccessoryFile.accessoryType = row.accessoryType
            this.oneAccessoryFile.accessoryTypeName = row.accessoryTypeName
            this.oneAccessoryFile.createDate = row.createDate
            this.oneAccessoryFile.fileId = row.fileId

            this.oneAccessoryFileData.push(this.oneAccessoryFile)
        },

        //清空文件缓存
        emptyFile(){
            //清空文件基本信息
            this.oneAccessoryFile.label = ''
            //this.oneAccessoryFile.filePath = ''
            this.oneAccessoryFile.remark = ''
        },

        //清空缓存
        emptyAccessoryFile(){
            //清空文件基本信息
            //this.oneAccessoryFile.label = ''
            //this.oneAccessoryFile.filePath = ''
            //this.oneAccessoryFile.remark = ''

            //清空附件基本信息
            this.oneAccessoryFile.accessoryId = ''
            this.oneAccessoryFile.accessoryName = ''
            this.oneAccessoryFile.accessoryPath = ''
            this.oneAccessoryFile.accessorySize = ''
            this.oneAccessoryFile.accessoryType = ''
            this.oneAccessoryFile.accessoryTypeName = ''
            this.oneAccessoryFile.createDate = ''
            //文件id
            this.oneAccessoryFile.fileId = ''

            this.oneAccessoryFileData.pop()

            //清空文件夹基本信息
            this.folderData.createDate = ''
            this.folderData.fileId = ''
            this.folderData.fileOwner = ''
            this.folderData.filePath = ''
            this.folderData.fileType = ''
            this.folderData.label = ''
            this.folderData.parentId = ''
            this.folderData.remark = ''

            //清空上传的文件
            this.fileList.pop()
        },

        //编辑文件夹或者文件属性
        editFile(row){
            if(row.fileType === 1){//如果为文件夹
                this.dialogFolderName = '修改文件夹'
                this.dialogAddFolder = true

                this.folderData.label = row.label
                this.folderData.createDate = row.createDate
                this.folderData.fileId = row.fileId
                this.folderData.fileOwner = row.fileOwner
                this.folderData.filePath = row.filePath
                this.folderData.fileType = row.fileType
                this.folderData.parentId = row.parentId
                this.folderData.remark = row.remark

            }else{//如果为文件
                //附件信息
                this.oneAccessoryFile.accessoryId = row.accessoryId
                this.oneAccessoryFile.accessoryName = row.accessoryName
                this.oneAccessoryFile.accessoryPath = row.accessoryPath
                this.oneAccessoryFile.accessorySize = row.accessorySize
                this.oneAccessoryFile.accessoryType = row.accessoryType
                this.oneAccessoryFile.accessoryTypeName = row.accessoryTypeName
                this.oneAccessoryFile.createDate = row.createDate

                //文件id
                this.oneAccessoryFile.fileId = row.fileId 

                var datas = {
                    "fileId": this.oneAccessoryFile.fileId
                }
                this.postRequest("/file/filemanagement/listAccessory", datas).then(resp => {
                    if (resp && resp.status == 200) {
                                
                        console.log("accessoryFile",resp);
                        this.accessoryFile = resp.data.obj;

                        if(this.accessoryFile.length === 0){//该文件下没有附件
                            this.dialogFileName = '编辑文件属性'
                            this.dialogAddFile = true

                            //文件信息
                            this.oneAccessoryFile.label = row.label
                            this.oneAccessoryFile.filePath = row.filePath
                            this.oneAccessoryFile.remark = row.remark

                        }else{//该文件下有附件，提示不可用
                            this.$message.warning(`该文件下有附件，不可编辑，可以点击‘查看附件’进行编辑操作！`);
                        }
                    }
                })

            }


        },

        //删除附件
        deleteAccessoryFile(row){
            this.$confirm('此操作将永久删除[' + row.accessoryName + ']，是否继续?', '提示', {
            confirmButtonText: '确定',
            cancelButtonText: '取消',
            type: 'warning'
            }).then(() => {
                var datas = {
                    "accessoryId": row.accessoryId,
                    "accessoryPathAndName": row.accessoryPath,
                }
                this.postRequest("/file/filemanagement/deleteAccessory",datas).then(resp => {
                    if (resp && resp.status == 200) {
                        //刷新
                        this.showFile(this.showFileRow)
                        this.showAccessoryFileTable = true
                    }
                })
            }) 

            

        },

        //添加文件夹
        addFolder(){
            this.dialogAddFolder = false

            if(this.folderData.fileId === ''){//如果文件夹id为空，则为添加文件夹
                this.folderData.filePath = this.allData.filePath
                this.folderData.fileId = this.allData.fileId
                
                var datas = {
                    "createDate": this.getCurrentDate(),
                    "fileId": null,
                    "fileOwner": this.$store.state.user.roles[0].roleName,
                    "filePath": this.folderData.filePath,
                    "fileType": 1,
                    "label": this.folderData.label,
                    "parentId": this.folderData.fileId,
                    "remark": this.folderData.remark
                }
                this.postRequest("/file/filemanagement/addFile",datas).then(resp => {
                    if (resp && resp.status == 200) {
                        //刷新
                        this.getTreeMenu() 
                    }
                })
                this.emptyAccessoryFile()

            }else{//如果文件夹id不为空，则为编辑（修改）文件夹
                var datas = {
                    "fileId": this.folderData.fileId,
                    "label": this.folderData.label,
                    "remark": this.folderData.remark
                }
                this.postRequest("/file/filemanagement/editFile",datas).then(resp => {
                    if (resp && resp.status == 200) {
                        //刷新
                        this.getTreeMenu() 
                    }
                })
                this.emptyAccessoryFile()
            }

        },

        //取消添加文件夹
        cancleFolder(){
            this.dialogAddFolder = false
            this.emptyAccessoryFile()
        },

        //添加文件
        addFile(){
            this.dialogAddFile = false
            this.showTable = false

            if(this.oneAccessoryFile.fileId === ''){
                //this.oneAccessoryFile.filePath = this.allData.filePath
                // //先添加文件
                // var datas = {
                //     "createDate": this.getCurrentDate(),
                //     "fileId": null,
                //     "fileOwner": this.$store.state.user.roles[0].roleName,
                //     "filePath": this.oneAccessoryFile.filePath,
                //     "fileType": 2,
                //     "label": this.oneAccessoryFile.label,
                //     "parentId": this.allData.fileId,
                //     "remark": this.oneAccessoryFile.remark
                // }
                // this.postRequest("/file/filemanagement/addFile",datas).then(resp => {
                //     if (resp && resp.status == 200) {
                //         //刷新
                //         this.getTreeMenu()     
                //     }
                // })

                //再添加附件
                var accessoryFileData = {
                    "accessoryName": this.oneAccessoryFile.accessoryName,
                    "accessoryPath": this.oneAccessoryFile.filePath+"\\\\"+this.oneAccessoryFile.label+"\\\\"+this.oneAccessoryFile.accessoryName,
                    "accessorySize": this.oneAccessoryFile.accessorySize,
                    "accessoryType": this.oneAccessoryFile.accessoryType,
                    "createDate": this.getCurrentDate(),
                    "fileId": null
                }
                this.postRequest("/file/filemanagement/addAccessoryToDb",accessoryFileData).then(resp => {
                    if (resp && resp.status == 200) {
                        //刷新
                        this.getTreeMenu() 
                        //刷新
                        //this.showFile(this.showFileRow)
                        //this.showAccessoryFileTable = true
                    }
                })
            }else{
                //文件已存在，只需要添加附件
                var accessoryFileData = {
                    "accessoryName": this.oneAccessoryFile.accessoryName,
                    "accessoryPath": this.oneAccessoryFile.filePath+"\\\\"+this.oneAccessoryFile.accessoryName,
                    "accessorySize": this.oneAccessoryFile.accessorySize,
                    "accessoryType": this.oneAccessoryFile.accessoryType,
                    "createDate": this.getCurrentDate(),
                    "fileId": this.oneAccessoryFile.fileId
                }
                this.postRequest("/file/filemanagement/addAccessoryToDbHasFileId",accessoryFileData).then(resp => {
                    if (resp && resp.status == 200) {
                        //刷新
                        this.getTreeMenu()  
                        //刷新
                        //this.showFile(this.showFileRow)
                        //this.showAccessoryFileTable = true   
                    }
                })
            }

            

            this.emptyAccessoryFile()
        },

        //取消添加文件
        cancleFile(){
            this.dialogAddFile = false
            this.showTable = false
            
            if(this.oneAccessoryFile.fileId === ''){//如果文件还未创建的情况下
                //删除文件在数据库的记录，删除已经上传到磁盘上的附件
                var datas = {
                    "accessoryPathAndName": this.upLoadData.accessoryPath,
                    "filePathAndName": this.oneAccessoryFile.filePath
                }
                this.postRequest("/file/filemanagement/exitTwo",datas).then(resp => {
                    if (resp && resp.status == 200) {
                        //刷新
                        this.getTreeMenu()  
                        //刷新
                        // this.showFile(this.showFileRow)
                        // this.showAccessoryFileTable = true   
                    }
                })

                //清空数据缓存
                this.emptyAccessoryFile()
                
            }else{//如果文件事先已经创建或者在点击了上传按钮后，文件创建了的情况下
                //删除磁盘中的附件
                var datas = {
                    "accessoryId": this.oneAccessoryFile.accessoryId,
                    "accessoryPathAndName": this.upLoadData.accessoryPath
                }
                this.postRequest("/file/filemanagement/exit",datas).then(resp => {
                    if (resp && resp.status == 200) {
                        //刷新
                        this.getTreeMenu()  
                        //刷新
                        // this.showFile(this.showFileRow)
                        // this.showAccessoryFileTable = true   
                    }
                })

                //清空数据缓存
                this.emptyAccessoryFile()
            }

            
        },

        //上传附件相关函数
        //submit	手动上传文件列表
        submitUpload() {
            //上传之前先判断文件是否存在
            if(this.oneAccessoryFile.fileId === ''){//文件不存在
                this.oneAccessoryFile.filePath = this.allData.filePath
                //先添加文件
                var datas = {
                    "createDate": this.getCurrentDate(),
                    "fileId": null,
                    "fileOwner": this.$store.state.user.roles[0].roleName,
                    "filePath": this.oneAccessoryFile.filePath,
                    "fileType": 2, 
                    "label": this.oneAccessoryFile.label,
                    "parentId": this.allData.fileId,
                    "remark": this.oneAccessoryFile.remark
                }
                this.postRequest("/file/filemanagement/addFile",datas).then(resp => {
                    if (resp && resp.status == 200) {
                        //如果这句话不写，则附件地址是错误的
                        this.oneAccessoryFile.filePath = this.oneAccessoryFile.filePath+'\\\\'+this.oneAccessoryFile.label
                        //上传之前还应该判断一下文件列表是否为空

                        this.$refs.upload.submit();
                        this.showTable = true



                        this.oneAccessoryFileData.push(this.oneAccessoryFile)

                        //刷新
                        this.getTreeMenu()     
                    }
                })
                
                
            }else{//文件存在
                //上传之前还应该判断一下文件列表是否为空

                this.$refs.upload.submit();
                this.showTable = true

                this.oneAccessoryFileData.push(this.oneAccessoryFile)
            }
            
            
        },
        //on-remove	文件列表移除文件时的钩子
        handleRemove(file, fileList) {
            console.log(file, fileList);
        },
        //on-preview	点击文件列表中已上传的文件时的钩子
        handlePreview(file) {
            console.log(file);
        },

        //before-upload 文件上传前的执行操作
        //获得附件的地址：文件所在地址+文件名+附件名
        handleBefore(file){
            
            //this.oneAccessoryFile.accessoryType = file.type

            this.oneAccessoryFile.accessoryTypeName = file.type

            for(var i = 0;i<this.fileTypeData.length;i++){
                if(file.type === this.fileTypeData[i].type ){
                    this.oneAccessoryFile.accessoryType = this.fileTypeData[i].id;
                    break;
                }
            }

            this.oneAccessoryFile.accessorySize = file.size/1024
            this.oneAccessoryFile.accessoryName = file.name
            this.upLoadData.accessoryPath = this.oneAccessoryFile.filePath+'\\\\'+file.name
            console.log("附件路径",this.oneAccessoryFile.accessoryType)
            //return this.upLoadData.accessoryFilePat
            
        },

        //下载附件
        downLoadAccessoryFile(row){

            console.log("accessoryPath",row.accessoryPath)

            // this.download.filePath = row.accessoryPath
            
            // this.getRequest("/file/filemanagement/testDownload",this.download).then(resp => {
            //     if (resp && resp.status == 200) {
            //         this.$message({type: 'success', message: "下载成功！"});
            //     }
            // })

            //第二种方式通过创建iframe的方式
            var elemIF = document.createElement('iframe')
            elemIF.src = '/file/filemanagement/testDownload?filePath=' + row.accessoryPath 
            elemIF.style.display = 'none'
            document.body.appendChild(elemIF)

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