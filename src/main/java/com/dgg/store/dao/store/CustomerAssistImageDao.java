package com.dgg.store.dao.store;

import com.dgg.store.util.pojo.CustomerAssistImage;
import com.dgg.store.util.pojo.CustomerAssistImageExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface CustomerAssistImageDao
{
    long countByExample(CustomerAssistImageExample example);

    int deleteByExample(CustomerAssistImageExample example);

    int deleteByPrimaryKey(String breedId);

    int insert(CustomerAssistImage record);

    int insertSelective(CustomerAssistImage record);

    List<CustomerAssistImage> selectByExample(CustomerAssistImageExample example);

    CustomerAssistImage selectByPrimaryKey(String breedId);

    int updateByExampleSelective(@Param("record") CustomerAssistImage record, @Param("example") CustomerAssistImageExample example);

    int updateByExample(@Param("record") CustomerAssistImage record, @Param("example") CustomerAssistImageExample example);

    int updateByPrimaryKeySelective(CustomerAssistImage record);

    int updateByPrimaryKey(CustomerAssistImage record);
}
