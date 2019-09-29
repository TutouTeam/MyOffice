package com.capgemini.jtp.service.impl;

import com.capgemini.jtp.common.UserUtils;
import com.capgemini.jtp.entity.FileInfo;
import com.capgemini.jtp.entity.Menu;
import com.capgemini.jtp.entity.Role;
import com.capgemini.jtp.mapper.FileInfoMapper;
import com.capgemini.jtp.mapper.MenuMapper;
import com.capgemini.jtp.service.MenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheConfig;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
    @Autowired
    FileInfoMapper fileInfoMapper;

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
//    public List<FileInfo> getTree() {
//        //返回
//        List<FileInfo> allTree = fileInfoMapper.getAllMenus();
//        Map<Integer,FileInfo> map = new HashMap<>();
//        //ID 为 key 存储到map 中
//        for (FileInfo tree:allTree) {
//            map.put(tree.getParentId(),tree);
//        }
//        List<FileInfo> treeList=new  ArrayList<FileInfo>();
//        for (FileInfo tree:allTree) {
//            //子集ID返回对象，有则添加。
//            FileInfo tree1 = map.get(tree.getParentId());
//            if(tree1 != null){
//                tree1.getTreeList().add(tree);
//            }else {
//                treeList.add(tree);
//            }
//        }
//        return treeList;
//    }
//@Override
//public Map<String, List<FileInfo>> getMenuTree() {
//    Map<String, List<FileInfo>> menuTree = new HashMap<>();
//    List<FileInfo> allMenus = fileInfoMapper.getAllMenus();
//    List<Role> userRoles = UserUtils.getCurrentUser().getRoles();
//
//    for (FileInfo menu : allMenus) {
//        if (menu.getParentId()==0 ) {
//            List<FileInfo> children = new ArrayList<>();
//            for (FileInfo child : allMenus) {
//                if (child.getParentId()==menu.getFileId() ) {
//                    children.add(child);
//                }
//            }
//            menuTree.put(menu.getFileName(), children);
//        }
//    }
//
//    return menuTree;
//}
//    @Override
//    public  List<FileInfo> getMenuTree() {
//        List<FileInfo> menuTree = new ArrayList<>();
//        List<FileInfo> allMenus = fileInfoMapper.getAllMenus();
//
//
//        for (FileInfo menu : allMenus) {
//            if (menu.getParentId()==0) {
//
//                for (FileInfo child : allMenus) {
//                    List<FileInfo> children = new ArrayList<>();
//
//                    if (child.getParentId() == menu.getFileId()) {
//
//                    }
//                    }
//                }
//            menuTree.put(menu, children);
//            }
//
//        //}
//        return menuTree;
////    }


    public List<FileInfo> getTree() {
        List<FileInfo> tree = fileInfoMapper.getTree();//返回所有父级
        List<FileInfo> allTree = fileInfoMapper.getAllMenus();//返回所有数据
        List<FileInfo> treeList = new ArrayList<>();
        for (FileInfo list : tree) {
            if(list.getParentId()==0){
            list.setTreeList(treeList(allTree,list.getFileId()));
            treeList.add(list);
            }
        }
        return treeList;
    }
    private static List<FileInfo> treeList(List<FileInfo> list, Integer rootId) {
        List<FileInfo> newList = new ArrayList<>();
        for (FileInfo tree : list) {
            if (tree.getParentId() == rootId.intValue()) {
                List<FileInfo> tempList = treeList(list, tree.getFileId());
                tree.setTreeList(tempList);
                newList.add(tree);
            }
        }
        return newList;
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
