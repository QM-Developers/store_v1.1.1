package com.dgg.store.mapper;

import com.dgg.store.util.pojo.CustomerAssist;
import com.dgg.store.util.pojo.CustomerAssistExample;

import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface CustomerAssistMapper
{
    long countByExample(CustomerAssistExample example);

    int deleteByExample(CustomerAssistExample example);

    int deleteByPrimaryKey(String assistId);

    int insert(CustomerAssist record);

    int insertSelective(CustomerAssist record);

    List<CustomerAssist> selectByExample(CustomerAssistExample example);

    CustomerAssist selectByPrimaryKey(String assistId);

    int updateByExampleSelective(@Param("record") CustomerAssist record, @Param("example") CustomerAssistExample example);

    int updateByExample(@Param("record") CustomerAssist record, @Param("example") CustomerAssistExample example);

    int updateByPrimaryKeySelective(CustomerAssist record);

    int updateByPrimaryKey(CustomerAssist record);

    String getUserName(@Param("userId") String userId);

    int countCustomerAssistByHelper(String userId);

    List<CustomerAssist> listCustomerAssistByHelper(@Param("userId") String userId, @Param("pageNum") int pageNum, @Param("pageSize") int pageSize);
}