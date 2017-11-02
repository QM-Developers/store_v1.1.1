package com.dgg.store.service.store;

import com.dgg.store.util.pojo.*;
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

    String listVisitUserBreed(SessionVO sessionVO, UserPlace place, PageVO pageVO);

    String listVisitFarmer(SessionVO sessionVO, Farmer farmer, PageVO pageVO);

    String listVisitManageUnit(SessionVO sessionVO, ManageUnit unit, PageVO pageVO);

    String listVisitCustomerFollow(SessionVO sessionVO, CustomerFollow follow, PageVO pageVO);

    String getVisitCustomerFollow(SessionVO sessionVO, CustomerFollow follow);

    String getVisitUserBreed(SessionVO sessionVO, UserBreed breed);

    String listVisitCurrentMember(SessionVO sessionVO, PageVO pageVO);

    String listVisitCurrentCustomer(SessionVO sessionVO, PageVO pageVO);

    String listVisitCustomerByKeyword(SessionVO sessionVO, PageVO pageVO, String keyword);
}
