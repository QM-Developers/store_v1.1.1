package com.dgg.store.mapper;

import com.dgg.store.util.pojo.Farmer;
import com.dgg.store.util.pojo.FarmerExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface FarmerMapper {
    long countByExample(FarmerExample example);

    int deleteByExample(FarmerExample example);

    int deleteByPrimaryKey(String farmerId);

    int insert(Farmer record);

    int insertSelective(Farmer record);

    List<Farmer> selectByExample(FarmerExample example);

    Farmer selectByPrimaryKey(String farmerId);

    int updateByExampleSelective(@Param("record") Farmer record, @Param("example") FarmerExample example);

    int updateByExample(@Param("record") Farmer record, @Param("example") FarmerExample example);

    int updateByPrimaryKeySelective(Farmer record);

    int updateByPrimaryKey(Farmer record);

    Integer deleteBreed(Farmer farmer);

    Integer deletePlace(Farmer farmer);
}