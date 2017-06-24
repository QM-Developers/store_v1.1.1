package com.dgg.store.mapper;

import com.dgg.store.util.vo.goods.AreaFreightVO;
import com.dgg.store.util.vo.goods.TemplateOfFreightVO;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface FreightMapper
{
    int insert(TemplateOfFreightVO record);

    List<TemplateOfFreightVO> findFreightTempsByUserId(@Param("userId") String userId);

    Integer deleteFreightTemp(@Param("freightId") String templateFreightId);

    TemplateOfFreightVO findFreight(@Param("freightId") String templateFreightId);

    int insertAreaId(@Param("fId") String areaFreightId, @Param("areaIds") String[] split);

    int insertAreaFreight(AreaFreightVO f);
}