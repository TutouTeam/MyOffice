package com.capgemini.jtp.service.impl;

//import com.capgemini.jtp.common.HrUtils;
//import com.capgemini.jtp.entity.Hr;
//import com.capgemini.jtp.entity.Message;
//import com.capgemini.jtp.mapper.HrMapper;
//import com.capgemini.jtp.service.HrService;
//import com.capgemini.jtp.service.UserService;
//import com.capgemini.jtp.vo.employee.request.HrEditVo;
//import com.capgemini.jtp.vo.employee.request.HrSearchVo;
//import com.capgemini.jtp.vo.employee.response.HrResponseVo;
import com.capgemini.jtp.entity.User;
import com.capgemini.jtp.mapper.UserMapper;
import com.capgemini.jtp.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @Description: TODO
 * @Classname : HrService
 * @author: Jason Jin
 * @date: 2019/5/19 11:44 PM
 */
@Service
@Transactional
public class UserServiceImpl implements UserService {
    @Autowired
    UserMapper userMapper;

    @Override
    public UserDetails loadUserByUsername(String s) throws UsernameNotFoundException {
        User user = userMapper.loadUserByUsername(s);
        System.out.println("用户名：" + s);
        if (user == null) {
            throw new UsernameNotFoundException("用户名不对");
        }
        return user;
    }

//    @Autowired
//    HrMapper hrMapper;
//
//    @Override
//    public UserDetails loadUserByUsername(String s) throws UsernameNotFoundException {
//        Hr hr = hrMapper.loadUserByUsername(s);
//        System.out.println("用户名：" + s);
//        if (hr == null) {
//            throw new UsernameNotFoundException("用户名不对");
//        }
//        return hr;
//    }
//
//    @Override
//    public int hrReg(HrEditVo hrEditVo) {
//        //如果用户名存在，返回错误
//        if (hrMapper.loadUserByUsername(hrEditVo.getUsername()) != null) {
//            return -1;
//        }
//        BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
//        String encode = encoder.encode(hrEditVo.getPassword());
//        hrEditVo.setPassword(encode);
//        return hrMapper.hrReg(hrEditVo);
//    }
//
//    @Override
//    public int hrRole(String username) {
//        Hr hr = hrMapper.loadUserByUsername(username);
//        Long[] rids = {Long.valueOf(1)};
//        if (hr != null) {
//            return hrMapper.addRolesForHr(hr.getId(), rids);
//        }
//        return -1;
//    }
//
//    @Override
//    public int addRolesForHr(Long hrId, Long[] rids) {
//
//        return hrMapper.addRolesForHr(hrId, rids);
//    }
//    @Override
//    public List<Hr> getHrsByKeywords(String keywords) {
//        return hrMapper.getHrsByKeywords(keywords);
//    }
//
//    @Override
//    public int updateHr(HrEditVo hrEditVo) {
//        Hr hr = new Hr();
//        hr.setId(hrEditVo.getId());
//        hr.setName(hrEditVo.getName());
//        if(hrEditVo.getPassword()!=null&&!("".equals(hrEditVo.getPassword()))){
//            System.out.println("密码不为空，执行密码加密");
//            BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
//            String encode = encoder.encode(hrEditVo.getPassword());
//            hr.setPassword(encode);
//        }
//        hr.setUsername(hrEditVo.getUsername());
//        return hrMapper.updateHr(hr);
//    }
//
//    @Override
//    public int updateHrRoles(Long hrId, Long[] rids) {
//        int i = hrMapper.deleteRoleByHrId(hrId);
//        return hrMapper.addRolesForHr(hrId, rids);
//    }
//
//    @Override
//    public Hr getHrById(Long hrId) {
//        return hrMapper.getHrById(hrId);
//    }
//
//    @Override
//    public int deleteHr(Long hrId) {
//        hrMapper.deleteRoleByHrId(hrId);
//        return hrMapper.deleteHr(hrId);
//    }
//
//    @Override
//    public List<Hr> getAllHrExceptAdmin() {
//        return hrMapper.getAllHr(HrUtils.getCurrentHr().getId());
//    }
//
//    @Override
//    public List<Hr> getAllHr() {
//        return hrMapper.getAllHr(null);
//    }
//
//    /**
//     * @Title: getSysUserMap
//     * @Description: 获取系统用户信息Map，键为数据库主键ID，值为对应系统用户对象
//     * @Param: []
//     * @Return: java.util.Map<java.lang.Long,com.capgemini.jtp.entity.Hr>
//     * @Throws:
//     * @Author: Brady
//     * @Date: 2019/6/24 1:18 PM
//     */
//    @Override
//    public Map<Long, Hr> getAllHrMap() {
//        Map<Long, Hr> hrMap = new HashMap<Long, Hr>();
//        List<Hr> hrList = getAllHr();
//        for (Hr hr : hrList) {
//            hrMap.put(hr.getId(), hr);
//        }
//        return hrMap;
//    }
//
//    /**
//     * @author: 陈宇雄
//     * @date: 2019/07/30
//     * @description: 判断是否管理员
//     * @classname: HrServiceImpl
//     */
//    @Override
//    public int isAdmin(Long hrId) {
//        if(hrMapper.getRoleByHrId(hrId) == 2){
//            return 1;
//        }else {
//            return 0;
//        }
//    }
//
//    /**
//     * @author: 陈宇雄
//     * @date: 2019/07/30
//     * @description: 显示hr列表
//     * @classname: HrServiceImpl
//     */
//    @Override
//    public HrResponseVo listHr(HrSearchVo hrSearchVo){
//        HrResponseVo hrResponseVo = new HrResponseVo();
//        hrResponseVo.setListCount(hrMapper.countHr(hrSearchVo));
//        hrResponseVo.setHrVoList(hrMapper.listAllHr(hrSearchVo));
//        return hrResponseVo;
//    }
//
//
//
//    /**
//     * create by: MmmLll_Shen
//     * description:获取消息列表字段
//     * create time: 14:57 2019/8/26
//     */
//    @Override
//    public String getRemark(Long hrId){
//        String remark = hrMapper.getMessageId(hrId);
//        return remark;
//    }
//
//
//
//    /**
//     * create by: MmmLll_Shen
//     * description:接收Long类型数组获取消息
//     * create time: 23:23 2019/8/26
//     */
//    @Override
//    public List<Message> getMessages(Long[] longs){
//        List<Message> messageList = hrMapper.getMessageList(longs);
//        return messageList;
//    }
//
//
//    /**
//     * create by: MmmLll_Shen
//     * description:获取长度
//     * create time: 0:59 2019/8/29
//     */
//    @Override
//    public Long getLength(Long[] longs){
//        return hrMapper.countMessage(longs);
//    }
//
//    @Override
//    public void updateRemark(String str) {
//        hrMapper.insertRemaek(str);
//    }
//
//    @Override
//    public void deleteRemark(Long id) {
//        hrMapper.deleteRemark(id);
//
//    }

}