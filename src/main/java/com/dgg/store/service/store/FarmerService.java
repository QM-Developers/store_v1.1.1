package com.dgg.store.service.store;

import com.dgg.store.util.pojo.Farmer;
import com.dgg.store.util.vo.core.SessionVO;

public interface FarmerService
{
    String insertFarmer(SessionVO sessionVO, Farmer farmer);

    String listFarmer(SessionVO sessionVO, Farmer farmer);

    String updateFarmer(SessionVO sessionVO, Farmer farmer);

    String deleteFarmer(SessionVO sessionVO, Farmer farmer);
}
