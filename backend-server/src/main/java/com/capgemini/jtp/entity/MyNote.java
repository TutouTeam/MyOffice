package com.capgemini.jtp.entity;

import lombok.Data;
import org.springframework.stereotype.Component;

import java.util.Date;

@Data
@Component
public class MyNote {
    /**
     * 便签Id
     */
    private int noteId;
    /**
     * 便签标题
     */
    private String noteTitle;
    /**
     * 便签内容
     */
    private String noteContent;
    /**
     * 创建时间
     */
    private Date createTime;
    /**
     * 创建者
     */
    private String createUser;
}
