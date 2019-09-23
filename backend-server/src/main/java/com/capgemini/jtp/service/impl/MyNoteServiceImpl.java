package com.capgemini.jtp.service.impl;

import com.capgemini.jtp.entity.MyNote;
import com.capgemini.jtp.mapper.MyNoteMapper;
import com.capgemini.jtp.service.MyNoteService;
import com.capgemini.jtp.vo.request.MyNoteAddVo;
import com.capgemini.jtp.vo.request.MyNoteVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service

public class MyNoteServiceImpl implements MyNoteService {
    @Autowired
    MyNoteMapper myNoteMapper;
    @Autowired
    MyNote myNote;

    /**
     * 返回所有的便签内容
     * @return
     */
    public List<MyNote> listNote(){
        List<MyNote> list =myNoteMapper.listNote();
//        if (list.isEmpty()||list.equals(null))
//            ;
//            else
        return list;
    }
    public List<MyNote> listNoteByUserId(int userId){
        return myNoteMapper.listNoteByUserId(userId);
    };

    /**
     * 添加一个便签
     * @param
     */
    public Integer addNote(MyNoteAddVo myNoteAddVo){
        myNote.setNoteTitle(myNoteAddVo.getNoteTitle());
        myNote.setNoteContent(myNoteAddVo.getNoteContent());
        myNote.setCreateTime(myNoteAddVo.getCreateTime());
        myNote.setCreateUser(myNoteAddVo.getCreateUser());
        return myNoteMapper.insertNote(myNote);
    };

    /**
     * 删除便签 根据noteId
     * @param noteId
     * @return
     */
    public Integer deleteNote(int noteId){
        return myNoteMapper.deleteNoteById(noteId);

    };
    public void findNote(){

    };

    /**
     * 更新便签 不更新作者和noteId
     * @param
     * @return
     */
    public Integer updateNote(MyNoteVo myNoteVo){
        myNote.setNoteId(myNoteVo.getNoteId());
        myNote.setNoteTitle(myNoteVo.getNoteTitle());
        myNote.setNoteContent(myNoteVo.getNoteContent());
        myNote.setCreateTime(myNoteVo.getCreateTime());
        myNote.setCreateUser(myNoteVo.getCreateUser());
        return myNoteMapper.updateNoteById(myNote);
    };
}
