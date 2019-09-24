package com.capgemini.jtp.mapper;

//import com.capgemini.jtp.entity.Employee;
import com.capgemini.jtp.entity.Role;
import com.capgemini.jtp.entity.User;
//import com.capgemini.jtp.vo.employee.request.UserEditVo;
import com.capgemini.jtp.vo.response.UserResponseVo;
import org.apache.ibatis.annotations.Param;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Repository;

import java.util.List;


/**
 * create by: MmmLll_Shen
 * description:
 * create time: 18:04 2019/8/24
 */
@Repository

public interface UserMapper {

    User loadUserByUsername(String username);

    UserDetails loadUserMessage(UserResponseVo userResponseVo);

    List<User> listUserVo();

    Integer addUser(@Param("user") User user);

    Integer deleteUserByUserId(@Param("user") User user);

//    User loadUserByEmpId(Long empId);
//
    List<Role> getRolesByUserId(int userId);

//    int userReg(@Param("userEdit") UserEditVo userEditVo);
//
//    List<User> getUsersByKeywords(@Param("keywords") String keywords);
//
    int updateUser(@Param("user") User user);
//
//    int deleteRoleByUserId(Long userId);
//
//    int addRolesForUser(@Param("userId") Long userId, @Param("rids") Long[] rids);
//
 //   User getUserById(Long userId);
//
//    int deleteUser(Long UserId);
//
//    List<User> getAllUser(@Param("currentId") Long currentId);
//
//    //本系统不需要多角色，权限向下继承，不需要List
//    Long getRoleByUserId(@Param("id") Long id);
//
////    List<UserVo> listAllUser(@Param("search") UserSearchVo UserSearchVo);
//
////    Long countHr(@Param("search") HrSearchVo hrSearchVo);
//
//    Employee getEmpByEmpId(Long empId);
//
//    Long getEmpIdById(@Param("id") Long id);
}

