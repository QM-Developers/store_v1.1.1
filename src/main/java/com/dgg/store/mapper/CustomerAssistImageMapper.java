package com.dgg.store.mapper;

import com.dgg.store.util.pojo.CustomerAssistImage;
import com.dgg.store.util.pojo.CustomerAssistImageExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface CustomerAssistImageMapper {
    long countByExample(CustomerAssistImageExample example);

    int deleteByExample(CustomerAssistImageExample example);

    int deleteByPrimaryKey(String imageId);

    int insert(CustomerAssistImage record);

    int insertSelective(CustomerAssistImage record);

    List<CustomerAssistImage> selectByExample(CustomerAssistImageExample example);

    CustomerAssistImage selectByPrimaryKey(String imageId);

    int updateByExampleSelective(@Param("record") CustomerAssistImage record, @Param("example") CustomerAssistImageExample example);

    int updateByExample(@Param("record") CustomerAssistImage record, @Param("example") CustomerAssistImageExample example);

    int updateByPrimaryKeySelective(CustomerAssistImage record);

    int updateByPrimaryKey(CustomerAssistImage record);
}