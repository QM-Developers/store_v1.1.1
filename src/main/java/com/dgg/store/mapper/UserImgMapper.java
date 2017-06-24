package com.dgg.store.mapper;

import com.dgg.store.util.pojo.UserImg;
import com.dgg.store.util.pojo.UserImgExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface UserImgMapper {
    long countByExample(UserImgExample example);

    int deleteByExample(UserImgExample example);

    int deleteByPrimaryKey(String imgId);

    int insert(UserImg record);

    int insertSelective(UserImg record);

    List<UserImg> selectByExample(UserImgExample example);

    UserImg selectByPrimaryKey(String imgId);

    int updateByExampleSelective(@Param("record") UserImg record, @Param("example") UserImgExample example);

    int updateByExample(@Param("record") UserImg record, @Param("example") UserImgExample example);

    int updateByPrimaryKeySelective(UserImg record);

    int updateByPrimaryKey(UserImg record);
}