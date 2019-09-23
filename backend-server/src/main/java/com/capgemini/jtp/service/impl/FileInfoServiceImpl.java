package com.capgemini.jtp.service.impl;

import com.capgemini.jtp.entity.AccessoryInfo;
import com.capgemini.jtp.entity.FileInfo;
import com.capgemini.jtp.entity.FileTypeInfo;
import com.capgemini.jtp.mapper.FileInfoMapper;
import com.capgemini.jtp.service.FileInfoService;
import com.capgemini.jtp.utils.ConvertUtils;
import com.capgemini.jtp.utils.FileUtils;
import com.capgemini.jtp.vo.request.*;
import com.capgemini.jtp.vo.response.FileDetailResp;
import com.capgemini.jtp.vo.response.FileSearchResp;
import com.capgemini.jtp.vo.response.ListFileInfoResp;
import com.capgemini.jtp.vo.response.ListRecycleBinResp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;



/**
 * create by: MmmLll_Shen
 * description:
 * create time: 13:45 2019/9/22
 */
@Service
public class FileInfoServiceImpl implements FileInfoService {

    @Autowired
    FileInfoMapper fileInfoMapper;

    /**
     * 列出当前目录下的所有文件
     * @param listFileInfoReq
     * @return
     */
    @Override
    public List<ListFileInfoResp> listCurrentDirDocument(ListFileInfoReq listFileInfoReq) {
        FileInfo fileInfoo = new FileInfo();
        fileInfoo = ConvertUtils.convertListFileInfoReqToFileInfo(listFileInfoReq);
        List<FileInfo> fileInfos = fileInfoMapper.listCurrentDirDocument(fileInfoo);
        List<ListFileInfoResp> listFileInfoResps = new ArrayList<>();

        if(fileInfos != null) {
            for (FileInfo fileInfo : fileInfos) {
                ListFileInfoResp listFileInfoResp = ConvertUtils.convertFileInfoToListFileInfoResp(fileInfo);
                listFileInfoResp.setFileTypeName(fileInfoMapper.getFileTypeName(fileInfo.getFileType()));
                listFileInfoResps.add(listFileInfoResp);
            }
        }
        return listFileInfoResps;
    }

    /**
     * 编辑当前文件属性
     * @param editFileInfoReq
     * @return
     */
    @Override
    public Integer editCurrentDocment(EditFileInfoReq editFileInfoReq) {
        FileInfo fileInfo = ConvertUtils.convertEditFileInfoReqToFileInfo(editFileInfoReq);
        FileTypeInfo fileTypeInfo = ConvertUtils.convertEditFileInfoReqToFileTypeInfo(editFileInfoReq);
        if (fileInfoMapper.updateFileInfoById(fileInfo,fileTypeInfo) != 0) {
            return 1;
        }
        else {
            return 0;
        }
    }

    /**
     * 列出该文件的所有附件信息
     * @param listAccessoryReq
     * @return
     */
    @Override
    public List<AccessoryInfo> listAccessoryInfo(ListAccessoryReq listAccessoryReq) {
        FileInfo fileInfo = ConvertUtils.convertListAccessoryReqToFileInfo(listAccessoryReq);
        return fileInfoMapper.listAccessoryInfo(fileInfo);

    }


    /**
     * 新建文件信息到数据库
     * @return
     */
    @Override
    public Integer addFileToDb(AddFileReq addFileReq) {
        FileInfo fileInfo = ConvertUtils.convertAddFileInfoToFileInfo(addFileReq);

        return fileInfoMapper.addFileInfo(fileInfo);

    }

    /**
     * 上传文件信息到数据库
     * @param uploadFileReq
     * @return
     */
    @Override
    public Integer uploadFileToDb(UploadFileReq uploadFileReq) {
        FileInfo fileInfo = ConvertUtils.convertUploadFileInfoToFileInfo(uploadFileReq);

        fileInfoMapper.addFileInfo(fileInfo);
        //获取插入的fileInfo 的 fileId
        int fileId = fileInfoMapper.getLastInsertId();
        uploadFileReq.setFileId(fileId);
        AccessoryInfo accessoryInfo = ConvertUtils.convertUploadFileInfoToAccessoryInfo(uploadFileReq);

        return fileInfoMapper.addAccessoryInfo(accessoryInfo);
    }


    /**
     * 上传附件到磁盘
     * @param file
     * @return
     */
    @Override
    public Integer uploadFileToDisk(MultipartFile file) {
        String fileName = file.getOriginalFilename();
        File dest = new File(FileUtils.ACCESSORY_PATH + fileName);
        try {
            file.transferTo(dest);
            return 1;

        } catch (IOException e) {
            System.out.println(e.toString());
            return 0;
        }
    }

    /**
     * 删除文件
     * @param deleteFileReq
     * @return
     */

    @Override
    public Integer deleteFile(DeleteFileReq deleteFileReq) {

        FileInfo fileInfo = ConvertUtils.convertDeletedFileInfoToFileInfo(deleteFileReq);
        return fileInfoMapper.deleteFile(fileInfo);
    }

    /**
     * 从磁盘删除文件
     * @param filePathAndName
     * @return
     */

    @Override
    public Integer deleteFileFromDisk(String filePathAndName) {
        try {
            String filePath = filePathAndName;
            filePath = filePath.toString();
            File myDelFile = new File(filePath);
            myDelFile.delete();
            return 1;
        } catch (Exception e) {

            e.printStackTrace();
            return 0;
        }
    }

    /**
     * 新建文件
     * @param addFileReq
     * @return
     */

    @Override
    public Integer createFile(CreateFileReq addFileReq) {
        FileInfo fileInfo = ConvertUtils.convertCreateFileInfoToFileInfo(addFileReq);
        File file = new File(fileInfo.getFilePath() + "\\" + fileInfo.getFileName());

        try {
            file.createNewFile();
            System.out.println(file.getPath());
        }catch (IOException e)  {
            return -1;
        }
        return fileInfoMapper.addFileInfo(fileInfo);

    }

    /**
     * 新建目录
     * @param createDirReq
     * @return
     */

    @Override
    public Integer createDir(CreateDirReq createDirReq) {
        FileInfo fileInfo = ConvertUtils.convertCreateDirInfoToFileInfo(createDirReq);
        File file = new File(createDirReq.getFilePath() + "\\" + createDirReq.getFileName());
        file.mkdirs();

        return fileInfoMapper.addFileInfo(fileInfo);
    }

    /**
     * 将文件放入回收站
     * @param moveFileToRecycleBinReq
     * @return
     */

    @Override
    public Integer MoveFileToRecycleBin(MoveFileToRecycleBinReq moveFileToRecycleBinReq) {
        FileInfo fileInfo = ConvertUtils.convertMoveFileToRecycleBinReqToFileInfo(moveFileToRecycleBinReq);

        return fileInfoMapper.MoveFileToRecycleBin(fileInfo);
    }


    /**
     * 查询回收站文件
     * @return
     */
    @Override
    public List<ListRecycleBinResp> listRecycleBin() {
        List<FileInfo> fileInfos = fileInfoMapper.listRecycleBin();
        List<ListRecycleBinResp> listFileInfoResps = new ArrayList<>();
        ListRecycleBinResp listRecycleBinResp = new ListRecycleBinResp();
        for (FileInfo fileInfo : fileInfos) {
            listRecycleBinResp = ConvertUtils.convertFileInfoToListRecycleBinResp(fileInfo);
            listRecycleBinResp.setFileTypeName(fileInfoMapper.getFileTypeName(fileInfo.getFileType()));
            listFileInfoResps.add(listRecycleBinResp);
        }

        return listFileInfoResps;

    }


    /**
     * 还原回收站中的文件
     * @param fileReductionReq
     * @return
     */
    @Override
    public Integer fileReduction(FileReductionReq fileReductionReq) {
        FileInfo fileInfo = ConvertUtils.convertFileReductionReqToFileInfo(fileReductionReq);

        return fileInfoMapper.fileReduction(fileInfo);
    }

    /**
     * 文件搜索
     * @param fileSearchReq
     * @return
     */

    @Override
    public List<FileSearchResp> fileSearch(FileSearchReq fileSearchReq) {
        List<FileInfo> fileInfos = fileInfoMapper.fileSearch(fileSearchReq);
        List<FileSearchResp> fileSearchResps = new ArrayList<>();
        for (FileInfo fileInfo : fileInfos) {
            fileSearchResps.add(ConvertUtils.convertFileInfoToFileSearchResp(fileInfo));
        }
        return fileSearchResps;
    }


    /**
     * 获取文件详情
     * @param fileDetailReq
     * @return
     */
    @Override
    public FileDetailResp getFileDetail(FileDetailReq fileDetailReq) {
        FileInfo fileInfo = ConvertUtils.convertFileDetailReqToFileInfo(fileDetailReq);

        FileDetailResp fileDetailResp =
                ConvertUtils.convertFileInfoToFileDetailResp(fileInfoMapper.getFileDetail(fileInfo));

        AccessoryInfo accessoryInfo = ConvertUtils.convertFileDetailReqToAccessoryInfo(fileDetailReq);

        fileDetailResp.setAccessorySize(fileInfoMapper.getAccessorySize(accessoryInfo));
        return fileDetailResp;
    }




}
