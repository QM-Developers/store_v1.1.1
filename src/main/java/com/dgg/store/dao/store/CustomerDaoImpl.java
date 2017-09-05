package com.dgg.store.dao.store;

import com.dgg.store.mapper.CustomerMapper;
import com.dgg.store.util.pojo.CustomerAccountRequest;
import com.dgg.store.util.vo.customer.CustomerRepertoryVO;
import com.dgg.store.util.vo.customer.CustomerVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class CustomerDaoImpl implements CustomerDao
{
    @Autowired
    private CustomerMapper mapper;

    @Override
    public int insertCustomerRecord(CustomerVO customerVO)
    {
        return mapper.insertCustomerRecord(customerVO);
    }

    @Override
    public Integer insertCustomer(CustomerVO customerVO)
    {
        return mapper.insertCustomer(customerVO);
    }

    @Override
    public List<CustomerVO> listCustomer(CustomerVO condition, int start, int end)
    {
        return mapper.listCustomer(condition,start,end);
    }

    @Override
    public Integer updateCustomer(CustomerVO customerVO)
    {
        return mapper.updateCustomer(customerVO);
    }

    @Override
    public Integer updateCustomerUser(CustomerVO customerVO)
    {
        return mapper.updateCustomerUser(customerVO);
    }

    @Override
    public Integer updateCustomerUserRecord(CustomerVO customerVO)
    {
        return mapper.updateCustomerUserRecord(customerVO);
    }

    @Override
    public int countCustomer(CustomerVO customerVO)
    {
        return mapper.countCustomer(customerVO);
    }

    @Override
    public CustomerVO getCustomer(CustomerVO customerVO)
    {
        return mapper.getCustomer(customerVO);
    }

    @Override
    public int insertFrontImage(String fileName, String customerId)
    {
        return mapper.insertFrontImage(fileName,customerId);
    }

    @Override
    public int insertBackImage(String fileName, String customerId)
    {
        return mapper.insertBackImage(fileName,customerId);
    }

    @Override
    public int insertHandImage(String fileName, String customerId)
    {
        return mapper.insertHandImage(fileName,customerId);
    }

    @Override
    public int getRepertoryLevel(String customerType, String myTeamId)
    {
        return mapper.getRepertoryLevel(customerType,myTeamId);
    }

    @Override
    public int countRepertoryLevel(CustomerRepertoryVO repertory)
    {
        return mapper.countRepertoryLevel(repertory);
    }

    @Override
    public int insertRepertoryLevel(CustomerRepertoryVO repertory)
    {
        return mapper.insertRepertoryLevel(repertory);
    }

    @Override
    public List<CustomerVO> listMerchandiserFirst(CustomerVO customerVO)
    {
        return mapper.listMerchandiserFirst(customerVO);
    }

    @Override
    public List<CustomerVO> listMerchandiserSecond(CustomerVO customerVO)
    {
        return mapper.listMerchandiserSecond(customerVO);
    }

    @Override
    public List<CustomerVO> listAccountChecker(String myTeamId, String accountCheck)
    {
        return mapper.listAccountChecker(myTeamId,accountCheck);
    }

    @Override
    public int insertCustomerAccount(CustomerAccountRequest accountRequest)
    {
        return mapper.insertCustomerAccount(accountRequest);
    }

    @Override
    public int updateCustomerAccountById(CustomerAccountRequest accountRequest)
    {
        return mapper.updateCustomerAccountById(accountRequest);
    }

    @Override
    public int updateRecordToAccount(String customerId)
    {
        return mapper.updateRecordToAccount(customerId);
    }

    @Override
    public int deleteRecord(String customerId)
    {
        return mapper.deleteRecord(customerId);
    }

    @Override
    public CustomerAccountRequest getCustomerAccount(String requestId)
    {
        return mapper.getCustomerAccount(requestId);
    }

    @Override
    public List<CustomerAccountRequest> listCustomerAccount(CustomerAccountRequest accountRequest)
    {
        return mapper.listCustomerAccount(accountRequest);
    }

    @Override
    public int insertHandImageRecord(String fileName, String customerId)
    {
        return mapper.insertHandImageRecord(fileName,customerId);
    }

    @Override
    public int insertFrontImageRecord(String fileName, String customerId)
    {
        return mapper.insertFrontImageRecord(fileName,customerId);
    }

    @Override
    public int insertBackImageRecord(String fileName, String customerId)
    {
        return mapper.insertBackImageRecord(fileName,customerId);
    }

    @Override
    public String getDeviceToken(String merchandiserId)
    {
        return mapper.getDeviceToken(merchandiserId);
    }

}
