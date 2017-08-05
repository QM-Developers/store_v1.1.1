package com.dgg.store.mapper;

import com.dgg.store.util.pojo.PlaceImage;
import com.dgg.store.util.pojo.PlaceImageExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface PlaceImageMapper {
    long countByExample(PlaceImageExample example);

    int deleteByExample(PlaceImageExample example);

    int deleteByPrimaryKey(String imgId);

    int insert(PlaceImage record);

    int insertSelective(PlaceImage record);

    List<PlaceImage> selectByExampleWithBLOBs(PlaceImageExample example);

    List<PlaceImage> selectByExample(PlaceImageExample example);

    PlaceImage selectByPrimaryKey(String imgId);

    int updateByExampleSelective(@Param("record") PlaceImage record, @Param("example") PlaceImageExample example);

    int updateByExampleWithBLOBs(@Param("record") PlaceImage record, @Param("example") PlaceImageExample example);

    int updateByExample(@Param("record") PlaceImage record, @Param("example") PlaceImageExample example);

    int updateByPrimaryKeySelective(PlaceImage record);

    int updateByPrimaryKeyWithBLOBs(PlaceImage record);

    int updateByPrimaryKey(PlaceImage record);
}