package com.dgg.store.mapper;

import com.dgg.store.util.pojo.UserPlaceHardware;
import com.dgg.store.util.pojo.UserPlaceHardwareExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface UserPlaceHardwareMapper {
    long countByExample(UserPlaceHardwareExample example);

    int deleteByExample(UserPlaceHardwareExample example);

    int deleteByPrimaryKey(String userHardwareId);

    int insert(UserPlaceHardware record);

    int insertSelective(UserPlaceHardware record);

    List<UserPlaceHardware> selectByExample(UserPlaceHardwareExample example);

    UserPlaceHardware selectByPrimaryKey(String userHardwareId);

    int updateByExampleSelective(@Param("record") UserPlaceHardware record, @Param("example") UserPlaceHardwareExample example);

    int updateByExample(@Param("record") UserPlaceHardware record, @Param("example") UserPlaceHardwareExample example);

    int updateByPrimaryKeySelective(UserPlaceHardware record);

    int updateByPrimaryKey(UserPlaceHardware record);
}