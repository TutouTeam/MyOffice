package com.capgemini.jtp.service.impl;

import com.capgemini.jtp.mapper.RoleMapper;
import com.capgemini.jtp.service.RoleInfoService;
import com.capgemini.jtp.vo.request.RoleAddVo;
import com.capgemini.jtp.vo.request.RoleDeleteVo;
import com.capgemini.jtp.vo.response.RoleListVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class RoleInfoServiceImpl implements RoleInfoService {

    @Autowired
    RoleMapper roleMapper;


    @Override

/**
 * 角色管理
 */
    public List<RoleListVo> roleInfolist() {
        return roleMapper.listRole();
    }

    @Override
    public Integer updateRole(RoleAddVo roleAdd) {
        return roleMapper.updateRoleById(roleAdd);
    }

    @Override
    public Integer deleteRole(int roleId) {
        return roleMapper.deleteRoleById(roleId);
    }

    @Override
    public Integer addRole(RoleAddVo roleAddVo) {
        return roleMapper.addRoleById(roleAddVo) ;
    }
}
