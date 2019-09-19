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
          <router-link to="/testElement" style="margin-left: 100px;text-decoration:none; color: #fff" class="el-icon-view">显示/隐藏通知栏&emsp;&emsp;</router-link>
          <router-link to="/header/Help" style="margin-left: 100px;text-decoration:none; color: #fff" class="el-icon-question">帮助&emsp;&emsp;</router-link >
          
          <span class="el-icon-date">今天是：2019-9-17 星期二</span>
        </div>

        <span>
        <el-dropdown>
        <i class="el-icon-setting" style="margin-right: 15px;margin-left: 15px; color: #fff"></i>
        <span class="user colorWhite" style="margin-right: 15px;color: #fff">方荣福</span>
        <el-dropdown-menu slot="dropdown">
        <el-dropdown-item @click.native="changePasswd()">修改密码</el-dropdown-item>
        <el-dropdown-item @click.native="lagout()">退出系统</el-dropdown-item>
        </el-dropdown-menu>
        </el-dropdown>
        </span>
      </el-header>

      <el-container>

        <!--左侧菜单-->
        <el-aside width="201px" class="home-aside">

          <div style="display: flex;justify-content: flex-start;width: 180px;text-align: left;">
            <p id="welcome">
              <span class="el-icon-success">欢迎：系统管理员</span>
              <span class="el-icon-user">角色：系统管理员</span>
              <span class="el-icon-location-outline">部门：研发部</span>
              <span class="el-icon-message">您共有0条新消息</span>
            </p>
          </div>

          <div style="display: flex;justify-content: flex-start;width: 180px;text-align: left;">
            

            <el-row class="tac" >
              <el-col :span="50">
              
                <el-menu
                  default-active="2"
                  
                  @open="handleOpen"
                  @close="handleClose">

                  <el-submenu index="1" style="color: #20a0ff;width: 200px;">
                    <template slot="title">
                      <i class="el-icon-location"></i>
                      <span>人事管理</span>
                    </template>
                    <el-menu-item-group>
                      <el-menu-item index="1-1" ><router-link to="/person/mechanism/MechanismIndex" style="text-decoration:none;">机构管理</router-link></el-menu-item>
                      <el-menu-item index="1-2"><router-link to="/person/department/DepartmentIndex" style="text-decoration:none;">部门管理</router-link></el-menu-item>
                      <el-menu-item index="1-3"><router-link to="/person/employee/EmployeeIndex" style="text-decoration:none;">员工管理</router-link></el-menu-item>
                    </el-menu-item-group>
                  </el-submenu>


                  <el-submenu index="2" style="color: #20a0ff;width: 200px;">
                    <template slot="title">
                      <i class="el-icon-location"></i>
                      <span>日程管理</span>
                    </template>
                    <el-menu-item-group>
                      <el-menu-item index="2-1"><router-link to="/schedule/myself/MyselfIndex" style="text-decoration:none;">我的日程</router-link></el-menu-item>
                      <el-menu-item index="2-2"><router-link to="/schedule/department/DepartmentIndex2" style="text-decoration:none;">部门日程</router-link></el-menu-item>
                      <el-menu-item index="2-3"><router-link to="/schedule/note/NoteIndex" style="text-decoration:none;">我的便签</router-link></el-menu-item>
                    </el-menu-item-group>
                  </el-submenu>


                  <el-submenu index="3" style="color: #20a0ff;width: 200px;">
                    <template slot="title">
                      <i class="el-icon-location"></i>
                      <span>文档管理</span>
                    </template>
                    <el-menu-item-group>
                      <el-menu-item index="3-1"><router-link to="/file/file/FileTree" style="text-decoration:none;">文档管理</router-link></el-menu-item>
                      <el-menu-item index="3-2"><router-link to="/file/recycle_bin/RecycleBinIndex" style="text-decoration:none;">回收站</router-link></el-menu-item>
                      <el-menu-item index="3-3"><router-link to="/file/file_search/FileSearchIndex" style="text-decoration:none;">文件搜索</router-link></el-menu-item>
                    </el-menu-item-group>
                  </el-submenu>



                  
                  <el-submenu index="4" style="color: #20a0ff;width: 200px;">
                    <template slot="title">
                      <i class="el-icon-location"></i>
                      <span>消息传递</span>
                    </template>
                    <el-menu-item-group>
                      <el-menu-item index="4-1"><router-link to="/news/news/NewsIndex" style="text-decoration:none;">消息管理</router-link></el-menu-item>
                      <el-menu-item index="4-2"><router-link to="/news/mailbox/MailboxIndex" style="text-decoration:none;">信箱</router-link></el-menu-item>
                    </el-menu-item-group>
                  </el-submenu>


                  
                  <el-submenu index="5" style="color: #20a0ff;width: 200px;">
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
                  </el-submenu>


                  
                  <el-submenu index="6" style="color: #20a0ff;width: 200px;">
                    <template slot="title">
                      <i class="el-icon-location"></i>
                      <span>考勤管理</span>
                    </template>
                    <el-menu-item-group>
                      <el-menu-item index="6-1"><router-link to="/attendance/attendance_statistics/AttendanceStatisticsIndex" style="text-decoration:none;">考勤统计</router-link></el-menu-item>
                      <el-menu-item index="6-2"><router-link to="/attendance/attendance_record/AttendanceRecordIndex" style="text-decoration:none;">考勤历史记录查询</router-link></el-menu-item>
                    </el-menu-item-group>
                  </el-submenu>

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
    mounted: function () {
    },
    methods: {
      lagout() {
        this.$router.push({
        path: '../'
        })
      },
      
    },
    data(){
      return {
        isDot: false
      }
    },
    computed: {
      user(){
        return this.$store.state.user;
      },
      routes(){
        return this.$store.state.routes
      }
    }
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
