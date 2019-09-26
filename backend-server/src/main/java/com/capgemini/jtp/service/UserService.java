package com.capgemini.jtp.service;

//import com.capgemini.jtp.entity.Hr;
//import com.capgemini.jtp.entity.Message;
//import com.capgemini.jtp.vo.employee.request.HrEditVo;
//import com.capgemini.jtp.vo.employee.request.HrSearchVo;
//import com.capgemini.jtp.vo.employee.response.HrResponseVo;
import com.capgemini.jtp.vo.request.UserDeleteVo;
import com.capgemini.jtp.vo.request.UserEditVo;
import com.capgemini.jtp.vo.request.UserMassageVo;
import com.capgemini.jtp.vo.response.UserListVo;
import com.capgemini.jtp.vo.response.UserMassageRespVo;
import com.capgemini.jtp.vo.response.UserResponseVo;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;

import java.util.List;
import java.util.Map;

/**
 * @Description: TODO
 * @Classname : HrService
 * @author: Jason Jin
 * @date: 2019/5/19 11:44 PM
 */
public interface UserService extends UserDetailsService {

//    int hrReg(HrEditVo hrEditVo);
//
//    List<Hr> getHrsByKeywords(String keywords);
//
    int updateUser(UserEditVo userEditVo);

    List<UserListVo> listUserVo();

    UserDetails loadUserMessage(UserResponseVo userResponseVo);

    UserMassageRespVo userMassage(UserMassageVo userMassageVo);
    List<UserMassageRespVo> userlistMassage();


//    public MultipartFile updUserProfile(UserEditVo userEditVo);


    Integer addUser(UserEditVo userEditVo);

    Integer deleteUserByUserId(UserDeleteVo userDeleteVo);
//
//    int updateHrRoles(Long hrId, Long[] rids);
//
//    int addRolesForHr(Long hrId, Long[] rids);
//
//    Hr getHrById(Long hrId);
//
//    int deleteHr(Long hrId);
//
//    List<Hr> getAllHrExceptAdmin();
//
//    List<Hr> getAllHr();
//
//    Map<Long, Hr> getAllHrMap();
//
//    int hrRole(String username);
//
//    int isAdmin(Long hrId);
//
//    Long getLength(Long[] longs);
//
//    HrResponseVo listHr(HrSearchVo hrSearchVo);
//
//    String getRemark(Long hrId);
//
//    List<Message> getMessages(Long[] longs);
//
//    void updateRemark(String str);
//
////    void updateRemarkZero(He);
//
//    void deleteRemark(Long id);
}