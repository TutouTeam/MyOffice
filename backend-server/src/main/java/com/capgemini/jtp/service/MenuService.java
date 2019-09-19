package com.capgemini.jtp.service;

import com.capgemini.jtp.entity.Menu;

import java.util.List;


/**
 * create by: MmmLll_Shen
 * description:
 * create time: 14:23 2019/9/19
 */
public interface MenuService {

    public List<Menu> getAllMenu();

    public List<Menu> getMenusByHrId();

//    public List<Menu> menuTree();
//
//    public List<Long> getMenusByRid(Long rid);
}
