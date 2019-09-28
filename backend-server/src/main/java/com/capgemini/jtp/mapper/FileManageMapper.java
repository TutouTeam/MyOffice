package com.capgemini.jtp.mapper;


import com.capgemini.jtp.entity.MyNote;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface FileManageMapper {
      List<String > getChildren(@Param("parent")String   parent);
      String  getParent(@Param("children")String   children);
      List<String  > getRootName();

}
