package com.capgemini.jtp.controller;

import com.capgemini.jtp.service.ManualSignService;
import com.capgemini.jtp.service.impl.ManualSignServiceImpl;

import com.capgemini.jtp.vo.base.RespBean;
import com.capgemini.jtp.vo.request.ManualSearchVo;
import com.capgemini.jtp.vo.request.ManualSignInSearchVo;
import com.capgemini.jtp.vo.request.ManualSignInVo;
import com.capgemini.jtp.vo.request.ManualSignOffVo;
import com.capgemini.jtp.vo.response.ManualVo;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Api("考勤信息")
@RestController
@RequestMapping("/admin")
public class ManualSignController {
    @Autowired
    ManualSignService manualSignService;

    @RequestMapping(value = "/sign/in", method = RequestMethod.POST)
    @ApiOperation(value = "签到")
    public String insertSignIn(@RequestBody ManualSignInVo manualSignInVo) {
        if (manualSignInVo != null) {
            if (manualSignService.insertManualSign(manualSignInVo) != 0) {
                return "签到成功";
            } else {
                return "签到失败";
            }
        } else {
            return "签到失败";
        }
    }

    @RequestMapping(value = "/sign/off", method = RequestMethod.POST)
    @ApiOperation(value = "签退")
    public String insertSignOff(@RequestBody ManualSignOffVo manualSignOffVo) {
        if (manualSignOffVo != null) {
            if (manualSignService.insertManualSignOff(manualSignOffVo) != 0) {
                return "签退成功";
            } else {
                return "签退失败";
            }
        } else {
            return "签退失败";

        }
    }
   @GetMapping("/signIn/{userId}")
   @ApiOperation(value="个人签到信息")
   public ManualSignInSearchVo listExperience(@PathVariable int userId) {
       ManualSignInSearchVo manualSignInSearchVo = manualSignService.listSignInVo(userId);

       return manualSignInSearchVo;
   }

   @RequestMapping("/ManualSearch")
    @ApiOperation("历史签到记录")
    public RespBean listManualSearch(@RequestBody ManualSearchVo manualSearchVo)
   {
       List<ManualVo> viewSignList = manualSignService.listManualSearch(manualSearchVo);
       if (viewSignList != null) {
           return RespBean.ok(viewSignList);
       }
       return RespBean.error("查询失败！");


   }

}

