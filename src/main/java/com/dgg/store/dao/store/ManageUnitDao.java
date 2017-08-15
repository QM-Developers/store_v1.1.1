package com.dgg.store.dao.store;

import com.dgg.store.util.pojo.ManageUnit;
import com.dgg.store.util.pojo.ManageUnitExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ManageUnitDao
{
    long countByExample(ManageUnitExample example);

    int deleteByExample(ManageUnitExample example);

    int deleteByPrimaryKey(String breedId);

    int insert(ManageUnit record);

    int insertSelective(ManageUnit record);

    List<ManageUnit> selectByExample(ManageUnitExample example);

    ManageUnit selectByPrimaryKey(String breedId);

    int updateByExampleSelective(@Param("record") ManageUnit record, @Param("example") ManageUnitExample example);

    int updateByExample(@Param("record") ManageUnit record, @Param("example") ManageUnitExample example);

    int updateByPrimaryKeySelective(ManageUnit record);

    int updateByPrimaryKey(ManageUnit record);
}
