package com.capgemini.jtp.service;



import com.capgemini.jtp.entity.MyNote;
import com.capgemini.jtp.vo.request.MyNoteAddVo;
import com.capgemini.jtp.vo.request.MyNoteVo;

import java.util.List;
import java.util.Map;

public interface FileManageService {
    Map<String , Map<String ,List<String >>> threeMenu();
    Map<String , Object> nMenu(int n);
}
