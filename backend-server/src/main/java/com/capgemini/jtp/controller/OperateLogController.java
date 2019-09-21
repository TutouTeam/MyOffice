package com.capgemini.jtp.controller;

import com.capgemini.jtp.vo.request.OperateLogReq;
import com.capgemini.jtp.vo.response.OperateLogResp;
import com.capgemini.jtp.service.OperateLogService;
import io.swagger.annotations.Api;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;


/**
 * create by: MmmLll_Shen
 * description:操作日志
 * create time: 13:14 2019/9/21
 */
@Api("操作日志")
@RestController
@RequestMapping("/system/operatelog")
public class OperateLogController {

    @Autowired
    OperateLogService operateLogService;

    /**
     * 根据操作日志的 id 删除操作日志
     * @param operateId
     * @return
     */
    @DeleteMapping("/deleteoperatelogbyid/{operateId}")
    public String deleteOperateLogByOperateLogId(@PathVariable Integer operateId) {
        int result = operateLogService.deleteByPrimaryKey(operateId);
        if (result != 0) {
            return "删除成功";
        } else {
            return "删除失败";
        }
    }

    /**
     * 查询所有的操作日志
     * @return
     */
    @PostMapping("/selectalloperatelog")
    public List<OperateLogResp> loadAllOperateLog(@RequestBody OperateLogReq operateLogReq) {
        return operateLogService.selectAllOperateLog(operateLogReq);
    }
}
