package com.dgg.store.dao.store;

import com.dgg.store.util.pojo.CustomerFollow;
import com.dgg.store.util.pojo.CustomerFollowExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface CustomerFollowDao
{
    long countByExample(CustomerFollowExample example);

    int deleteByExample(CustomerFollowExample example);

    int deleteByPrimaryKey(String breedId);

    int insert(CustomerFollow record);

    int insertSelective(CustomerFollow record);

    List<CustomerFollow> selectByExample(CustomerFollowExample example);

    CustomerFollow selectByPrimaryKey(String breedId);

    int updateByExampleSelective(@Param("record") CustomerFollow record, @Param("example") CustomerFollowExample example);

    int updateByExample(@Param("record") CustomerFollow record, @Param("example") CustomerFollowExample example);

    int updateByPrimaryKeySelective(CustomerFollow record);

    int updateByPrimaryKey(CustomerFollow record);

    String getUserName(String userId);

}
