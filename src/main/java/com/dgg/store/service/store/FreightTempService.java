package com.dgg.store.service.store;

import com.dgg.store.util.pojo.FreightTemp;
import com.dgg.store.util.vo.core.PageVO;
import com.dgg.store.util.vo.core.SessionVO;

public interface FreightTempService
{
    String insertFreightTemp(SessionVO sessionVO, FreightTemp freightTemp);

    String deleteFreightTemp(SessionVO sessionVO, FreightTemp freightTemp);

    String updateFreightTemp(SessionVO sessionVO, FreightTemp freightTemp);

    String listFreightTemp(SessionVO sessionVO, FreightTemp freightTemp, PageVO pageVO);
}
