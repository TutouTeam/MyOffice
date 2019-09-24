package com.capgemini.jtp.controller;

import com.capgemini.jtp.service.LoginLogService;
import com.capgemini.jtp.vo.base.RespBean;
import com.capgemini.jtp.vo.request.DeleteBatchVo;
import com.capgemini.jtp.vo.request.LoadLoginLogReq;
import com.capgemini.jtp.vo.response.LoginLogResp;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
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
    public RespBean loadUserLoginLog(@RequestBody LoadLoginLogReq loadLoginLogReq) {
        List<LoginLogResp> loginLogs = loginLogService.selectLoginLog(loadLoginLogReq);
        if(loginLogs != null){
            return RespBean.ok(loginLogs);
        }else {
            return RespBean.error("查询失败！");
        }

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



    @ApiOperation(value = "批量删除登录日志信息")
    @RequestMapping(value = "/deleteBatchLoginLogs", method = RequestMethod.POST)
    public RespBean deleteBatchExp(@RequestBody DeleteBatchVo deleteBatchVo) {
        if (loginLogService.deleteLoginLofBatch(deleteBatchVo) != 0) {
            return RespBean.ok("删除成功！");
        }
        return RespBean.error("删除失败！");
    }
}
