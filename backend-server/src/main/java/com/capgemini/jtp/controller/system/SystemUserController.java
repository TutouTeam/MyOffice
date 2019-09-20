package com.capgemini.jtp.controller.system;

import com.capgemini.jtp.entity.User;
import com.capgemini.jtp.service.UserService;
import com.capgemini.jtp.vo.base.RespBean;

import com.capgemini.jtp.vo.request.UserEditVo;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.List;


/**
 * create by: MmmLll_Shen
 * description:
 * create time: 10:13 2019/9/20
 */
@Api("用户账户设置")
@RestController
@RequestMapping("/system/user")
public class SystemUserController {

    @Autowired
    UserService userService;

//    @RequestMapping("/id/{hrId}")
//    public Hr getHrById(@PathVariable Long hrId) {
//        return hrService.getHrById(hrId);
//    }




//    @RequestMapping(value = "/roles", method = RequestMethod.PUT)
//    public RespBean updateHrRoles(Long hrId, Long[] rids) {
//        if (hrService.updateHrRoles(hrId, rids) == rids.length) {
//            return RespBean.ok("更新成功!");
//        }
//        return RespBean.error("更新失败!");
//    }

//    //显示已有的HR
//    @RequestMapping("/listHr")
//    public List<Hr> getHrsByKeywords() {
//        List<Hr> hrs = hrService.getAllHr();
//        return hrs;
//    }

//    @ApiOperation("增加JTP运营人员")
//    @ResponseBody
//    @RequestMapping(value = "/add", method = RequestMethod.POST)
//    public RespBean hrReg(@RequestBody HrEditVo hrEditVo) {
//        int i = hrService.hrReg(hrEditVo);
//        if (i == 1) {
//            int j = hrService.hrRole(hrEditVo.getUsername());
//            if (j == 1) {
//                return RespBean.ok("注册成功!");
//            }
//        } else if (i == -1) {
//            return RespBean.error("用户名重复，注册失败!");
//        }
//        return RespBean.error("注册失败!");
//    }



    @ApiOperation("用户修改密码")
    @ResponseBody
    @RequestMapping(value = "/edit", method = RequestMethod.POST)
    public RespBean updateHr(@RequestBody UserEditVo userEditVo) {
        if (userService.updateUser(userEditVo) == 1) {
            return RespBean.ok("更新成功!");
        }
        return RespBean.error("更新失败!");
    }





}
