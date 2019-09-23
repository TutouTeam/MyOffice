package com.capgemini.jtp.mapper;


import com.capgemini.jtp.entity.MyNote;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface MyNoteMapper {
    List<MyNote> listNote();//返回所有内容
    List<MyNote> listNoteByUserId(@Param("userId") int userId);//返回指定用户的便签
    Integer insertNote(@Param("myNote") MyNote myNote);//新增便签 0失败 1成功
    Integer deleteNoteById(@Param("noteId") int noteId);//0失败 1成功

    Integer updateNoteById(@Param("myNote") MyNote myNote);//更新便签 0失败 1成功 不更新作者




}
