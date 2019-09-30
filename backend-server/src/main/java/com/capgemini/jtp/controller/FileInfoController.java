package com.capgemini.jtp.controller;



import com.capgemini.jtp.entity.AccessoryInfo;
import com.capgemini.jtp.mapper.FileInfoMapper;
import com.capgemini.jtp.service.FileInfoService;
import com.capgemini.jtp.utils.FileUtils;
import com.capgemini.jtp.vo.base.RespBean;
import com.capgemini.jtp.vo.request.*;
import com.capgemini.jtp.vo.response.FileDetailResp;
import com.capgemini.jtp.vo.response.FileSearchResp;
import com.capgemini.jtp.vo.response.ListFileInfoResp;
import com.capgemini.jtp.vo.response.ListRecycleBinResp;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;


/**
 * create by: MmmLll_Shen
 * description:文件管理模块
 * create time: 13:18 2019/9/22
 */
@Api("文件管理模块")
@RestController
@RequestMapping("/file/filemanagement")
public class FileInfoController {
    @Autowired
    FileInfoService fileInfoService;

    @Autowired
    FileInfoMapper fileInfoMapper;
    /**
     *查询当前目录下的所有文件
     * @param listFileInfoReq
     * @return
     */
    @RequestMapping(value="/listFile",method = RequestMethod.POST)
    @ApiOperation(value="列出当前目录下的所有文件")
    @ApiImplicitParam(paramType = "" , name = "listFile" , value = "列出文件类",dataType = "ListFileInfoVo")
    public RespBean listFile(@RequestBody ListFileInfoReq listFileInfoReq) {
        List<ListFileInfoResp> fileInfoResps = fileInfoService.listCurrentDirDocument(listFileInfoReq);
        if (fileInfoResps != null) {
            return RespBean.ok("查询成功",fileInfoResps);
        }else {
            return RespBean.error("查询失败");
        }
    }


    /**
     * 查询该文件的所有附件
     * @param listAccessoryReq
     * @return
     */
    @RequestMapping(value = "/listAccessory",method = RequestMethod.POST)
    @ApiOperation(value = "列出该文件的所有附件")
    @ApiImplicitParam(paramType = "",name = "listAccessory",value = "列出附件类",dataType = "ListAccessoryInfoVo")
    public RespBean listAccessory(@RequestBody ListAccessoryReq listAccessoryReq) {
        List<AccessoryInfo> accessoryInfos = fileInfoService.listAccessoryInfo(listAccessoryReq);
        return RespBean.ok(accessoryInfos);

    }


    /**
     * 编辑文件属性
     * @param editFileInfoReq
     * @return
     */
    @RequestMapping(value = "/editFile",method = RequestMethod.POST)
    @ApiOperation(value = "编辑当前文件属性")
    @ApiImplicitParam(paramType = "", name = "editFile", value = "编辑文件类",dataType = "EditFileInfoVo")
    public RespBean editFile(@RequestBody EditFileInfoReq editFileInfoReq) {

        if (fileInfoService.editCurrentDocment(editFileInfoReq) != 0) {
            return RespBean.ok("保存成功");
        }else {
            return RespBean.error("保存失败");
        }
    }
    
    
    
    /**
     * create by: MmmLll_Shen
     * description:新建文件夹或者文件
     * create time: 10:29 2019/9/23
     */
    @RequestMapping(value = "/addFile",method = RequestMethod.POST)
    @ApiOperation(value = "新建文件夹或者文件")
    public RespBean addFile(@RequestBody AddFileReq addFileReq) {
        System.out.println("----------------------------" + addFileReq.getFilePath());
//        if(fileInfoMapper.getFileTypeByFileId(addFileReq.getParentId()) != 1){
//            return RespBean.error("不能在此处新建文件夹或者文件");
//        }else {
            if (fileInfoService.addFileToDb(addFileReq) != 0) {
                //在此新建文件到磁盘
                if(fileInfoService.addFileToDesk(addFileReq)){
                    return RespBean.okMessage("新建成功");
                }
                else {
                    return RespBean.okMessage("在磁盘中新建失败");
                }
            }else {
                return RespBean.error("新建失败");
            }
//        }
    }


    /**
     * create by: MmmLll_Shen
     * description:新建附件
     * create time: 10:29 2019/9/23
     */
    @RequestMapping(value = "/addAccessoryToDb",method = RequestMethod.POST)
    @ApiOperation(value = "新建附件")
    public RespBean addAccessoryToDb(@RequestBody AddAccessoryReq addAccessoryReq) {
//        System.out.println("----------------------------" + addFileReq.getFilePath());
//        if(fileInfoMapper.getFileTypeByFileId(addAccessoryReq.getFileId()) != 3){
//            return RespBean.error("不能在此处新建附件");
//        }else {
            if (fileInfoService.addAccessoryToDb(addAccessoryReq) != 0) {
                //在此新建文件到磁盘
                    return RespBean.okMessage("新建成功");

            }else {
                return RespBean.error("新建失败");
            }
//        }
    }


    /**
     * create by: MmmLll_Shen
     * description:上传文件到磁盘
     * create time: 11:31 2019/9/29
     */
    @RequestMapping(value = "/addAccessoryToDesk",method = RequestMethod.POST)
    @ApiOperation(value = "新建附件到磁盘")
    public RespBean addAccessoryToDesk( @RequestParam("file") MultipartFile file) {
        if (file.isEmpty()) {
            return RespBean.error("请选择文件");
        }
        if (fileInfoService.uploadFileToDisk(file) != 0) {
            return RespBean.okMessage("上传成功");
        }else {
            return RespBean.error("上传失败");
        }
    }







    /**
     * 将文件放入回收站
     * @param moveFileToRecycleBinReq
     * @return
     */
    @RequestMapping(value = "/MoveFileToRecycleBin",method = RequestMethod.POST)
    @ApiOperation(value = "将文件放入回收站")
    @ApiImplicitParam(paramType = "", name = "MoveFileToRecycleBin",value = "将文件放入回收站",
            dataType = "MoveFileToRecycleBinReq")
    public RespBean MoveFileToRecycleBin(@RequestBody MoveFileToRecycleBinReq moveFileToRecycleBinReq) {
        if (fileInfoService.MoveFileToRecycleBin(moveFileToRecycleBinReq) != 0) {
            return RespBean.okMessage("操作成功");
        }else {
            return RespBean.error("操作失败");
        }
    }



    /**
     * 删除文件
     * @param deleteFileReq
     * @return
     */
    @RequestMapping(value = "/deleteFile",method = RequestMethod.POST)
    @ApiOperation(value = "删除文件")
    @ApiImplicitParam(paramType = "", name = "deleteFile",value = "删除文件",dataType = "DeleteFileReq")
    public RespBean deleteFile(@RequestBody DeleteFileReq deleteFileReq) {
        if (fileInfoService.deleteFile(deleteFileReq) != 0 &&
                fileInfoService.deleteFileFromDisk(deleteFileReq.getFilePathAndName()) != 0) {
            return RespBean.okMessage("删除成功");
        }else {
            return RespBean.error("删除失败");
        }
    }

///////////////////////////////////////////////////////////////
//    /**
//     * 退出并删除文件
//     * @param fileName
//     * @return
//     */
//    @RequestMapping(value = "/exitAndDeleteFile/{fileName}",method = RequestMethod.POST)
//    @ApiOperation(value = "退出并删除文件")
//    @ApiImplicitParam(paramType = "", name = "exitAndDeleteFile",value = "退出并删除文件")
//    public RespBean exitAndDeleteFile(@PathVariable(value = "fileName") String fileName) {
//        if (fileName != null) {
//            if (fileInfoService.deleteFileFromDisk(FileUtils.ACCESSORY_PATH + fileName) != 0) {
//                return RespBean.okMessage("退出成功，已删除文件");
//            }else {
//                return RespBean.error("删除失败");
//            }
//        }else {
//            return RespBean.okMessage("退出成功");
//        }
//    }

    /**
     * 查询回收站
     * @return
     */
    @RequestMapping(value = "/listRecycleBin",method = RequestMethod.POST)
    @ApiOperation(value = "查询回收站内容")
    @ApiImplicitParam(paramType = "",name = "listRecycleBin",value = "查询回收站内容",dataType = "listRecycleBinResp")
    public RespBean listRecycleBin() {
        List<ListRecycleBinResp> listRecycleBinResps = fileInfoService.listRecycleBin();

        return RespBean.ok("查询成功",listRecycleBinResps);
    }


    /**
     * 还原回收站文件
     * @param fileReductionReq
     * @return
     */
    @RequestMapping(value = "/fileReduction",method = RequestMethod.POST)
    @ApiOperation(value = "还原文件")
    @ApiImplicitParam(paramType = "",name = "fileReduction",value = "还原文件",dataType = "fileReductionVo")
    public RespBean fileReduction(@RequestBody FileReductionReq fileReductionReq) {
        if (fileInfoService.fileReduction(fileReductionReq) != 0) {
            return RespBean.okMessage("操作成功");
        }else {
            return RespBean.error("操作失败");
        }
    }

    /**
     * 文件搜索
     * @param fileSearchReq
     * @return
     */
    @RequestMapping(value = "/fileSearch",method = RequestMethod.POST)
    @ApiOperation(value = "文件搜索")
    @ApiImplicitParam(paramType = "",name = "fileSearch",value = "文件搜索",dataType = "fileSearchResp")
    public RespBean fileSearch(@RequestBody FileSearchReq fileSearchReq) {
        List<FileSearchResp> fileSearchResps = fileInfoService.fileSearch(fileSearchReq);

        return RespBean.ok("查询成功",fileSearchResps);
    }


    /**
     * 查询文件详情
     * @param fileDetailReq
     * @return
     */
//    @RequestMapping(value = "/fileDetail",method = RequestMethod.POST)
//    @ApiOperation(value = "文件详情")
//    @ApiImplicitParam(paramType = "",name = "fileDetail",value = "文件详情",dataType = "fileDetailResp")
//    public RespBean getFileDetail(@RequestBody FileDetailReq fileDetailReq) {
//        FileDetailResp fileDetailResp = fileInfoService.getFileDetail(fileDetailReq);
//
//        return RespBean.ok("查询成功",fileDetailResp);
//    }


}
