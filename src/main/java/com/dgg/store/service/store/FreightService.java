package com.dgg.store.service.store;

import com.dgg.store.util.vo.core.ResultVO;
import com.dgg.store.util.vo.core.SessionVO;
import com.dgg.store.util.vo.goods.TemplateOfFreightVO;

public interface FreightService
{
    ResultVO insertFreightTemp(SessionVO sessionVO, TemplateOfFreightVO freight);

    ResultVO findFreightTemps(SessionVO sessionVO);

    ResultVO deleteFreightTemp(SessionVO sessionVO, TemplateOfFreightVO freight);

    ResultVO findFreight(SessionVO sessionVO, TemplateOfFreightVO freight);
}
