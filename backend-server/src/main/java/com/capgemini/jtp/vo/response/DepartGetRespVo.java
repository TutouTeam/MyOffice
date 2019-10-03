package com.capgemini.jtp.vo.response;

import com.capgemini.jtp.entity.Schedule;
import lombok.Data;
import org.springframework.stereotype.Component;

import java.util.List;
@Data
@Component
public class DepartGetRespVo {
    private String createUser;
    private Object  scheduleId;
    private List<Integer > scheduleIdList;
    private List<Schedule> ScheduleList;
}
