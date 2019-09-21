package com.capgemini.jtp.controller;

import com.capgemini.jtp.service.LoginLogService;
import com.capgemini.jtp.vo.request.LoadLoginLogReq;
import com.capgemini.jtp.vo.response.LoginLogResp;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Api("系统登录日志操作")
@RestController
@RequestMapping("/system/loginlog")
public class SystemLoginLogController {

    @Autowired
    LoginLogService loginLogService;


    /**
     * 根据指定的时间范围查询登录日志信息
     * @Date: 2019-09-02
     * @param loadLoginLogReq
     * @return
     */
    @ApiOperation("加载日志信息")
    @PostMapping("/loadLoginLog")
    public List<LoginLogResp> loadUserLoginLog(@RequestBody LoadLoginLogReq loadLoginLogReq) {
        List<LoginLogResp> loginLogs = loginLogService.selectLoginLog(loadLoginLogReq);
        return loginLogs;
    }

    /**
     * 根据登录日志 id 删除登录日志
     * @param loginLogId
     * @return
     */
    @DeleteMapping("/deleteLoginLogById/{loginLogId}")
    public Integer deleteLoginLogById(@PathVariable("loginLogId") Integer loginLogId) {
        return loginLogService.deleteByPrimaryKey(loginLogId);
    }
}
