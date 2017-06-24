package com.dgg.store.service.common;

import com.dgg.store.util.vo.core.ResultVO;
import com.dgg.store.util.vo.core.SessionVO;

public interface AreaService
{

    ResultVO findAreaByPid(SessionVO sessionVO, String pid);

    ResultVO findAllArea(SessionVO sessionVO);
}
