package com.dgg.store.service.store;

import com.dgg.store.util.pojo.RepertoryIncome;
import com.dgg.store.util.vo.core.PageVO;
import com.dgg.store.util.vo.core.SessionVO;

public interface RepertoryIncomeService
{
    String saveRepertoryIncome(SessionVO sessionVO, RepertoryIncome income);

    String listRepertoryIncome(SessionVO sessionVO, RepertoryIncome income, PageVO pageVO);

    String getRepertoryIncome(SessionVO sessionVO, RepertoryIncome income);

    String listCurrentRepertoryIncome(SessionVO sessionVO, RepertoryIncome income, PageVO pageVO);
}
