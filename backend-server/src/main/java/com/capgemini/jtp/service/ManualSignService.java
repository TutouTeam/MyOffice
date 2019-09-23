package com.capgemini.jtp.service;


import com.capgemini.jtp.vo.request.ManualSearchVo;
import com.capgemini.jtp.vo.request.ManualSignInSearchVo;
import com.capgemini.jtp.vo.request.ManualSignInVo;
import com.capgemini.jtp.vo.request.ManualSignOffVo;
import com.capgemini.jtp.vo.response.ManualVo;

import java.util.List;


public interface ManualSignService {
    public Integer insertManualSign(ManualSignInVo manualSignInVo);
    public Integer insertManualSignOff(ManualSignOffVo manualSignOffVo);
    public ManualSignInSearchVo listSignInVo(int userId);
    public List<ManualVo> listManualSearch(ManualSearchVo manualSearchVo);

}
