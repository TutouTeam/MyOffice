package com.capgemini.jtp.service;

//import com.capgemini.jtp.entity.Hr;
//import com.capgemini.jtp.entity.Message;
//import com.capgemini.jtp.vo.employee.request.HrEditVo;
//import com.capgemini.jtp.vo.employee.request.HrSearchVo;
//import com.capgemini.jtp.vo.employee.response.HrResponseVo;
import com.capgemini.jtp.vo.request.UserEditVo;
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