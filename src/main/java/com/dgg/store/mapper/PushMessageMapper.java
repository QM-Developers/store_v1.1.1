package com.dgg.store.mapper;

import com.dgg.store.util.pojo.PushMessage;
import com.dgg.store.util.pojo.PushMessageExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface PushMessageMapper {
    long countByExample(PushMessageExample example);

    int deleteByExample(PushMessageExample example);

    int deleteByPrimaryKey(String msgId);

    int insert(PushMessage record);

    int insertSelective(PushMessage record);

    List<PushMessage> selectByExample(PushMessageExample example);

    PushMessage selectByPrimaryKey(String msgId);

    int updateByExampleSelective(@Param("record") PushMessage record, @Param("example") PushMessageExample example);

    int updateByExample(@Param("record") PushMessage record, @Param("example") PushMessageExample example);

    int updateByPrimaryKeySelective(PushMessage record);

    int updateByPrimaryKey(PushMessage record);
}