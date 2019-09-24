package com.capgemini.jtp.vo.request;


import lombok.Getter;
import lombok.Setter;


/**
 * create by: MmmLll_Shen
 * description:
 * create time: 13:47 2019/9/22
 */
@Getter
@Setter
public class EditFileInfoReq {


    /**
     * 文件ID
     */
    private int fileId;
    /**
     * 文件名称
     */
    private String fileName;

    /**
     *备注
     */
    private  String remark;

    /**
     *文件类型图标
     */
    private String fileTypeImage;

    /**
     *上传文件所在路径
     */
    private String accessoryPath;
}
