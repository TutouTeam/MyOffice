package com.capgemini.jtp.mapper;

import com.capgemini.jtp.entity.ManualSign;
import com.capgemini.jtp.vo.request.ManualSearchVo;
import com.capgemini.jtp.vo.request.ManualSignInSearchVo;
import com.capgemini.jtp.vo.response.ManualVo;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository
public interface ManualMapper {
    Integer insertManualSign(@Param("manualSign") ManualSign manualSign);
    Integer insertManualSignOff(@Param("manualSign") ManualSign manualSign);
    ManualSignInSearchVo searchManual(int userId);
    List<ManualVo>  SearchManualHistory(@Param("manualSearchVo") ManualSearchVo manualSearchVo);
}
