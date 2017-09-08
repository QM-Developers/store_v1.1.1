package com.dgg.store.mapper;

import com.dgg.store.util.pojo.UserPlace;
import com.dgg.store.util.vo.customer.CustomerVO;
import com.dgg.store.util.vo.manage.DepartmentVO;
import com.dgg.store.util.vo.manage.MemberVO;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface CustomerVisitMapper
{
    List<DepartmentVO> listVisitDepartment(@Param("userId") String userId);

    List<MemberVO> listVisitMember(@Param("departmentId") String departmentId);

    int countVisitCustomer(CustomerVO customerVO);

    List<CustomerVO> listVisitCustomer(CustomerVO customerVO);

    CustomerVO getVisitCustomer(CustomerVO customerVO);

    int countVisitUserPlace(UserPlace place);

    List<UserPlace> listVisitUserPlace(UserPlace place);

    UserPlace getUserPlaceById(@Param("placeId")String userPlaceId);
}
