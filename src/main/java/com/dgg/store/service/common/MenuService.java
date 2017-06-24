package com.dgg.store.service.common;

import com.dgg.store.util.vo.core.ResultVO;
import com.dgg.store.util.vo.core.SessionVO;

public interface MenuService
{
    ResultVO findMenus(SessionVO sessionVO);
}
