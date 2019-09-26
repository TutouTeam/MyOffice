package com.capgemini.jtp.controller;

import com.capgemini.jtp.service.HeadPortraitService;
import com.capgemini.jtp.vo.base.RespBean;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;

@RestController
@Api("头像")
@RequestMapping("/HeadPortrait")
public class HeadPortraitController {
    @Autowired
    HeadPortraitService headPortraitService;
    @ApiOperation(value = "上传头像")
    @ResponseBody
    @RequestMapping(value = "/headUpload", method = RequestMethod.POST)
    public RespBean headUpload(@RequestParam(value = "file", required = false) MultipartFile file, HttpServletRequest request)  {
        System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
        int state =0;
        try {
           state= headPortraitService.headUpload(file, request);

        }catch (IOException e){
            e.getMessage();
        }
        if(state>-1){
            if(state==0){
                return RespBean.okMessage("上传成功,水印失败");
            }else
            return RespBean.okMessage("成功");

        }else {
            return RespBean.error("上传失败");
        }

    }

}
