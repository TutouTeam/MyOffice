package com.capgemini.jtp.mapper;



import com.capgemini.jtp.vo.request.RoleAddVo;
import com.capgemini.jtp.vo.request.RoleDeleteVo;
import com.capgemini.jtp.vo.response.RoleListVo;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface RoleMapper {
    List<RoleListVo> listRole();
    Integer updateRoleById(@Param("roleAdd") RoleAddVo roleAdd);
    Integer deleteRoleById(int roleId);
    Integer addRoleById(@Param("roleAddVo") RoleAddVo roleAddVo);
}
