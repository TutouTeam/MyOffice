package com.capgemini.jtp.vo.request;

import lombok.Data;


/**
 * create by: MmmLll_Shen
 * description:
 * create time: 10:07 2019/9/20
 */
@Data
public class UserEditVo {

    /**
     * 主键ID
     */
    private int userId;

    /**
     * 显示姓名
     */
    private String chineseName;

    /**
     * 登陆用户名
     */
    private String username;

    /**
     * 登陆密码（加密）
     */
    private String password;
}
