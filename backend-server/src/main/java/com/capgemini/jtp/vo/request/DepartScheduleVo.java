package com.capgemini.jtp.vo.request;

import com.capgemini.jtp.utils.DateUtils;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import java.util.Date;

@Data
public class DepartScheduleVo {
    /**
     * 机构Id
     */
   // private int branchId;
    /**
     * 部门Id
     */
    private  int departId;
    /**
     * 姓名
     */
    private String userName;

    /**
     * 日期
     */
    @JsonFormat(pattern = DateUtils.YYYY_MM_DD,timezone=DateUtils.DEFAULT_ZONE)
    private Date selectTime;


    /**
     * 登录人的id
     */
    private String userId;
}
