<template>
  <div>
    <el-container class="home-container">
      <!--头部横条-->
      <el-header class="home-header">
       <span class="home_title">MyOffice</span>

        <div style="margin-left: 100px; color: #fff" >
          <router-link to="/home" style="margin-left: 15px;text-decoration:none; color: #fff" class="el-icon-menu">主页&emsp;&emsp;</router-link>
          <router-link to="/header/ChangePassword" style="margin-left: 100px;text-decoration:none; color: #fff" class="el-icon-edit">修改密码&emsp;&emsp;</router-link>
          <router-link to="/" style="margin-left: 100px;text-decoration:none; color: #fff" class="el-icon-refresh">重新登录&emsp;&emsp;</router-link>
          <router-link to="/header/Hiden" style="margin-left: 100px;text-decoration:none; color: #fff" class="el-icon-view">显示/隐藏通知栏&emsp;&emsp;</router-link>
          <router-link to="/header/Help" style="margin-left: 100px;text-decoration:none; color: #fff" class="el-icon-question">帮助&emsp;&emsp;</router-link >
          
          <span class="el-icon-date">今天是:{{today}}</span>
        </div>

        <span>
        <el-dropdown>
        <i class="el-icon-setting" style="margin-right: 15px;margin-left: 15px; color: #fff"></i>
        <span class="user colorWhite" style="margin-right: 15px;color: #fff"></span>
        <el-dropdown-menu slot="dropdown">
        <el-dropdown-item @click.native="changePasswd()">修改密码</el-dropdown-item>
        <el-dropdown-item @click.native="logout()">退出系统</el-dropdown-item>
        </el-dropdown-menu>
        </el-dropdown>
        </span>
      </el-header>

      <el-container>

        <!--左侧菜单-->
        <el-aside width="201px" class="home-aside">

          <div style="display: flex;justify-content: flex-start;width: 180px;text-align: left;">
            <p id="welcome">
              <span class="el-icon-success">欢迎：{{this.$store.state.user.chineseName}}</span>
              <span class="el-icon-user">角色：{{this.$store.state.user.roles[0].roleName}}</span>
              <span class="el-icon-location-outline">部门：{{getDepartName()}}</span>
              
              <el-row>
                <el-col span="16">
                  <span class="el-icon-message">新消息提醒：</span>
                </el-col>
                  
                <el-col span="8">
                  <!--消息红点+条数-->
                  <el-badge :value="getInBoxNumber()" class="item">
                    <el-button type="primary" size="mini" @click="jump">查看</el-button>
                  </el-badge>
                </el-col>
              </el-row>
              
            </p>
          </div>

          <div style="display: flex;justify-content: flex-start;width: 180px;text-align: left;">
            

            <el-row class="tac" >
              <el-col :span="50">
              
                <el-menu
                  default-active="2"
                  
                  @open="handleOpen"
                  @close="handleClose">

                  <!--人事管理<el-submenu index="1" style="color: #20a0ff;width: 200px;">
                    <template slot="title">
                      <i class="el-icon-location"></i>
                      <span>人事管理</span>
                    </template>
                    <el-menu-item-group>
                      <el-menu-item index="1-1" ><router-link to="/person/mechanism/MechanismIndex" style="text-decoration:none;">机构管理</router-link></el-menu-item>
                      <el-menu-item index="1-2"><router-link to="/person/department/DepartmentIndex" style="text-decoration:none;">部门管理</router-link></el-menu-item>
                      <el-menu-item index="1-3"><router-link to="/person/employee/EmployeeIndex" style="text-decoration:none;">员工管理</router-link></el-menu-item>
                    </el-menu-item-group>
                  </el-submenu>-->
                  

                  <!--日程管理<el-submenu index="2" style="color: #20a0ff;width: 200px;">
                    <template slot="title">
                      <i class="el-icon-location"></i>
                      <span>日程管理</span>
                    </template>
                    <el-menu-item-group>
                      <el-menu-item index="2-1"><router-link to="/schedule/myself/MyselfIndex" style="text-decoration:none;">我的日程</router-link></el-menu-item>
                      <el-menu-item index="2-2"><router-link to="/schedule/department/DepartmentIndex2" style="text-decoration:none;">部门日程</router-link></el-menu-item>
                      <el-menu-item index="2-3"><router-link to="/schedule/note/NoteIndex" style="text-decoration:none;">我的便签</router-link></el-menu-item>
                    </el-menu-item-group>
                  </el-submenu>-->

                  <template v-for="(item,index) in this.routes">
                    <el-submenu style="color: #20a0ff;width: 200px;" :key="index" :index="index+''">
                      <template slot="title">
                        <i class="el-icon-location" style="color: #20a0ff;width: 14px;"></i>
                        <span slot="title">{{item.displayName}}</span>
                      </template>
                      <!--菜单项，使用了列表渲染-->
                      <el-menu-item-group>
                        <el-menu-item width="180px"
                            style="padding-left: 30px;padding-right:0px;margin-left: 0px;width: 170px;text-align: left"
                            v-for="child in item.children"
                            :index="child.path"
                            :key="child.path"><router-link :to="child.path" style="text-decoration:none;">{{child.displayName}}</router-link>
                        </el-menu-item>
                      </el-menu-item-group>
                    </el-submenu>
                  </template>
                  

                  <!--文档管理<el-submenu index="3" style="color: #20a0ff;width: 200px;">
                    <template slot="title">
                      <i class="el-icon-location"></i>
                      <span>文档管理</span>
                    </template>
                    <el-menu-item-group>
                      <el-menu-item index="3-1"><router-link to="/file/file/FileTree" style="text-decoration:none;">文档管理</router-link></el-menu-item>
                      <el-menu-item index="3-2"><router-link to="/file/recycle_bin/RecycleBinIndex" style="text-decoration:none;">回收站</router-link></el-menu-item>
                      <el-menu-item index="3-3"><router-link to="/file/file_search/FileSearchIndex" style="text-decoration:none;">文件搜索</router-link></el-menu-item>
                    </el-menu-item-group>
                  </el-submenu>-->
                  



                  <!--消息管理<el-submenu index="4" style="color: #20a0ff;width: 200px;">
                    <template slot="title">
                      <i class="el-icon-location"></i>
                      <span>消息管理</span>
                    </template>
                    <el-menu-item-group>
                      <el-menu-item index="4-1"><router-link to="/news/news/NewsIndex" style="text-decoration:none;">消息管理</router-link></el-menu-item>
                      <el-menu-item index="4-2"><router-link to="/news/mailbox/MailboxIndex" style="text-decoration:none;">信箱</router-link></el-menu-item>
                    </el-menu-item-group>
                  </el-submenu>-->
                  


                  <!--系统管理<el-submenu index="5" style="color: #20a0ff;width: 200px;">
                    <template slot="title">
                      <i class="el-icon-location"></i>
                      <span>系统管理</span>
                    </template>
                    <el-menu-item-group>
                      <el-menu-item index="5-1"><router-link to="/system/role/RoleIndex" style="text-decoration:none;">角色管理</router-link></el-menu-item>
                      <el-menu-item index="5-2"><router-link to="/system/login_record/LoginRecordIndex" style="text-decoration:none;">登录日志</router-link></el-menu-item>
                      <el-menu-item index="5-3"><router-link to="/system/menu_sort/MenuSortIndex" style="text-decoration:none;">菜单排序</router-link></el-menu-item>
                      <el-menu-item index="5-4"><router-link to="/system/operation_record/OperationRecordIndex" style="text-decoration:none;">操作日志</router-link></el-menu-item>
                    </el-menu-item-group>
                  </el-submenu>-->
                  


                  <!--考勤管理<el-submenu index="6" style="color: #20a0ff;width: 200px;">
                    <template slot="title">
                      <i class="el-icon-location"></i>
                      <span>考勤管理</span>
                    </template>
                    <el-menu-item-group>
                      <el-menu-item index="6-1"><router-link to="/attendance/attendance_card/AttendanceCardIndex" style="text-decoration:none;" >员工签到、签退</router-link></el-menu-item>
                      <el-menu-item index="6-2"><router-link to="/attendance/attendance_record/AttendanceRecordIndex" style="text-decoration:none;">考勤历史查询</router-link></el-menu-item>
                      <el-menu-item index="6-3"><router-link to="/attendance/attendance_statistics/AttendanceStatisticsIndex" style="text-decoration:none;">考勤统计</router-link></el-menu-item>
                    </el-menu-item-group>
                  </el-submenu>-->
                  


                </el-menu>
              </el-col>
            </el-row>
          </div>
        </el-aside>

        <!--右侧空白面板-->
        <el-main>
          <!--面包屑导航-->
          <el-breadcrumb separator-class="el-icon-arrow-right">
            <!--面包屑导航项-->
            <el-breadcrumb-item :to="{ path: '/home' }">首页</el-breadcrumb-item>
            <el-breadcrumb-item v-text="this.$router.currentRoute.name"></el-breadcrumb-item>
          </el-breadcrumb>
          <keep-alive>
            <router-view v-if="this.$route.meta.keepAlive"></router-view>
          </keep-alive>
          <router-view v-if="!this.$route.meta.keepAlive"></router-view>
        </el-main>

      </el-container>

    </el-container>
  </div>
</template>

<script>
  export default{

    //定义属性
    data(){
      return {
        isDot: false,
        messageSize: '',
        timer: null
      }
    },

    //功能函数
    methods: {
      logout() {
        this.$router.push({
        path: '/'
        })
      },

      changePasswd(){
        this.$router.push({ 
        // path:'/header/ChangePassword',
        name: "修改密码页面",
        });
      },

      //获得部门名称
      getDepartName(){
        if(this.$store.state.user.departId == 40)
        {
          return "部门A"
        }
        if(this.$store.state.user.departId == 41)
        {
          return "部门B"
        }
        if(this.$store.state.user.departId == 42)
        {
          return "部门C"
        }
        if(this.$store.state.user.departId == 43)
        {
          return "部门D"
        }
        if(this.$store.state.user.departId == 44)
        {
          return "部门E"
        }
        if(this.$store.state.user.departId == 45)
        {
          return "部门F"
        }
        if(this.$store.state.user.departId == 46)
        {
          return "部门G"
        }
      },

      //跳转到信箱页面
      jump(){
        this.$router.push({path: '/news/mailbox/MailboxIndex'})
      },

      //获得收件箱未读消息的数量
      getInBoxNumber(){
        this.getRequest('/message/').then(resp => {
          this.messageSize = resp.data.obj.notReadSize
          console.log("testMessageSize",this.messageSize)   
        })
        return this.messageSize  
      }
    },
    
    //计算属性
    computed: {
      user(){
        return this.$store.state.user;
      },
      routes(){
        console.log("storeMenuDatas",this.$store.state.routes);
        return this.$store.state.routes; 
      },

      today () {
        var date = new Date()
        var seperator1 = '-'
        var year = date.getFullYear()
        var month = date.getMonth() + 1
        var strDate = date.getDate()
        var week = date.getDay() // 返回表示星期的某一天的数字
        if (month >= 1 && month <= 9) {
          month = '0' + month
        }
        if (strDate >= 0 && strDate <= 9) {
          strDate = '0' + strDate
        }
        var weekday = ['星期日', '星期一', '星期二', '星期三', '星期四', '星期五', '星期六']
        var currentdate = year + seperator1 + month + seperator1 + strDate + '  ' + weekday[week]
        return currentdate
      },
    },

  }
</script>
<style>
  #welcome{
    font-family: Arial, Helvetica, sans-serif;
    line-height: 30px;
    margin-left: 25px;
    font-size: 14px;
  }
  #asidemenu {
    margin-top: 30px;
    background-color: #20a0ff;
    color: white;
  }
  .home-container {
    height: 100%;
    position: absolute;
    top: 0px;
    left: 0px;
    width: 100%;
  }
  .home-header {
    background-color: #20a0ff;
    color: #333;
    text-align: center;
    display: flex;
    align-items: center;
    justify-content: space-between;
    box-sizing: content-box;
    padding: 0px;
  }

  .home-aside {
    background-color: #ECECEC;
  }

  .home-main {
    background-color: #fff;
    color: #000;
    text-align: center;
    margin: 0px;
    padding: 0px;;
  }
  .home_title {
    color: #fff;
    font-size: 22px;
    display: inline;
    margin-left: 20px;
  }
  .home_userinfo {
    color: #fff;
    cursor: pointer;
  }
  .home_userinfoContainer {
    display: inline;
    margin-right: 20px;
  }
  .el-submenu .el-menu-item {
    width: 180px;
    min-width: 175px;
  }
</style>
