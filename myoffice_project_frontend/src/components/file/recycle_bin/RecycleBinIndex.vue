<!--内容-->
<template>
    <div>
        <div>
            <el-header style="font-size:15px;">
                回&emsp;收&emsp;站
                <hr width="100%" style="color:rgb(198,198,198)">
            </el-header>
        </div>
        <div style="padding-left: 10px;padding-right: 40px;padding-top: 20px;margin-left:115px;">
            <el-table
                :data="files"
                border
                stripe
                size="mini"
                style="width: 90%">
                <el-table-column
                    prop="label"
                    label="文件名称"
                    width="140"
                    align="center">
                </el-table-column>
                <el-table-column
                    prop="filePath"
                    label="所在文件夹"
                    width=""
                    align="center">
                </el-table-column>
                <el-table-column
                    prop="fileType"
                    label="类型"
                    width="80"
                    align="center">
                </el-table-column>
                <el-table-column
                    prop="fileOwner"
                    label="操作者"
                    width="120"
                    align="center">
                </el-table-column>
                <el-table-column
                    prop="deleteDate"
                    label="删除日期"
                    width="180"
                    align="center">
                </el-table-column>
                <el-table-column
                    label="还原"
                    width="60"
                    align="center">
                    <template slot-scope="scope">
                        <!--还原按钮-->
                        <el-button @click="cancelDelete(scope.row)" style="padding: 3px 4px 3px 4px;margin: 2px"
                           size="mini">
                           <i class="el-icon-refresh-left" ></i>
                        </el-button>
                    </template>
                </el-table-column>
                <el-table-column
                    label="永久删除"
                    width="120"
                    align="center">
                    <template slot-scope="scope">
                        <!--永久删除按钮-->
                        <el-button type="danger" @click="deleteFile(scope.row)" style="padding: 3px 4px 3px 4px;margin: 2px"
                           size="mini">
                           <i class="el-icon-delete" ></i>
                        </el-button>
                    </template>
                </el-table-column>
            </el-table>
        </div>
    </div>
</template>

<!--逻辑-->
<script>
export default {
    data(){
        return{
            file:{
                fileId:'',
                label:'',
                filePath:'',
                fileType:'',
                fileOwner:'',
                deleteDate:''
            },
            files:[]
        }
    },
    mounted:function(){
        this.loadFile();
    },
    methods:{
        loadFile(){
            var _this = this;
            var datas = "";
            console.log("11111111111111111111111")
            this.postRequest("/file/filemanagement/listRecycleBin",datas).then(resp=> {
            this.tableLoading = false;
             if (resp.data && resp.status == 200) {
               _this.files = resp.data.obj;
            }
           })
        },
        cancelDelete(row){
            var datas = {
                fileId:row.fileId
            }
            this.postRequest("/file/filemanagement/fileReduction",datas).then(resp=> {
                if(resp.data && resp.status == 200){
                    this.loadFile();
                }
            })
        },
        deleteFile(row){
            var datas = {
                fileId:row.fileId
            }
            this.postRequest("/file/filemanagement/deleteFile",datas).then(resp=> {
                if(resp.data && resp.status == 200){
                    this.loadFile();
                }
            })
        }
    }
}
</script>

<!--样式-->
<style scoped>

</style>