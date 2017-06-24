package com.dgg.store.mapper;

import com.dgg.store.util.pojo.UserDevices;
import com.dgg.store.util.pojo.UserDevicesExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface UserDevicesMapper {
    long countByExample(UserDevicesExample example);

    int deleteByExample(UserDevicesExample example);

    int deleteByPrimaryKey(String userDeviceId);

    int insert(UserDevices record);

    int insertSelective(UserDevices record);

    List<UserDevices> selectByExample(UserDevicesExample example);

    UserDevices selectByPrimaryKey(String userDeviceId);

    int updateByExampleSelective(@Param("record") UserDevices record, @Param("example") UserDevicesExample example);

    int updateByExample(@Param("record") UserDevices record, @Param("example") UserDevicesExample example);

    int updateByPrimaryKeySelective(UserDevices record);

    int updateByPrimaryKey(UserDevices record);
}