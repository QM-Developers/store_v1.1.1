package com.dgg.store.dao.store;

import com.dgg.store.mapper.CustomerVisitMapper;
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
    public List<DepartmentVO> listVisitDepartment(String userId)
    {
        return mapper.listVisitDepartment(userId);
    }

    @Override
    public List<MemberVO> listVisitMember(String departmentId)
    {
        return mapper.listVisitMember(departmentId);
    }

    @Override
    public int countVisitCustomer(CustomerVO customerVO)
    {
        return mapper.countVisitCustomer(customerVO);
    }

    @Override
    public List<CustomerVO> listVisitCustomer(CustomerVO customerVO)
    {
        return mapper.listVisitCustomer(customerVO);
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
}
