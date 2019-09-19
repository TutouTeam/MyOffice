<!--内容-->
<template>
    
    <div>
        <!--标题-->
        <div>
            <el-header id="header">
                机构管理主界面
                <hr width="300px" color="#20a0ff">
            </el-header>
        </div>

        <!--搜索框以及功能按钮-->
        <div style="padding-left: 50px;padding-top: 10px;"
            align="left">
            <span >查询用户信息</span>
            <!--搜索框-->
            <el-input
                placeholder="查询所需要的内容..."
                style="width: 200px;margin: 0px;padding: 0px;"
                size="mini"
                :disabled="advanceSearchViewVisible"
                prefix-icon="el-icon-search"
                @keyup.enter.native="search"
                @change="keywordsChange"
                v-model="keywords">
            </el-input>
            <!--添加按钮-->
            <el-button  
                type="primary" 
                size="mini" 
                style="margin-left: 1040px;" 
                icon="el-icon-search" 
                @click="clickAddButton"
                >
                添加
            </el-button>
        </div>

        <!--表格-->
        <div style="padding-left: 40px;padding-right: 40px;padding-top: 20px;">
            <!--:data="tables"的tables对应下面的tables-->
            <el-table
                :data="tables"
                border
                stripe
                size="mini"
                style="width: 100%"
                >

                <el-table-column
                    prop="id"
                    label="序号"
                    width="58"
                    align="center">
                </el-table-column>

                <el-table-column
                    prop="date"
                    label="日期"
                    width="170"
                    align="center">
                </el-table-column>

                <el-table-column
                    prop="userName"
                    label="姓名"
                    width="150"
                    align="center">
                </el-table-column>

                <el-table-column
                    prop="userEmail"
                    width="170"
                    label="邮箱"
                    align="center">
                </el-table-column>

                <el-table-column
                    prop="title"
                    width="200"
                    label="标题"
                    align="center">
                </el-table-column>

                <el-table-column
                    prop="assess"
                    width="200"
                    label="评价"
                    align="center">
                </el-table-column>

                <el-table-column
                    prop="state"
                    width="250"
                    label="状态"
                    align="center">
                </el-table-column>

                <el-table-column
                    prop="operation"
                    width="240"
                    label="操作"
                    align="center">

                    <template slot-scope="scope">
                        <!--团队变更记录的变更按钮-->
                        <el-button style="padding: 3px 4px 3px 4px;margin: 2px" size="mini" @click="clickUpdateUser(scope.row)">
                        编辑
                        </el-button>
                        <!--团队变更记录的删除按钮-->
                        <el-button type="danger" style="padding: 3px 4px 3px 4px;margin: 2px" size="mini" @click="deleteUser(scope.$index)">
                        删除
                        </el-button>
                    </template>

                </el-table-column>
            </el-table>
        </div>

        <!--添加用户信息-->
        <!--在表单中设置一个弹窗，弹窗里设置输入框-->
        <!--model是数据集-->
        <!--rules是限制规则-->
        <!--ref是提交表单的请求路径-->
        <!--:model="user"绑定数据-->
        <!--:rules="rules"设置规则-->
        <el-form :model="user" :rules="rules" ref="addUser" style="margin: 0px;padding: 0px;">
            <div style="text-align: left">
                 <el-dialog
                    :title="dialogTitle1"
                    style="padding: 0px;"
                    :close-on-click-modal="false"
                    :visible.sync="dialogVisible_add_user_form"
                    width="50%">
                    <!--visible.sync同步，根据dialogVisible_add_user_form的值来弹出框-->

                    <!--第一行-->
                    <el-row style="margin-top: 5px;padding: 0px;">

                        <el-col :span="12">
                            <div>
                                <el-form-item label="日期:" prop="date">
                                    <el-date-picker
                                        v-model="user.date"
                                        size="mini"
                                        style="width: 300px"
                                        type="date"
                                        placeholder="请输入日期"
                                        value-format="yyyy-MM-dd">
                                    </el-date-picker>
                                </el-form-item>
                            </div>
                        </el-col> 

                    </el-row>

                    <!--第二行-->
                    <el-row style="margin-top: 5px;padding: 0px;">

                        <el-col :span="12">
                            <div>
                                <el-form-item label="姓名:" prop="userName">
                                <el-input prefix-icon="el-icon-edit" v-model="user.userName" size="mini" style="width: 300px" v-bind:disabled="false"
                                            placeholder="请输入姓名"></el-input>
                                </el-form-item>
                            </div>
                        </el-col>

                    </el-row>

                    <!--第三行-->
                    <el-row style="margin-top: 5px;padding: 0px;">

                        <el-col :span="12">
                            <div>
                                <el-form-item label="邮箱:" prop="userEmail">
                                <el-input prefix-icon="el-icon-edit" v-model="user.userEmail" size="mini" style="width: 300px" v-bind:disabled="false"
                                            placeholder="请输入邮箱"></el-input>
                                </el-form-item>
                            </div>
                        </el-col>

                    </el-row>

                    <!--第四行-->
                    <el-row style="margin-top: 5px;padding: 0px;">

                        <el-col :span="12">
                            <div>
                                <el-form-item label="标题:" prop="title">
                                <el-input prefix-icon="el-icon-edit" v-model="user.title" size="mini" style="width: 300px" v-bind:disabled="false"
                                            placeholder="请输入标题"></el-input>
                                </el-form-item>
                            </div>
                        </el-col>

                    </el-row>

                    <!--第五行-->
                    <el-row style="margin-top: 5px;padding: 0px;">

                        <el-col :span="12">
                            <div>
                                <el-form-item label="评价:" prop="assess">
                                <el-input prefix-icon="el-icon-edit" v-model="user.assess" size="mini" style="width: 300px" v-bind:disabled="false"
                                            placeholder="请输入评价"></el-input>
                                </el-form-item>
                            </div>
                        </el-col>

                    </el-row>

                    <!--第六行-->
                    <el-row style="margin-top: 5px;padding: 0px;">

                        <el-col :span="12">
                            <div>
                                <el-form-item label="状态:" prop="state">
                                <el-input prefix-icon="el-icon-edit" v-model="user.state" size="mini" style="width: 300px" v-bind:disabled="false"
                                            placeholder="请输入状态"></el-input>
                                </el-form-item>
                            </div>
                        </el-col>

                    </el-row>

                    <!--功能按钮-->
                    <span slot="footer" class="dialog-footer">
                        <el-button size="mini" @click="cancelAddUser">取 消</el-button>
                        <el-button size="mini" type="primary" @click="addUser()">确 定</el-button>
                    </span>

                </el-dialog>
            </div>
        </el-form>


        <!--编辑用户信息-->
        <!--在表单中设置一个弹窗，弹窗里设置输入框-->
        <!--model是数据集-->
        <!--rules是限制规则-->
        <!--ref是提交表单的请求路径-->
        <!--:model="user"绑定数据-->
        <!--:rules="rules"设置规则-->
        <el-form :model="user" :rules="rules" ref="updateUser" style="margin: 0px;padding: 0px;">
            <div style="text-align: left">
                 <el-dialog
                    :title="dialogTitle2"
                    style="padding: 0px;"
                    :close-on-click-modal="false"
                    :visible.sync="dialogVisible_update_user_form"
                    width="50%">
                    <!--visible.sync同步，根据dialogVisible_update_user_form的值来弹出框-->

                    <!--第一行-->
                    <el-row style="margin-top: 5px;padding: 0px;">

                        <el-col :span="12">
                            <div>
                                <el-form-item label="日期:" prop="date">
                                    <el-date-picker
                                        v-model="user.date"
                                        size="mini"
                                        style="width: 300px"
                                        type="date"
                                        placeholder="请输入日期"
                                        value-format="yyyy-MM-dd">
                                    </el-date-picker>
                                </el-form-item>
                            </div>
                        </el-col> 

                    </el-row>

                    <!--第二行-->
                    <el-row style="margin-top: 5px;padding: 0px;">

                        <el-col :span="12">
                            <div>
                                <el-form-item label="姓名:" prop="userName">
                                <el-input prefix-icon="el-icon-edit" v-model="user.userName" size="mini" style="width: 300px" v-bind:disabled="false"
                                            placeholder="请输入姓名"></el-input>
                                </el-form-item>
                            </div>
                        </el-col>

                    </el-row>

                    <!--第三行-->
                    <el-row style="margin-top: 5px;padding: 0px;">

                        <el-col :span="12">
                            <div>
                                <el-form-item label="邮箱:" prop="userEmail">
                                <el-input prefix-icon="el-icon-edit" v-model="user.userEmail" size="mini" style="width: 300px" v-bind:disabled="false"
                                            placeholder="请输入邮箱"></el-input>
                                </el-form-item>
                            </div>
                        </el-col>

                    </el-row>

                    <!--第四行-->
                    <el-row style="margin-top: 5px;padding: 0px;">

                        <el-col :span="12">
                            <div>
                                <el-form-item label="标题:" prop="title">
                                <el-input prefix-icon="el-icon-edit" v-model="user.title" size="mini" style="width: 300px" v-bind:disabled="false"
                                            placeholder="请输入标题"></el-input>
                                </el-form-item>
                            </div>
                        </el-col>

                    </el-row>

                    <!--第五行-->
                    <el-row style="margin-top: 5px;padding: 0px;">

                        <el-col :span="12">
                            <div>
                                <el-form-item label="评价:" prop="assess">
                                <el-input prefix-icon="el-icon-edit" v-model="user.assess" size="mini" style="width: 300px" v-bind:disabled="false"
                                            placeholder="请输入评价"></el-input>
                                </el-form-item>
                            </div>
                        </el-col>

                    </el-row>

                    <!--第六行-->
                    <el-row style="margin-top: 5px;padding: 0px;">

                        <el-col :span="12">
                            <div>
                                <el-form-item label="状态:" prop="state">
                                <el-input prefix-icon="el-icon-edit" v-model="user.state" size="mini" style="width: 300px" v-bind:disabled="false"
                                            placeholder="请输入状态"></el-input>
                                </el-form-item>
                            </div>
                        </el-col>

                    </el-row>

                    <!--功能按钮-->
                    <span slot="footer" class="dialog-footer">
                        <el-button size="mini" @click="cancelUpdateUser">取 消</el-button>
                        <el-button size="mini" type="primary" @click="updateUser()">确 定</el-button>
                    </span>

                </el-dialog>
            </div>
        </el-form>
    </div>
    
</template>

<!--Javascript-->
<script>
export default {
    //数据定义
    data() {
        return{ 
            dialogTitle1: '',
            dialogTitle2: '编辑用户信息',
            dialogVisible_add_user_form: false,
            dialogVisible_update_user_form: false,
            advanceSearchViewVisible: false,
            keywords: '',//查询的关键字
            user:{//这个部分必须得写
                id: '',
                date: '',
                userName: '',
                userEmail: '',
                title: '',
                assess: '',
                state: ''
            },
            users:[
                {
                    id:1,
                    date:'2019/09/04',
                    userName:'方荣福',
                    userEmail:'1120802408@qq.com',
                    title:'helloworld',
                    assess:'very good!',
                    state:'yes'
                },
                {
                    id:2,
                    date:'2019/09/04',
                    userName:'曾慰祖',
                    userEmail:'1120802407@qq.com',
                    title:'helloworld',
                    assess:'very good!',
                    state:'yes'
                },
                {
                    id:3,
                    date:'2019/09/04',
                    userName:'陆子婷',
                    userEmail:'1120802406@qq.com',
                    title:'helloworld',
                    assess:'very good!',
                    state:'yes'
                },
                {
                    id:4,
                    date:'2019/09/04',
                    userName:'马利芬',
                    userEmail:'1120802405@qq.com',
                    title:'helloworld',
                    assess:'very good!',
                    state:'yes'
                },
            ],
        }
    },

    //挂载钩子
    mounted: function () {
      
    },

    //计算属性
    computed: {
      // 模糊搜索，这个tables是一个数组写在上面table的:data里
      tables () {
        const search = this.keywords
        if (search) {
          // filter() 方法创建一个新的数组，新数组中的元素是通过检查指定数组中符合条件的所有元素。
          // 注意： filter() 不会对空数组进行检测。
          // 注意： filter() 不会改变原始数组。
          return this.users.filter(data => {
            // some() 方法用于检测数组中的元素是否满足指定条件;
            // some() 方法会依次执行数组的每个元素：
            // 如果有一个元素满足条件，则表达式返回true , 剩余的元素不会再执行检测;
            // 如果没有满足条件的元素，则返回false。
            // 注意： some() 不会对空数组进行检测。
            // 注意： some() 不会改变原始数组。
            return Object.keys(data).some(key => {
              // indexOf() 返回某个指定的字符在某个字符串中首次出现的位置，如果没有找到就返回-1；
              // 该方法对大小写敏感！所以之前需要toLowerCase()方法将所有查询到内容变为小写。
              return String(data[key]).toLowerCase().indexOf(search) > -1
            })
          })
        }
        return this.users
      }
    },

    //方法集合
    methods:{
        //查询提示信息
        searchNotification() {
            this.$notify({
            title: '提示',
            message: '查询成功',
            duration: 1500
            });
        },

        //添加提示信息
        addNotification() {
            this.$notify({
            title: '提示',
            message: '添加成功',
            duration: 1500
            });
        },

        //修改提示信息
        updateNotification() {
            this.$notify({
            title: '提示',
            message: '修改成功',
            duration: 1500
            });
        },

        //删除提示信息
        deleteNotification() {
            this.$notify({
            title: '提示',
            message: '删除成功',
            duration: 1500
            });
        },

        //查找
        seacher(){
            this.searchNotification();
        },

        //点击添加按钮
        clickAddButton(){
            this.dialogVisible_add_user_form = !this.dialogVisible_add_user_form;
            this.dialogTitle1="添加用户信息";
            this.emptyUser();
        },
        //添加
        addUser(){
            this.dialogVisible_add_user_form = false;
            this.users.push({
                id: this.users.length+1,
                date: this.user.date,
                userName: this.user.userName,
                userEmail: this.user.userEmail,
                title: this.user.title,
                assess: this.user.assess,
                state: this.user.state});
            this.emptyUser();
            this.addNotification();
        },
        //取消添加按钮
        cancelAddUser(){
            this.dialogVisible_add_user_form = false;
            this.emptyUser();
        },

        //点击修改按钮
        clickUpdateUser(row){
            this.dialogVisible_update_user_form = !this.dialogVisible_update_user_form;
            this.dialogTitle2="编辑用户信息";
            this.user.id = row.id;
            this.user.date = row.date;
            this.user.userName = row.userName;
            this.user.userEmail = row.userEmail;
            this.user.title = row.title;
            this.user.assess = row.assess;
            this.user.state = row.state;
        },
        //修改（编辑）
        updateUser(){
            this.dialogVisible_update_user_form = false;
            this.users[this.user.id-1].date = this.user.date;
            this.users[this.user.id-1].userName = this.user.userName;
            this.users[this.user.id-1].userEmail = this.user.userEmail;
            this.users[this.user.id-1].title = this.user.title;
            this.users[this.user.id-1].assess = this.user.assess;
            this.users[this.user.id-1].state = this.user.state;
            this.emptyUser();
            this.updateNotification();
        },
        //取消修改按钮
        cancelUpdateUser(){
            this.dialogVisible_update_user_form = false;
            this.emptyUser();
        },

        //删除
        deleteUser(index){
            //splice()是数组的函数，第一个参数表示要删除的行的index（索引），第二参数表示只删除一行
            this.users.splice(index, 1);
            this.deleteNotification();
        },

        //清空user变量
        emptyUser(){
            this.user = {
                id: '',
                date: '',
                userName: '',
                userEmail: '',
                title: '',
                assess: '',
                state: ''
            }
        }
    }
}
</script>>

<!--CSS-->
<style scoped>
    #header{
        font-size:30px;
    }
</style>