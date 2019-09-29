package com.capgemini.jtp.controller;

import com.capgemini.jtp.mapper.UserMapper;
import com.capgemini.jtp.service.HeadPortraitService;
import com.capgemini.jtp.vo.base.RespBean;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;

@RestController
@Api("头像")
@RequestMapping("/HeadPortrait")
public class HeadPortraitController {
    @Autowired
    HeadPortraitService headPortraitService;

    @Autowired
    UserMapper userMapper;
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

    @ApiOperation(value = "显示头像")
    @ResponseBody
    @RequestMapping(value = "/getload", method = RequestMethod.POST)
    public void getimg(HttpServletRequest request, HttpServletResponse response) throws IOException{

        Object object = request.getSession().getAttribute("operationUserId");
        int userId=0;
        if(object != null){
            userId = Integer.valueOf(String.valueOf(object));
        }
        String userName = userMapper.getMassageById(userId).getUsername();

        String newFileName=userName+".jpg";
        //ServletContext sc = request.getSession().getServletContext();
        //String path = sc.getRealPath("/img/")+ DateUtils.getCurrentDateTime()+ File.separator;//设定文件保存的目录
        String path = "d:/MyOffice/images/Users/";

        try {
            FileInputStream hFile=new FileInputStream(path+userName);
            int i=hFile.available();
            byte data[]=new byte[i];
            hFile.read(data);
            hFile.close();
            response.setContentType("image/jpeg");
            OutputStream toClient=response.getOutputStream();
            toClient.write(data);
            toClient.close();
        }catch (IOException e){
            PrintWriter toClient=response.getWriter();
            response.setContentType("text/html;charset=utf-8");
            toClient.write("无法打开图片");
            toClient.close();
        }


    }


}
