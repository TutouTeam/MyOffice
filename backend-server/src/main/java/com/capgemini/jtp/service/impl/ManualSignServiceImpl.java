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
    public ManualSignInSearchVo insertManualSign(ManualSignInVo manualSignInVo) {
        ManualSign manualSign = ConvertSignUtils.convertAddManualSignToManualSign(manualSignInVo);
        manualSign.setSignTime(new Date());
        manualSign.setUserId(manualSignInVo.getUserId());
        manualMapper.insertManualSignOff(manualSign);
        ManualSignInSearchVo manualSignInSearchVo= manualMapper.searchManual(manualSignInVo.getUserId());
        return manualSignInSearchVo;
    }

    @Override
    public ManualSignInSearchVo insertManualSignOff(ManualSignOffVo manualSignOffVo) {
        ManualSign manualSign= ConvertSignUtils.convertAddManualSignToManualSignOff(manualSignOffVo);
        manualSign.setSignTime(new Date());
        manualSign.setUserId(manualSignOffVo.getUserId());
        manualMapper.insertManualSignOff(manualSign);
        ManualSignInSearchVo manualSignInSearchVo= manualMapper.searchManual(manualSignOffVo.getUserId());
        return manualSignInSearchVo;
    }

//    @Override
//    public ManualSignInSearchVo listSignInVo(int userId) {
//
//        ManualSignInSearchVo manualSignInSearchVo= manualMapper.searchManual(userId);
//        return manualSignInSearchVo;
//    }

    @Override
    public List<ManualVo> listManualSearch(ManualSearchVo manualSearchVo) {

        List<ManualVo> viewSignList = manualMapper.SearchManualHistory(manualSearchVo);
        for(ManualVo manualVo:viewSignList){
            if(manualVo.getSignTag().equals("1")){
                manualVo.setSignTag("签到");

            }else
                manualVo.setSignTag("签退");

        }

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
        // 从一个 Calendar 对象中获取 Date 对象
        sta.setTime(start);
        // 所以我们必需先获得一个实例，然后设置 Date 对象
        Date stop=countSignSearchVo.getStopTime();
        Calendar sto = Calendar.getInstance();
        sto.setTime(stop);
        int weekend=0;  //周数
        int countTime=0;
        List<String> strDate = new ArrayList<>();
        while(start.getTime()<=stop.getTime()){

         //计算周
            if (sta.get(Calendar.DAY_OF_WEEK) == Calendar.SUNDAY ||
                    sta.get(Calendar.DAY_OF_WEEK) == Calendar.SATURDAY) {
                weekend+=1;  //并无特殊应用的点，主要为了总天数排除周六周日
            }
            else {
                //平日
                countTime += 1;
                String str1 = DateFormatUtils.format(sta.getTime(), "yyyy-MM-dd");
                strDate.add(str1);

            }
            sta.add(Calendar.DAY_OF_YEAR, 1);//一年当中的第几天
            start= sta.getTime();//为实现下一层循环，进行天数递增
        }


        List<CountSignVo> countSignList = manualMapper.listCountSign(countSignSearchVo);
        List<CountSignVo> countSignRespList =new ArrayList<>();
        String name =" ";
        for (CountSignVo countSignVo : countSignList){

            //获取名字并传入Mapper
            if(name.equals(countSignVo.getUserName())){continue;}
            name=countSignVo.getUserName();
            countSignVo.setUserName(name);
            countSignVo.setLate(manualMapper.countLate(countSignSearchVo));//迟到次数
            countSignVo.setLeaveEarly(manualMapper.countLeaveEarly(countSignSearchVo));//早退次数

            int contyear=manualMapper.listYearTime(countSignSearchVo);//按条件搜索的总签到天数
            countSignVo.setAbsenteeism(countTime-contyear); //计算矿工天数counttime 为上述代码所获得的时间区间总天数，除去周六周日
            DecimalFormat df=new DecimalFormat("0.00");//定义结果格式
            String percentage = df.format((float)((float)contyear/(float)countTime)*(float)100);
            System.out.println(percentage+" "+contyear+" "+countTime);
            countSignVo.setAttendance(percentage+"%");
            countSignRespList.add(countSignVo);
        }

        return countSignRespList;
    }
    }

