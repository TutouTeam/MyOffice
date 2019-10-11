import {getRequest} from './api'
import {Message} from 'element-ui'

//
export const isNotNullORBlank = (...args)=> {
  for (var i = 0; i < args.length; i++) {
    var argument = args[i];
    if (argument == null || argument == '' || argument == undefined) {
      Message.warning({message: '数据不能为空!'})
      return false;
    }
  }
  return true;
}

//初始化菜单
export const initMenu = (router, store)=> {
  if (store.state.routes.length>0) {//如果store.state.routes的长度大于零，说明左侧菜单字段信息有数据，不用向数据库发送请求
    return;
  }
  
  //如果store.state.routes的长度不大于零，则向服务器发送请求，获得左侧菜单的字段信息
  getRequest("/config/sysmenu").then(resp=> {
    
    if (resp && resp.status == 200) {
      console.log("MenuDatas",resp);
      var arr = [];//定义数据载体
      //arr.push(resp.data[1]);//将获得的响应数据放入arr载体中
      arr = resp.data
      var fmtRoutes = formatRoutes(arr);//此处调用格式转换函数formatRoutes(),fmtRoutes作为转换格式后的载体
      console.log("formatRoutes",fmtRoutes);
      router.addRoutes(fmtRoutes);//动态添加路由
      store.commit('initMenu', fmtRoutes);//commit 同步操作 this.$store.commit('mutations的方法'，arg),(向store提交initMenu功能函数的数据参数fmtRoutes，对应store的initMenu的menus)
      store.dispatch('connect');//dispatch 异步操作 this.$store.dispatch('actions的方法'，arg)
    }
  })
}

//格式转换，将获取到的数据格式化成符合动态添加路由的格式
export const formatRoutes = (routes)=> {
  let fmRoutes = [];

  //for循环处理数据
  routes.forEach(router=> {//routes为待处理数据，router为处理后的数据载体
    let {//router内的参数
      path,//前端router的path
      component,//vue组件的名称
      displayName,//功能中文名称
      //meta,
      //iconCls,//?
      children//子组件
    } = router;

    //递归
    //如果该路径下存在子组件，对其再进行数据转化
    if (children && children instanceof Array) {
      children = formatRoutes(children);
    }

    let fmRouter = {
      path: path,
      //这里是为了让大家更好的拓展侧边栏的功能，如不需要请忽略(这里不写也不会报错)
      //author: lmh <minhao.liu@capgemini.com>
      component(resolve){
        //if条件对应的是component的名字
        //if体内容对应的是vue页面（组件）所在的包路径
        if (component.startsWith("Home")) {//公共部分
          require(['../components/public/' + component + '.vue'], resolve)
        } 
        else if (component.startsWith("MechanismIndex")) {//机构管理
          require(['../components/person/mechanism/' + component + '.vue'],resolve)
        }
        else if (component.startsWith("DepartmentIndex")) {//部门管理
          require(['../components/person/department/' + component + '.vue'],resolve)
        }
        else if (component.startsWith("EmployeeIndex")) {//员工管理
          require(['../components/person/employee/' + component + '.vue'],resolve)
        }
        else if (component.startsWith("MyselfIndex")) {//我的日程
          require(['../components/schedule/myself/' + component + '.vue'],resolve)
        }
        else if (component.startsWith("DepartmentIndex2")) {//部门日程
          require(['../components/schedule/department/' + component + '.vue'],resolve)
        }
        else if (component.startsWith("NoteIndex")) {//我的便签
          require(['../components/schedule/note/' + component + '.vue'],resolve)
        }
        else if (component.startsWith("FileTree")) {//文档管理
          require(['../components/file/file/' + component + '.vue'],resolve)
        }
        else if (component.startsWith("RecycleBinIndex")) {//回收站
          require(['../components/file/recycle_bin/' + component + '.vue'],resolve)
        }
        else if (component.startsWith("FileSearchIndex")) {//文件搜索
          require(['../components/file/file_search/' + component + '.vue'],resolve)
        }
        else if (component.startsWith("NewsIndex")) {//消息管理
          require(['../components/news/news/' + component + '.vue'],resolve)
        }
        else if (component.startsWith("MailboxIndex")) {//信箱
          require(['../components/news/mailbox/' + component + '.vue'],resolve)
        }
        else if (component.startsWith("RoleIndex")) {//角色管理
          require(['../components/system/role/' + component + '.vue'],resolve)
        }
        else if (component.startsWith("LoginRecordIndex")) {//登陆日志
          require(['../components/system/login_record/' + component + '.vue'],resolve)
        }
        else if (component.startsWith("MenuSortIndex")) {//菜单排序
          require(['../components/system/menu_sort/' + component + '.vue'],resolve)
        }
        else if (component.startsWith("OperationRecordIndex")) {//操作日志
          require(['../components/system/operation_record/' + component + '.vue'],resolve)
        }
        else if (component.startsWith("AttendanceCardIndex")) {//员工签到、签退
          require(['../components/attendance/attendance_card/' + component + '.vue'],resolve)
        }
        else if (component.startsWith("AttendanceRecordIndex")) {//考勤历史查询
          require(['../components/attendance/attendance_record/' + component + '.vue'],resolve)
        }
        else if (component.startsWith("AttendanceStatisticsIndex")) {//考勤统计
          require(['../components/attendance/attendance_statistics/' + component + '.vue'],resolve)
        }

      },
      displayName: displayName,
      //iconCls: iconCls,
      //meta: meta,
      children: children
    };

    fmRoutes.push(fmRouter);//将fmRouter放到fmRoutes中

  })
  
  return fmRoutes;
}

