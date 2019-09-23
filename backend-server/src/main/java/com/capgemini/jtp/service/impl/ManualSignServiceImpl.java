package com.capgemini.jtp.service.impl;

import com.capgemini.jtp.entity.ManualSign;
import com.capgemini.jtp.mapper.ManualMapper;
import com.capgemini.jtp.mapper.UserMapper;
import com.capgemini.jtp.service.ManualSignService;
import com.capgemini.jtp.utils.ConvertSignUtils;

import com.capgemini.jtp.vo.request.ManualSearchVo;
import com.capgemini.jtp.vo.request.ManualSignInSearchVo;
import com.capgemini.jtp.vo.request.ManualSignInVo;
import com.capgemini.jtp.vo.request.ManualSignOffVo;
import com.capgemini.jtp.vo.response.ManualVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Service

public class ManualSignServiceImpl implements ManualSignService {

    @Autowired
    ManualMapper manualMapper;




    @Override
    public Integer insertManualSign(ManualSignInVo manualSignInVo) {
        ManualSign manualSign = ConvertSignUtils.convertAddManualSignToManualSign(manualSignInVo);
        manualSign.setSignTime(new Date());
        return manualMapper.insertManualSign(manualSign);
    }

    @Override
    public Integer insertManualSignOff(ManualSignOffVo manualSignOffVo) {
        ManualSign manualSign= ConvertSignUtils.convertAddManualSignToManualSignOff(manualSignOffVo);
        manualSign.setSignTime(new Date());
        return manualMapper.insertManualSignOff(manualSign);
    }

    @Override
    public ManualSignInSearchVo listSignInVo(int userId) {

        ManualSignInSearchVo manualSignInSearchVo= manualMapper.searchManual(userId);
        return manualSignInSearchVo;
    }

    @Override
    public List<ManualVo> listManualSearch(ManualSearchVo manualSearchVo) {

        List<ManualVo> viewSignList = manualMapper.SearchManualHistory(manualSearchVo);


        return viewSignList;





    }
}
