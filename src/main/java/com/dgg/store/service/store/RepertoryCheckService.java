package com.dgg.store.service.store;

import com.dgg.store.util.vo.core.PageVO;
import com.dgg.store.util.vo.core.SessionVO;

public interface RepertoryCheckService
{
    String listRepertoryFirst(SessionVO sessionVO, PageVO pageVO);

    String getRepertory(SessionVO sessionVO, PageVO pageVO);
}
