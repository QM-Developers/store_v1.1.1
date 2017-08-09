package com.dgg.store.mapper;

import com.dgg.store.util.pojo.ManageUnit;
import com.dgg.store.util.pojo.ManageUnitExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface ManageUnitMapper {
    long countByExample(ManageUnitExample example);

    int deleteByExample(ManageUnitExample example);

    int deleteByPrimaryKey(String manageId);

    int insert(ManageUnit record);

    int insertSelective(ManageUnit record);

    List<ManageUnit> selectByExampleWithBLOBs(ManageUnitExample example);

    List<ManageUnit> selectByExample(ManageUnitExample example);

    ManageUnit selectByPrimaryKey(String manageId);

    int updateByExampleSelective(@Param("record") ManageUnit record, @Param("example") ManageUnitExample example);

    int updateByExampleWithBLOBs(@Param("record") ManageUnit record, @Param("example") ManageUnitExample example);

    int updateByExample(@Param("record") ManageUnit record, @Param("example") ManageUnitExample example);

    int updateByPrimaryKeySelective(ManageUnit record);

    int updateByPrimaryKeyWithBLOBs(ManageUnit record);

    int updateByPrimaryKey(ManageUnit record);
}