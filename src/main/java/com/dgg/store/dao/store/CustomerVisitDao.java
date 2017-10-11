package com.dgg.store.dao.store;

import com.dgg.store.util.pojo.Farmer;
import com.dgg.store.util.pojo.ManageUnit;
import com.dgg.store.util.pojo.UserBreed;
import com.dgg.store.util.pojo.UserPlace;
import com.dgg.store.util.vo.customer.CustomerVO;
import com.dgg.store.util.vo.manage.DepartmentVO;
import com.dgg.store.util.vo.manage.MemberVO;

import java.util.List;

public interface CustomerVisitDao
{
    List<DepartmentVO> listVisitDepartment(String myTeamId);

    List<MemberVO> listVisitMember(MemberVO memberVO);

    int countVisitCustomer(CustomerVO customerVO);

    List<CustomerVO> listVisitCustomer(CustomerVO customerVO, List<String> promoterList);

    CustomerVO getVisitCustomer(CustomerVO customerVO);

    int countVisitUserPlace(UserPlace place);

    List<UserPlace> listVisitUserPlace(UserPlace place);

    UserPlace getUserPlaceById(String userPlaceId);

    int countVisitUserBreed(UserPlace place);

    List<UserBreed> listVisitUserBreed(UserPlace place);

    int countVisitFarmer(Farmer farmer);

    List<Farmer> listVisitFarmer(Farmer farmer);

    int countVisitManageUnit(ManageUnit unit);

    List<Farmer> listVisitManageUnit(ManageUnit unit);

    UserBreed getVisitUserBreed(String breedId);
}
