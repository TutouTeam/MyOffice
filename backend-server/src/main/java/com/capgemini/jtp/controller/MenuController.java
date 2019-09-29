package com.capgemini.jtp.controller;

import com.capgemini.jtp.entity.FileInfo;
import com.capgemini.jtp.entity.Menu;
import com.capgemini.jtp.service.MenuService;
import com.capgemini.jtp.vo.base.RespBean;
import com.capgemini.jtp.vo.response.MenuListVo;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@Api("菜单信息")
@RestController
@RequestMapping("/menu")
public class MenuController {
    @Autowired
    MenuService menuService;

    @ApiOperation("获取目录树")
    @RequestMapping("/menuTree")
    public RespBean getMenuTree() {

        return RespBean.ok(menuService.getTree());
    }
}
