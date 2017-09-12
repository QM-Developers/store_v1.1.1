package com.dgg.store.dao.store;

import com.dgg.store.util.pojo.CustomerAssist;
import com.dgg.store.util.pojo.CustomerAssistExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface CustomerAssistDao
{
    long countByExample(CustomerAssistExample example);

    int deleteByExample(CustomerAssistExample example);

    int deleteByPrimaryKey(String breedId);

    int insert(CustomerAssist record);

    int insertSelective(CustomerAssist record);

    List<CustomerAssist> selectByExample(CustomerAssistExample example);

    CustomerAssist selectByPrimaryKey(String breedId);

    int updateByExampleSelective(@Param("record") CustomerAssist record, @Param("example") CustomerAssistExample example);

    int updateByExample(@Param("record") CustomerAssist record, @Param("example") CustomerAssistExample example);

    int updateByPrimaryKeySelective(CustomerAssist record);

    int updateByPrimaryKey(CustomerAssist record);

    String getUserName(String userId);

    List<CustomerAssist> listCustomerAssistByHelper(String userId, int pageNum, int pageSize);

    int countCustomerAssistByHelper(String userId);
}
