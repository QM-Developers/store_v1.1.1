package com.dgg.store.dao.store;

import com.dgg.store.util.pojo.UserPlace;
import com.dgg.store.util.vo.customer.CustomerVO;
import com.dgg.store.util.vo.manage.DepartmentVO;
import com.dgg.store.util.vo.manage.MemberVO;

import java.util.List;

public interface CustomerVisitDao
{
    List<DepartmentVO> listVisitDepartment(String userId);

    List<MemberVO> listVisitMember(String departmentId);

    int countVisitCustomer(CustomerVO customerVO);

    List<CustomerVO> listVisitCustomer(CustomerVO customerVO);

    CustomerVO getVisitCustomer(CustomerVO customerVO);

    int countVisitUserPlace(UserPlace place);

    List<UserPlace> listVisitUserPlace(UserPlace place);

    UserPlace getUserPlaceById(String userPlaceId);
}
