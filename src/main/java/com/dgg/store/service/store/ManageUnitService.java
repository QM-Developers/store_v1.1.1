package com.dgg.store.service.store;

import com.dgg.store.util.pojo.ManageUnit;
import com.dgg.store.util.vo.core.SessionVO;

public interface ManageUnitService
{
    String insertManageUnit(SessionVO sessionVO, ManageUnit unit);

    String listManageUnit(SessionVO sessionVO, ManageUnit unit);

    String updateManageUnit(SessionVO sessionVO, ManageUnit unit);

    String deleteManageUnit(SessionVO sessionVO, ManageUnit unit);
}
