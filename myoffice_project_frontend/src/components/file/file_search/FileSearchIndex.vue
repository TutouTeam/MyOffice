<!--内容-->
<template>
    <div>
        <div>
            <el-header style="font-size:20px;">
                文&nbsp;件&nbsp;搜&nbsp;索
                <hr width="100%" style="color:rgb(198,198,198)">
            </el-header>
        </div>
      <el-form ref="searchfile">
        <div>
            <el-col :span="6" style="border:1px;">
                <el-row>
                    <p style="text-align:left;margin-left:9px;"><i class="el-icon-search"></i>文件搜索</p>
                </el-row>
                <el-row>
                    <p style="text-align:left;margin-left:9px;">要搜索的文件名：</p>
                </el-row>
                <el-row>
                    <el-input style="width: 240px;margin-right: 60px;padding: 0px;" size="mini" v-model="file.label"></el-input>
                </el-row>
                <el-row>
                    <p style="text-align:left;margin-left:9px;">附件包含的文字：</p>
                </el-row>
                <el-row>
                    <el-input style="width: 240px;margin-right: 60px;padding: 0px;" size="mini" disabled></el-input>
                </el-row>
                <el-row>
                    <p style="text-align:left;margin-left:9px;">创建者姓名：</p>
                </el-row>
                <el-row>
                    <el-input style="width: 240px;margin-right: 60px;padding: 0px;" size="mini" v-model="file.fileOwner"></el-input>
                </el-row>
                <el-row>
                <div>
                  <el-form-item>
                   <el-button  
                    type="primary" 
                    size="mini" 
                    style="margin-top: 30px;"
                    @click="goSearch()">
                    立即搜索
                   </el-button>
                   <el-button  
                    type="primary" 
                    size="mini" 
                    style="margin-top: 30px;"
                    @click="goBack()">
                     退出
                   </el-button>
                  </el-form-item>
                </div>
                </el-row>
                <el-row>
                  <div style="text-align:left;">搜索选项<i @click="searchOptions()" class="el-icon-d-arrow-right"></i></div>
                  <div v-if="searchOption">
                    <el-date-picker
                      size="mini"
                      v-model="dateScope"
                      type="daterange"
                      align="right"
                      unlink-panels
                      range-separator="至"
                      start-placeholder="开始日期"
                      end-placeholder="结束日期"
                      value-format="yyyy-MM-dd">
                    </el-date-picker>
                    <el-form-item style="margin-left:35px;">
                     <el-radio-group v-model="datevalue">
                      <el-radio @click.native.prevent="clickitem(1)" :label="1">本日</el-radio>
                      <el-radio @click.native.prevent="clickitem(2)" :label="2">本周</el-radio>
                      <el-radio @click.native.prevent="clickitem(3)" :label="3">本月</el-radio>
                     </el-radio-group>
                    </el-form-item>
                  </div>
                </el-row>
            </el-col>
            <el-col :span="18">
                <el-table
                v-if="searchList"
                :data="files"
                border
                stripe
                size="mini"
                style="width: 100%">
                <el-table-column
                    prop="label"
                    label="文件名称"
                    width="140"
                    align="center">
                    <template slot-scope="scope">
                      <div style="cursor:pointer;" @click="getMore(scope.row)">{{ scope.row.label }}</div>
                    </template>
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
                    prop="createDate"
                    label="删除日期"
                    width="180"
                    align="center">
                </el-table-column>
                </el-table>
                <!--详细信息框-->
                <div v-if="moreSearchList" style="text-align:left;">
                    <el-form>
                        <el-form-item label="文件名：">
                            <span >{{this.message.label}}</span>
                        </el-form-item>
                        <el-form-item label="文件路径：">
                            <span >{{this.message.filePath}}</span>
                        </el-form-item>
                        <el-form-item label="备注：">
                            <span>{{this.message.remark}}</span>
                        </el-form-item>
                        <el-form-item label="创建时间：">
                            <span>{{this.message.createDate}}</span>
                        </el-form-item>
                        <el-form-item label="创建者：">
                            <span>{{this.message.fileOwner}}</span>
                        </el-form-item>
                    </el-form>
                  <el-table
                    :data="annexs"
                    border
                    stripe
                    size="mini"
                    style="width: 100%">
                <el-table-column
                    prop="accessoryName"
                    label="名称"
                    width="280"
                    align="center">
                    <!-- <template slot-scope="scope">
                      <div style="text-decoration:underline;cursor:pointer;" @click="getBack(scope.row)"></div>
                    </template> -->
                </el-table-column>
                <el-table-column
                    prop="accessorySize"
                    label="大小(KB)"
                    width=""
                    align="center">
                </el-table-column>
                <el-table-column
                    prop="accessoryType"
                    label="类型"
                    width="120"
                    align="center">
                </el-table-column>
                <el-table-column
                    prop="createDate"
                    label="创建日期"
                    width="320"
                    align="center">
                </el-table-column>
                <el-table-column
                    label="操作"
                    width="100"
                    align="center">
                    <template slot-scope="scope">
                        <!--还原按钮-->
                        <el-button type="primary" @click="download(scope.row)" style="padding: 3px 4px 3px 4px;margin: 2px"
                           size="mini">
                           下载<i class="el-icon-download" ></i>
                        </el-button>
                    </template>
                </el-table-column>
                </el-table>
                </div>
            </el-col>
        </div>
      </el-form>
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
                remark:'',
                filePath:'',
                fileType:'',
                fileOwner:'',
                createDate:''
            },
            files:[],
            annex:{
                accessoryName:'',
                accessorySize:'',
                accessoryType:'',
                createDate:'',
                accessoryPath:''
            },
            annexs:[],
            message:{
                fileId:'',
                label:'',
                remark:'',
                filePath:'',
                fileType:'',
                fileOwner:'',
                createDate:''
            },
            dateScope:'',
            datevalue:'',
            searchOption:false,
            searchList:false,
            moreSearchList:false,
        }
    },
    methods:{
        searchOptions(){
            this.searchOption=!this.searchOption;
        },
        goSearch(){
            var _this = this;
            _this.searchList=true;
            this.moreSearchList=false;
            var datas = {
              "createDate":"",
              "endDate": _this.dateScope[1],
              "fileOwner": _this.file.fileOwner,
              "label": _this.file.label,
              "limit": _this.datevalue,
              "startDate": _this.dateScope[0]
            }
            this.postRequest("/file/filemanagement/fileSearch",datas).then(resp =>{
                
                if(resp.data && resp.status == 200){
                    this.files=resp.data.obj;
                    console.log("111111111111111111",resp)
                }
            })
        },
        clickitem (e) {
           e === this.datevalue ? this.datevalue = '' : this.datevalue = e
        },
        getMore(row){
            this.searchList=false;
            this.moreSearchList=true;
            var _this = this;
            var datas = {
              "fileId":row.fileId
            }
            this.postRequest("/file/filemanagement/listAccessory",datas).then(resp =>{
                if(resp.data && resp.status == 200){
                    this.annexs=resp.data.obj;
                }
            });
            this.postRequest("/file/filemanagement/fileDetail",datas).then(resp =>{
                if(resp.data && resp.status == 200){
                    console.log(resp);
                    this.message.label=resp.data.obj.label;
                    this.message.filePath=resp.data.obj.filePath;
                    this.message.remark=resp.data.obj.remark;
                    this.message.createDate=resp.data.obj.createDate;
                    this.message.fileOwner=resp.data.obj.fileOwner;
                }
            });
        },
        download(row){
            var elemIF = document.createElement('iframe')
            elemIF.src = '/file/filemanagement/testDownload?filePath='+ row.accessoryPath
            elemIF.style.display = 'none'
            document.body.appendChild(elemIF)
        },
        goBack(){
            this.searchList=false;
            this.moreSearchList=false;
            this.searchOption=false;
        }
    }
}
</script>

<!--样式-->
<style scoped>

</style>