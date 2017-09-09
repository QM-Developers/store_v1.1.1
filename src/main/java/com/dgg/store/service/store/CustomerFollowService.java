package com.dgg.store.service.store;

import com.dgg.store.util.pojo.CustomerFollow;
import com.dgg.store.util.vo.core.PageVO;
import com.dgg.store.util.vo.core.SessionVO;

public interface CustomerFollowService
{
    String insertCustomerFollow(SessionVO sessionVO, CustomerFollow follow);

    String listCustomerFollow(SessionVO sessionVO, CustomerFollow follow, PageVO pageVO);

    String getCustomerFollow(SessionVO sessionVO, CustomerFollow follow);

    String updateCustomerFollow(SessionVO sessionVO, CustomerFollow follow);
}
