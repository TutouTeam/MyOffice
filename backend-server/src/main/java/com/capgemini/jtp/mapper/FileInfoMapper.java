package com.capgemini.jtp.mapper;


import com.capgemini.jtp.entity.AccessoryInfo;
import com.capgemini.jtp.entity.FileInfo;
import com.capgemini.jtp.entity.FileTypeInfo;
import com.capgemini.jtp.entity.Menu;
import com.capgemini.jtp.vo.request.FileSearchReq;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import java.util.List;


/**
 * create by: MmmLll_Shen
 * description:
 * create time: 13:37 2019/9/22
 */
@Repository
//@Component(value = "FileInfoMapper")
public interface FileInfoMapper {
    /**
     * 菜单中所有信息
     * @return
     */
     List<FileInfo> getAllMenus();

    /**
     * 所有父级菜单
     * @return
     */
    List<FileInfo> getTree();



    List<FileInfo> listCurrentDirDocument(@Param(value = "fileInfo") FileInfo fileInfo);

    String getFileTypeName(@Param(value = "fileType") int fileType);

    Integer updateFileInfoById(@Param(value = "fileInfo") FileInfo fileInfo,
                               @Param(value = "fileTypeInfo") FileTypeInfo fileTypeInfo);

    List<AccessoryInfo> listAccessoryInfo(@Param(value = "fileInfo") FileInfo fileInfo);

    Integer addFileInfo(@Param(value = "fileInfo") FileInfo fileInfo);

    Integer addAccessoryInfo(@Param(value = "accessoryInfo") AccessoryInfo accessoryInfo);

    int getLastInsertId();

    Integer deleteFile(@Param(value = "fileInfo") FileInfo fileInfo);

    Integer MoveFileToRecycleBin(@Param(value = "fileInfo") FileInfo fileInfo);

    List<FileInfo> listRecycleBin();

    Integer fileReduction(@Param(value = "fileInfo") FileInfo fileInfo);

    List<FileInfo> fileSearch(@Param(value = "fileSearch") FileSearchReq fileSearchReq);

    FileInfo getFileDetail(@Param(value = "fileInfo") FileInfo fileInfo);

    String getAccessorySize(@Param(value = "accessoryInfo") AccessoryInfo accessoryInfo);
//    List<FileInfo> menuTree();

    /**
     * create by: MmmLll_Shen
     * description:通过fileId获取fileType
     * create time: 11:16 2019/9/23
     */
    Integer getFileTypeByFileId(@Param(value = "fileId") int fileId);


}
