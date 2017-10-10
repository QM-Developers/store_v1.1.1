package com.dgg.store.mapper;

import com.dgg.store.util.pojo.CustomerFollow;
import com.dgg.store.util.pojo.CustomerFollowExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface CustomerFollowMapper {
    long countByExample(CustomerFollowExample example);

    int deleteByExample(CustomerFollowExample example);

    int deleteByPrimaryKey(String followId);

    int insert(CustomerFollow record);

    int insertSelective(CustomerFollow record);

    List<CustomerFollow> selectByExample(CustomerFollowExample example);

    CustomerFollow selectByPrimaryKey(String followId);

    int updateByExampleSelective(@Param("record") CustomerFollow record, @Param("example") CustomerFollowExample example);

    int updateByExample(@Param("record") CustomerFollow record, @Param("example") CustomerFollowExample example);

    int updateByPrimaryKeySelective(CustomerFollow record);

    int updateByPrimaryKey(CustomerFollow record);

    String getUserName(String userId);
}