package com.dgg.store.mapper;

import com.dgg.store.util.pojo.CommonApplyImage;
import com.dgg.store.util.pojo.CommonApplyImageExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface CommonApplyImageMapper {
    long countByExample(CommonApplyImageExample example);

    int deleteByExample(CommonApplyImageExample example);

    int deleteByPrimaryKey(String applyId);

    int insert(CommonApplyImage record);

    int insertSelective(CommonApplyImage record);

    List<CommonApplyImage> selectByExample(CommonApplyImageExample example);

    CommonApplyImage selectByPrimaryKey(String applyId);

    int updateByExampleSelective(@Param("record") CommonApplyImage record, @Param("example") CommonApplyImageExample example);

    int updateByExample(@Param("record") CommonApplyImage record, @Param("example") CommonApplyImageExample example);

    int updateByPrimaryKeySelective(CommonApplyImage record);

    int updateByPrimaryKey(CommonApplyImage record);
}