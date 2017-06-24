package com.dgg.store.dao.store;

import com.dgg.store.util.vo.goods.AreaFreightVO;
import com.dgg.store.util.vo.goods.TemplateOfFreightVO;

import java.util.List;

public interface FreightDao
{
    int insertFreightTemp(TemplateOfFreightVO freight);

    List<TemplateOfFreightVO> findFreightTempsByUserId(String userId);

    Integer deleteFreightTemp(String templateFreightId);

    TemplateOfFreightVO findFreight(String templateFreightId);

    int insertAreaId(String areaFreightId, String[] split);

    int insertAreaFreight(AreaFreightVO f);
}
