package com.capgemini.jtp;


import com.capgemini.jtp.mapper.MenuMapper;
import lombok.extern.slf4j.Slf4j;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

/**
 * @ClassName: EmpServiceImplTest
 * @Description: EmpService测试类
 * @Author: Brady
 * @Date: 2019/6/23 11:50 AM
 */

@Slf4j
@RunWith(SpringRunner.class)
@SpringBootTest(classes = JtpSysApplication.class)
public class JtpManagementSystemApplicationTests {
    @Autowired
    private MenuMapper menuMapper;
    @Test
    public void aaaTest(){
        menuMapper.getAllMenu();
    }

//    @Autowired
//    EmpService empService;
//
//    @Test
//    public void addEmp(){
//        EmployeeEditVo employeeEditVo = new EmployeeEditVo();
//        Long a = Long.valueOf(31112);
//        employeeEditVo.setEmpId(a);
//        empService.addEmp(employeeEditVo);
//    }
//
//    @Test
//    public void listEmp() {
//        try {
//            //执行业务逻辑处理
//            EmployeeResponseVo employeeResponseVo = empService.listEmp(new EmployeeSearchVo());
//            //JSON转换
//            JSONArray jsonArray = JSONArray.fromObject(employeeResponseVo.getEmployeeVos());
//            JSONObject jsonObject = JSONObject.fromObject(empService.listEmp(new EmployeeSearchVo()));
//            log.info("################################# 执行成功 ##################################");
//            log.info("#################################打印结果日志#################################");
//            log.info("数据总数 : " + employeeResponseVo.getListCount());
//            log.info("查询结果 : " + jsonArray.toString());
//            log.info("#################################打印结果日志#################################");
//        } catch (Exception e) {
//            log.error("################################# 执行失败 ##################################");
//            log.error("#################################打印报错信息##################################");
//            log.error(e.getMessage(), e);
//            log.error("#################################打印报错信息##################################");
//        }
//    }
}