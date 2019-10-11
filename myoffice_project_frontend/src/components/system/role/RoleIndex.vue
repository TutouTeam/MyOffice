<!--内容-->
<template>
    <div>
        <div>
            <el-header style="font-size:20px;">
                角色功能设置
                <hr width="100%" style="color:rgb(198,198,198)">
            </el-header>
        </div>
        <el-form>
            <div>
                <el-row>
                    <el-col :span="8"></el-col>
                    <el-col>
                        <p style="margin-right:230px;font-size:13px;">角色名称：</p>
                        <el-input 
                           v-model="role.roleName"
                           style="width: 240px;margin-right: 60px;padding: 0px;" 
                           size="mini"></el-input>
                        <p style="margin-right:230px;font-size:13px;">角色说明：</p>
                        <el-input 
                          v-model="role.roleDesc"
                          type="textarea"
                          autosize
                          style="width: 240px;margin-right: 60px;padding: 0px;"></el-input>
                          <div style="margin-right:70px;">
                          <el-form-item>
                              <el-button  
                              type="primary" 
                              size="mini" 
                              style="margin-top: 30px;margin-left:10px;"
                              @click="addRole()">
                              添加
                              </el-button>
                              <el-button  
                              type="primary" 
                              size="mini" 
                              style="margin-top: 30px;margin-left:20px;"
                              @click="updateRole()">
                              保存修改
                             </el-button>
                             <el-button  
                              type="primary" 
                              size="mini" 
                              style="margin-top: 30px;margin-left:20px;"
                              @click="clear()">
                              清空
                             </el-button>
                          </el-form-item>
                          </div>
                    </el-col>
                </el-row>
            </div>
        </el-form>
        <el-table
            :data="roles"
            size="mini"
            stripe
            border
            style="width:80%;margin-left:150px;">
            <el-table-column
                prop="roleName"
                label="角色名称"
                width="200"
                align="center">
            </el-table-column>
            <el-table-column
                prop="roleDesc"
                label="角色说明"
                width=""
                align="center">
            </el-table-column>
            <el-table-column
                label="修改"
                width="100"
                align="center">
                <template slot-scope="scope">
                        <el-button @click="goUpdateRole(scope.row)" style="padding: 3px 4px 3px 4px;margin: 2px"
                           size="mini">
                           <i class="el-icon-edit" ></i>
                        </el-button>
                </template>
            </el-table-column>
            <el-table-column
                label="删除"
                width="100"
                align="center">
                <template slot-scope="scope">
                        <el-button type="danger" style="padding: 3px 4px 3px 4px;margin: 2px" size="mini"
                           @click="deleteRole(scope.row)">
                           <i class="el-icon-delete"></i>
                        </el-button>
                    </template>
            </el-table-column>
            <el-table-column
                label="分配角色权限"
                width="180"
                align="center">
                 <template slot-scope="scope">
                      <div style="cursor:pointer;" @click="assignPer(scope.row)">分配权限</div>
                    </template>
            </el-table-column>
        </el-table>
        <el-dialog :title="dialogTitle" :visible.sync="dialogVisible" style="width:80%;">
          <div>
             <el-cascader
              v-model="role.nodeId"
              :options="options"
              :props="props"
              collapse-tags
              clearable
              size="mini"
              style="margin-right:100px;">
              </el-cascader>
              <el-button type="primary" style="margin-top:10px;height:30px;" size="mini"
                           @click="doAssignPer()">
                           确 认<i class="el-icon-delete"></i>
              </el-button>
          </div>
        </el-dialog>
    </div>
</template>

<!--逻辑-->
<script>
export default {
    data(){
        return{
        role:{
            roleId:'',
            roleName:'',
            roleDesc:'',
            nodeId:[],
            nodeIds:[]
        },
        yyy:[1,2],
        roles:[],
        props: { multiple: true },
        dialogTitle:'权限分配',
        dialogVisible:false,
        options:[{
          value: 2,
          label: '人事管理',
          children: [
            { value: 8,label: '机构信息'}, 
            { value: 9,label: '部门信息'}, 
            { value: 10,label: '员工信息'}
          ]
        }, {
          value: 3,
          label: '日程管理',
          children: [
            { value: 11,label: '我的日程'}, 
            { value: 12,label: '部门日程'}, 
            { value: 13,label: '我的便签'}
          ]
        }, {
          value: 4,
          label: '文档管理',
          children: [
            { value: 14,label: '文档管理'}, 
            { value: 15,label: '回收站'}, 
            { value: 16,label: '文件搜索'}
          ]
        }, {
          value: 5,
          label: '消息传递',
          children: [
            { value: 17,label: '消息管理'}, 
            { value: 18,label: '信箱'}
          ]
        }, {
          value: 6,
          label: '系统管理',
          children: [
            { value: 19,label: '角色管理'}, 
            { value: 20,label: '登录日志'}, 
            { value: 21,label: '操作日志'}, 
            { value: 22,label: '菜单排序'}
          ]
        }, {
          value: 7,
          label: '考勤系统',
          children: [
            { value: 23,label: '员工签到、签退'}, 
            { value: 24,label: '考勤历史查询'}, 
            { value: 25,label: '考勤统计'}
          ]
        }]
        }
    },
    mounted:function(){
        this.loadRole();
    },
    methods:{
        loadRole(){
            this.postRequest("/system/loginlog/roleList").then(resp=>{
                if(resp.data && resp.status ==200){
                    this.roles=resp.data.obj;
                    console.log(resp)
                }
            })
        },
        addRole(){
            var _this = this;
            var datas = {
                "roleId":"",
                "roleName":_this.role.roleName,
                "roleDesc":_this.role.roleDesc
            }
            this.postRequest("/system/loginlog/roleList/add",datas).then(resp=>{
                if(resp.data && resp.status ==200){
                    this.roles = resp.data.obj;
                    this.loadRole();
                }
            })
        },
        goUpdateRole(row){
            this.role.roleId = row.roleId;
            this.role.roleName=row.roleName;
            this.role.roleDesc=row.roleDesc;
            // console.log("row",row)
        },
        updateRole(){
            var _this = this;
            var datas = {
                "roleId":_this.role.roleId,
                "roleName":_this.role.roleName,
                "roleDesc":_this.role.roleDesc
            }
            this.postRequest("/system/loginlog/roleList/update",datas).then(resp=>{
                if(resp.data && resp.status ==200){
                    this.roles = resp.data.obj;
                    this.loadRole();
                }
            })
        },
        deleteRole(row){
          this.$confirm('你确定要删除'+row.roleName+'吗？', '提示', {
            confirmButtonText: '确定',
            cancelButtonText: '取消',
            type: 'warning'
            }).then(() => {
          this.doDeleteRole(row.roleId);
          }).catch(() => {
          });},
        doDeleteRole(oneRoleId){
            var _this = this;
            var datas = {
              roleId:oneRoleId
            };
            this.postRequest("/system/loginlog/roleList/delete",datas).then(resp=> {
              if (resp && resp.status == 200) {
                // this.$message({type: 'success', message: "删除成功！"});
                _this.loadRole();
              }
        })},
        assignPer(assrow){
            this.dialogVisible=true;
            this.role.roleId = assrow.roleId;
        },
        doAssignPer(){
          var length1 = this.role.nodeId.length;
          var length2 = this.yyy.length;
          for(var i=0;i<length1;i++){
             for(var j=0;j<length2;j++){
               this.role.nodeIds.push((this.role.nodeId[i])[j]);
             }
          }
          console.log(this.role.nodeIds);
          var datas = {
            "nodeIds":this.role.nodeIds,
            "roleId":this.role.roleId
          }
          this.postRequest("/system/loginlog/roleList/addPower",datas)
        },
        clear(){
            this.role.roleId = "";
            this.role.roleName="";
            this.role.roleDesc="";
        }
    }
}
</script>

<!--样式-->
<style scoped>

</style>