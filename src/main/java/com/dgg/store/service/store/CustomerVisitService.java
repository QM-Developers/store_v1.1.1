package com.dgg.store.service.store;

import com.dgg.store.util.pojo.UserPlace;
import com.dgg.store.util.vo.core.PageVO;
import com.dgg.store.util.vo.core.SessionVO;
import com.dgg.store.util.vo.customer.CustomerVO;
import com.dgg.store.util.vo.manage.MemberVO;

public interface CustomerVisitService
{
    String listVisitDepartment(SessionVO sessionVO);

    String listVisitMember(SessionVO sessionVO, MemberVO memberVO);

    String listVisitCustomer(SessionVO sessionVO, CustomerVO customerVO, PageVO pageVO);

    String getVisitCustomer(SessionVO sessionVO, CustomerVO customerVO);

    String listVisitUserPlace(SessionVO sessionVO, UserPlace place, PageVO pageVO);

    String getVisitUserPlace(SessionVO sessionVO, UserPlace place);
}
