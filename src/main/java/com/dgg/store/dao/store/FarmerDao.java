package com.dgg.store.dao.store;

import com.dgg.store.util.pojo.Farmer;
import com.dgg.store.util.pojo.FarmerExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface FarmerDao
{
    long countByExample(FarmerExample example);

    int deleteByExample(FarmerExample example);

    int deleteByPrimaryKey(String breedId);

    int insert(Farmer record);

    int insertSelective(Farmer record);

    List<Farmer> selectByExample(FarmerExample example);

    Farmer selectByPrimaryKey(String breedId);

    int updateByExampleSelective(@Param("record") Farmer record, @Param("example") FarmerExample example);

    int updateByExample(@Param("record") Farmer record, @Param("example") FarmerExample example);

    int updateByPrimaryKeySelective(Farmer record);

    int updateByPrimaryKey(Farmer record);

    Integer deleteBreed(Farmer farmer);

    Integer deletePlace(Farmer farmer);
}
