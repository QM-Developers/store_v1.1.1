package com.dgg.store.dao.sys;

import com.dgg.store.util.pojo.PushMessage;
import com.dgg.store.util.pojo.PushMessageExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface PushMessageDao
{
    long countByExample(PushMessageExample example);

    int deleteByExample(PushMessageExample example);

    int deleteByPrimaryKey(String breedId);

    int insert(PushMessage record);

    int insertSelective(PushMessage record);

    List<PushMessage> selectByExample(PushMessageExample example);

    PushMessage selectByPrimaryKey(String breedId);

    int updateByExampleSelective(@Param("record") PushMessage record, @Param("example") PushMessageExample example);

    int updateByExample(@Param("record") PushMessage record, @Param("example") PushMessageExample example);

    int updateByPrimaryKeySelective(PushMessage record);

    int updateByPrimaryKey(PushMessage record);
}
