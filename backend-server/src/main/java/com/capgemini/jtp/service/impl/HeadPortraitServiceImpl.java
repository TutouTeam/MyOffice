package com.capgemini.jtp.service.impl;

import com.capgemini.jtp.mapper.UserMapper;
import com.capgemini.jtp.service.HeadPortraitService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.awt.*;
import java.io.*;
import static com.capgemini.jtp.utils.MarkUtils.markImageByText;

@Service
public class HeadPortraitServiceImpl implements HeadPortraitService {

    @Autowired
    UserMapper userMapper;
    @Override
    public int headUpload(MultipartFile file, HttpServletRequest request)  {
        String fileName=file.getOriginalFilename();
        System.out.println("原始文件名："+fileName);

        Object object = request.getSession().getAttribute("operationUserId");
        int userId;
        if(object != null){
            userId = Integer.valueOf(String.valueOf(object));
        }else userId=0;
        String userName = userMapper.getMassageById(userId).getUsername();

        String newFileName=userName+".jpg";
        String path = "d:/MyOffice/images/Users/";

        File f = new File(path);
        File files;
        int temps = (int) (1 + Math.random() * (99999 - 1 + 1));
        files = new File("d:/MyOffice/images/Users/" + temps + ".jpg");
        if(!f.exists())
            f.mkdirs();
        if(!file.isEmpty()){
            FileOutputStream fos=null;
            FileInputStream fis=null ;

            try{
                fos= new FileOutputStream(path+newFileName);
                InputStream in = file.getInputStream();
                file.transferTo(files);
                fis=new FileInputStream(files);
                byte [] b=new byte[2048];
                int len;
                while ((len=fis.read(b))!=-1){
                    fos.write(b,0,len);
                }

            }catch(Exception e){
                e.printStackTrace();
                return -1;
            }finally {
                if (fos!=null){
                    try {
                        fos.close();
                       // System.out.println("关闭fos");
                    }catch (IOException e){
                        e.printStackTrace();
                    }
                }
                if (fis!=null) {
                    try {
                        fis.close();
                        //System.out.println("关闭fis");
                    } catch (IOException e) {
                        e.printStackTrace();
                    }
                }

            }
        }
        System.out.println("上传图片到："+path+newFileName);
        int i=markImageByText("我的office系统",path+newFileName,path+newFileName,1, Color.red,"JPG");
        if(files.exists())
        {
            if(files.delete())
            {
                System.out.println("临时文件删除成功");
            }else
                System.out.println("临时文件删除失败");
        }

        return i;
    }
    @Override
   public int headDownload(HttpServletRequest request, HttpServletResponse response){
//        Object object = request.getSession().getAttribute("operationUserId");
//        int userId=0;
//        if(object != null){
//            userId = Integer.valueOf(String.valueOf(object));
//        }
//        String userName = userMapper.getMassageById(userId).getUsername();
//        String fileName=userName+".jpg";
//        String path = "d:/MyOffice/images/Users/";
//        File file = new File(path+fileName);
//        if(!file.exists()){
//            return -1;//不存在
//        }
//        String  realName = file.getName();
//        response.setHeader("Content-disposition","attachment;filename="+ URLEncoder.encode(realName,"UTF-8"));
//        FileInputStream fis = new FileInputStream(fileName)
       return 0;
    }
}
