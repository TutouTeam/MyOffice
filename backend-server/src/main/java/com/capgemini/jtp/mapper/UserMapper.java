package com.capgemini.jtp.mapper;

//import com.capgemini.jtp.entity.Employee;
import com.capgemini.jtp.entity.Role;
import com.capgemini.jtp.entity.User;
//import com.capgemini.jtp.vo.employee.request.UserEditVo;
import com.capgemini.jtp.vo.request.MessageUserSearchVo;
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

//    UserDetails loadUserMessage(UserResponseVo userResponseVo);

    List<User> listUserVo();

    Integer addUser(@Param("user") User user);

    Integer deleteUserByUserId(@Param("user") User user);


    List<Role> getRolesByUserId(int userId);


    int updateUser(@Param("user") User user);



    /**
     * create by: MmmLll_Shen
     * description:以下方法为消息类增加和更改
     * create time: 11:06 2019/9/25
     */
    List<Integer> getAllUserIds();

    User getUser(@Param("userId") int userId);

    List<User> selectUserListByMessageUser(@Param("messageUserSearchVo") MessageUserSearchVo messageUserSearchVo);
}

