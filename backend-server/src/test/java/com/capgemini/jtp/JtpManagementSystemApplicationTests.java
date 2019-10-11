package com.capgemini.jtp;


import com.capgemini.jtp.mapper.MenuMapper;
import lombok.extern.slf4j.Slf4j;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import javax.imageio.ImageIO;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
/**
 * @ClassName: EmpServiceImplTest
 * @Description: EmpService测试类
 * @Author: Brady
 * @Date: 2019/6/23 11:50 AM
 */

@Slf4j
@RunWith(SpringRunner.class)
@SpringBootTest(classes = JtpSysApplication.class)
public class JtpManagementSystemApplicationTests {
    @Autowired
    private MenuMapper menuMapper;
        @Test
        public void testImage(){
            markImageByText("我的office系统","D:/1.jpg","D:3.jpg",1,Color.red,"JPG");
        }


        /**
         * 给图片添加水印文字、可设置水印文字的旋转角度
         * @param logoText 要写入的文字
         * @param srcImgPath 源图片路径
         * @param newImagePath 新图片路径
         * @param degree 旋转角度
         * @param color  字体颜色
         * @param formaName 图片后缀
         */
        public  void markImageByText(String logoText, String srcImgPath,String newImagePath,Integer degree,Color color,String formaName) {
            InputStream is = null;
            OutputStream os = null;
            try {
                // 1、源图片
                java.awt.Image srcImg = ImageIO.read(new File(srcImgPath));
                BufferedImage buffImg = new BufferedImage(srcImg.getWidth(null),srcImg.getHeight(null), BufferedImage.TYPE_INT_RGB);
                // 2、得到画笔对象
                Graphics2D g = buffImg.createGraphics();
                // 3、设置对线段的锯齿状边缘处理
                g.setRenderingHint(RenderingHints.KEY_INTERPOLATION,RenderingHints.VALUE_INTERPOLATION_BILINEAR);
                g.drawImage(srcImg.getScaledInstance(srcImg.getWidth(null), srcImg.getHeight(null), java.awt.Image.SCALE_SMOOTH), 0, 0, null);
                // 4、设置水印旋转
                //g.translate(0,0);
                if (null != degree) {
                    g.rotate(Math.toRadians(degree),  buffImg.getWidth()/2,buffImg.getHeight() /2);
                }
                // 5、设置水印文字颜色
                g.setColor(color);
                // 6、设置水印文字Font
                g.setFont(new java.awt.Font("宋体", java.awt.Font.BOLD, buffImg.getWidth() /9));
                // 7、设置水印文字透明度
                g.setComposite(AlphaComposite.getInstance(AlphaComposite.SRC_ATOP, 0.15f));
                // 8、第一参数->设置的内容，后面两个参数->文字在图片上的坐标位置(x,y)
                g.drawString(logoText,  buffImg.getWidth()/15 , buffImg.getHeight()/10*9);
                // 9、释放资源
                g.dispose();
                // 10、生成图片
                os = new FileOutputStream(newImagePath);
                ImageIO.write(buffImg, formaName, os);
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                try {
                    if (null != is)
                        is.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
                try {
                    if (null != os)
                        os.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }



//    @Test
//    public void aaaTest(){
//        menuMapper.getAllMenu();
//    }

//    @Autowired
//    EmpService empService;
//
//    @Test
//    public void addEmp(){
//        EmployeeEditVo employeeEditVo = new EmployeeEditVo();
//        Long a = Long.valueOf(31112);
//        employeeEditVo.setEmpId(a);
//        empService.addEmp(employeeEditVo);
//    }
//
//    @Test
//    public void listEmp() {
//        try {
//            //执行业务逻辑处理
//            EmployeeResponseVo employeeResponseVo = empService.listEmp(new EmployeeSearchVo());
//            //JSON转换
//            JSONArray jsonArray = JSONArray.fromObject(employeeResponseVo.getEmployeeVos());
//            JSONObject jsonObject = JSONObject.fromObject(empService.listEmp(new EmployeeSearchVo()));
//            log.info("################################# 执行成功 ##################################");
//            log.info("#################################打印结果日志#################################");
//            log.info("数据总数 : " + employeeResponseVo.getListCount());
//            log.info("查询结果 : " + jsonArray.toString());
//            log.info("#################################打印结果日志#################################");
//        } catch (Exception e) {
//            log.error("################################# 执行失败 ##################################");
//            log.error("#################################打印报错信息##################################");
//            log.error(e.getMessage(), e);
//            log.error("#################################打印报错信息##################################");
//        }
//    }
}