package com.dgg.store.mapper;

import com.dgg.store.util.pojo.UserTimeRecord;
import com.dgg.store.util.pojo.UserTimeRecordExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface UserTimeRecordMapper {
    long countByExample(UserTimeRecordExample example);

    int deleteByExample(UserTimeRecordExample example);

    int insert(UserTimeRecord record);

    int insertSelective(UserTimeRecord record);

    List<UserTimeRecord> selectByExample(UserTimeRecordExample example);

    int updateByExampleSelective(@Param("record") UserTimeRecord record, @Param("example") UserTimeRecordExample example);

    int updateByExample(@Param("record") UserTimeRecord record, @Param("example") UserTimeRecordExample example);
}