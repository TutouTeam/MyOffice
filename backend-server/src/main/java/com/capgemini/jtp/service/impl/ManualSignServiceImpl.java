package com.capgemini.jtp.service.impl;

import com.capgemini.jtp.entity.ManualSign;
import com.capgemini.jtp.mapper.ManualMapper;
import com.capgemini.jtp.service.ManualSignService;
import com.capgemini.jtp.utils.ConvertSignUtils;

import com.capgemini.jtp.vo.request.*;
import com.capgemini.jtp.vo.response.BranchVo;
import com.capgemini.jtp.vo.response.CountSignVo;
import com.capgemini.jtp.vo.response.DepartVo;
import com.capgemini.jtp.vo.response.ManualVo;
import org.apache.commons.lang.time.DateFormatUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Calendar;
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

    @Override
    public List<BranchVo> listBranch() {

        return manualMapper.listBranch();
    }

    @Override
    public List<DepartVo> listDepart(String branchName) {

        return manualMapper.listDepart(branchName);
    }

    @Override
    public List<CountSignVo> listCountSign(CountSignSearchVo countSignSearchVo) {

//        统计时间段内有多少个周六周日,与其他天数
        Date start=countSignSearchVo.getStartTime();
        Calendar sta = Calendar.getInstance();
        sta.setTime(start);
        Date stop=countSignSearchVo.getStopTime();
        Calendar sto = Calendar.getInstance();
        sto.setTime(stop);
        int weekend=0;
        int countTime=0;
        List<String> strDate = new ArrayList<>();
        while(start.getTime()<=stop.getTime()){
            if (sta.get(Calendar.DAY_OF_WEEK) == Calendar.SUNDAY ||
                    sta.get(Calendar.DAY_OF_WEEK) == Calendar.SATURDAY) {
                weekend+=1;
            }
            else {
                countTime += 1;
                String str1 = DateFormatUtils.format(sta.getTime(), "yyyy-MM-dd");
                strDate.add(str1);

            }
            sta.add(Calendar.DAY_OF_YEAR, 1);
            start= sta.getTime();
        }


        List<CountSignVo> countSignList = manualMapper.listCountSign(countSignSearchVo);
        List<CountSignVo> countSignRespList =new ArrayList<>();
        String name =" ";
        for (CountSignVo countSignVo : countSignList){

            //获取名字并传入Mapper
            if(name.equals(countSignVo.getUserName())){continue;}
            name=countSignVo.getUserName();
            countSignVo.setUserName(name);
            countSignVo.setLate(manualMapper.countLate(countSignSearchVo));
            countSignVo.setLeaveEarly(manualMapper.countLeaveEarly(countSignSearchVo));

            int contyear=manualMapper.listYearTime(countSignSearchVo);
            countSignVo.setAbsenteeism(countTime-contyear);
            DecimalFormat df=new DecimalFormat("0.00");
            String percentage = df.format((float)((float)contyear/(float)countTime)*(float)100);
            System.out.println(percentage+" "+contyear+" "+countTime);
            countSignVo.setAttendance(percentage+"%");
            countSignRespList.add(countSignVo);
        }

        return countSignRespList;
    }
    }

