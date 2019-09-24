package com.capgemini.jtp.service.impl;

import com.capgemini.jtp.common.UserUtils;
import com.capgemini.jtp.entity.Menu;
import com.capgemini.jtp.mapper.MenuMapper;
import com.capgemini.jtp.service.MenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheConfig;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

/**
 * @Description: TODO
 * @Classname : MenuService
 * @author: Jason Jin
 * @date: 2019/5/19 11:43 PM
 */
@Service
@Transactional
@CacheConfig(cacheNames = "menus_cache")
public class MenuServiceImpl implements MenuService {

    @Autowired
    MenuMapper menuMapper;

//    @Cacheable(key = "#root.methodName")
    @Override
    public List<Menu> getAllMenu(){
        return menuMapper.getAllMenu();
    }

    @Override
    public List<Menu> getMenusByHrId() {
        return menuMapper.getMenusByUserId(UserUtils.getCurrentUser().getUserId());
    }

//    @Override
//    public Boolean isCanUpMenu(Menu menu) {
//        //首先判断该菜单是否在同级菜单的最上方
//        List<Integer> departIdList = new ArrayList<>();
//        departIdList = menuMapper.getDisplayOrderBynodeId(menu.getNodeId());
//        int minDepartId = departIdList.get(0);
//        System.out.println("--------------minDepartId=" + minDepartId);
//        //相等，即已经是最上方
//        if (menu.getDisplayOrder() > minDepartId){
//            return true;
//        }
//        else{
//            return false;
//        }
//    }
//
//    @Override
//    public int upMenu(Menu menu) {
//        int displayOrder = menu.getDisplayOrder();
//        int newDisplayOrder = displayOrder--;
//        menu.setDisplayOrder(newDisplayOrder);
//        menuMapper.setOneDisplayOrder(menu);
//        //根据信息查找对调的对象
//        Menu twoMenu = menuMapper.selectMenuByParentNodeIdAndDisplayOrder(menu);
//        twoMenu.setDisplayOrder(displayOrder);
//        menuMapper.setOneDisplayOrder(twoMenu);
//        return 1;
//    }

//    @Override
//    public List<Menu> menuTree() {
//        return menuMapper.menuTree();
//    }
//
//    @Override
//    public List<Long> getMenusByRid(Long rid) {
//        return menuMapper.getMenusByRid(rid);
//    }
}
