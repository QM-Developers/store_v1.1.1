package com.dgg.store.mapper;

import com.dgg.store.util.pojo.MyTeam;
import com.dgg.store.util.vo.CustomerGroupVO;
import com.dgg.store.util.vo.CustomerVO;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface CustomerMapper
{
    Integer insertStoreUser(CustomerVO customerVO);

    Integer insertCustomerGroup(CustomerVO customerVO);

    CustomerVO findCustomerInfo(@Param("customerId") String customerId);

    List<CustomerVO> findCustomerByGroup(@Param("groupId") String customerGroupId,@Param("userId") String userId);

    List<MyTeam> findCooperation(@Param("userId") String userId);

    List<CustomerVO> findPartner(@Param("cooperId") Integer integer);

    Integer insertCooperation(MyTeam myTeam);

    Integer updateCustomer(CustomerVO customerVO);

    Integer insertCustomerHistory(@Param("customerId") String customerId);

    List<CustomerGroupVO> findCustomerGroup();

    int insertCustomerRecord(CustomerVO customerVO);

    Integer insertCustomer(CustomerVO customerVO);

    Integer updateCustomerRecord(CustomerVO customerVO);

    Integer updateCustomerUser(CustomerVO customerVO);

    int findCustomerUpdateCount(@Param("customerId") String customerId);
}
