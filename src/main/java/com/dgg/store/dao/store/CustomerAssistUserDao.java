package com.dgg.store.dao.store;

import com.dgg.store.util.pojo.CustomerAssistUser;
import com.dgg.store.util.pojo.CustomerAssistUserExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface CustomerAssistUserDao
{
    long countByExample(CustomerAssistUserExample example);

    int deleteByExample(CustomerAssistUserExample example);

    int insert(CustomerAssistUser record);

    int insertSelective(CustomerAssistUser record);

    List<CustomerAssistUser> selectByExample(CustomerAssistUserExample example);

    int updateByExampleSelective(@Param("record") CustomerAssistUser record, @Param("example") CustomerAssistUserExample example);

    int updateByExample(@Param("record") CustomerAssistUser record, @Param("example") CustomerAssistUserExample example);
}
