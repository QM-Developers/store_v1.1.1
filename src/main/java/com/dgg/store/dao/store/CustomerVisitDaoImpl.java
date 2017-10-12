package com.dgg.store.dao.store;

import com.dgg.store.mapper.CustomerVisitMapper;
import com.dgg.store.util.pojo.Farmer;
import com.dgg.store.util.pojo.ManageUnit;
import com.dgg.store.util.pojo.UserBreed;
import com.dgg.store.util.pojo.UserPlace;
import com.dgg.store.util.vo.customer.CustomerVO;
import com.dgg.store.util.vo.manage.DepartmentVO;
import com.dgg.store.util.vo.manage.MemberVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class CustomerVisitDaoImpl implements CustomerVisitDao
{
    @Autowired
    private CustomerVisitMapper mapper;

    @Override
    public List<DepartmentVO> listVisitDepartment(String myTeamId)
    {
        return mapper.listVisitDepartment(myTeamId);
    }

    @Override
    public List<MemberVO> listVisitMember(MemberVO memberVO)
    {
        return mapper.listVisitMember(memberVO);
    }

    @Override
    public int countVisitCustomer(CustomerVO customerVO, List<String> promoterList)
    {
        return mapper.countVisitCustomer(customerVO,promoterList);
    }

    @Override
    public List<CustomerVO> listVisitCustomer(CustomerVO customerVO, List<String> promoterList)
    {
        return mapper.listVisitCustomer(customerVO, promoterList);
    }

    @Override
    public CustomerVO getVisitCustomer(CustomerVO customerVO)
    {
        return mapper.getVisitCustomer(customerVO);
    }

    @Override
    public int countVisitUserPlace(UserPlace place)
    {
        return mapper.countVisitUserPlace(place);
    }

    @Override
    public List<UserPlace> listVisitUserPlace(UserPlace place)
    {
        return mapper.listVisitUserPlace(place);
    }

    @Override
    public UserPlace getUserPlaceById(String userPlaceId)
    {
        return mapper.getUserPlaceById(userPlaceId);
    }

    @Override
    public int countVisitUserBreed(UserPlace place)
    {
        return mapper.countVisitUserBreed(place);
    }

    @Override
    public List<UserBreed> listVisitUserBreed(UserPlace place)
    {
        return mapper.listVisitUserBreed(place);
    }

    @Override
    public int countVisitFarmer(Farmer farmer)
    {
        return mapper.countVisitFarmer(farmer);
    }

    @Override
    public List<Farmer> listVisitFarmer(Farmer farmer)
    {
        return mapper.listVisitFarmer(farmer);
    }

    @Override
    public int countVisitManageUnit(ManageUnit unit)
    {
        return mapper.countVisitManageUnit(unit);
    }

    @Override
    public List<Farmer> listVisitManageUnit(ManageUnit unit)
    {
        return mapper.listVisitManageUnit(unit);
    }

    @Override
    public UserBreed getVisitUserBreed(String breedId)
    {
        return mapper.getVisitUserBreed(breedId);
    }
}
