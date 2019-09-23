package com.capgemini.jtp.service;

import com.capgemini.jtp.entity.OperateLog;
import com.capgemini.jtp.vo.request.OperateLogReq;
import com.capgemini.jtp.vo.response.OperateLogResp;

import java.util.List;

/**
 * @author: chunlei.wang
 * @date: 2019/09/02
 */
public interface OperateLogService {
    public int insert(OperateLog record);

    /**
     * 根据操作日志的 id 删除操作日志
     */
    int deleteByPrimaryKey(Integer operateId);

    /**
     * 查询所有的操作日志
     * @return
     */
    List<OperateLogResp> selectAllOperateLog(OperateLogReq operateLogReq);
}
