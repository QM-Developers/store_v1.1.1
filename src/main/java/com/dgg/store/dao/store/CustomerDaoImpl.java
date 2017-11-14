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
        return mapper.listCustomer(condition, start, end);
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
        return mapper.insertFrontImage(fileName, customerId);
    }

    @Override
    public int insertBackImage(String fileName, String customerId)
    {
        return mapper.insertBackImage(fileName, customerId);
    }

    @Override
    public int insertHandImage(String fileName, String customerId)
    {
        return mapper.insertHandImage(fileName, customerId);
    }

    @Override
    public int getRepertoryLevel(String customerType, String myTeamId)
    {
        return mapper.getRepertoryLevel(customerType, myTeamId);
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
    public List<CustomerVO> listAccountChecker(String myTeamId, String departmentId, String accountCheck)
    {
        return mapper.listAccountChecker(myTeamId, departmentId, accountCheck);
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
    public List<CustomerAccountRequest> listCustomerAccount(CustomerAccountRequest accountRequest, int pageNum, int pageSize)
    {
        return mapper.listCustomerAccount(accountRequest, pageNum, pageSize);
    }

    @Override
    public int insertHandImageRecord(String fileName, String customerId)
    {
        return mapper.insertHandImageRecord(fileName, customerId);
    }

    @Override
    public int insertFrontImageRecord(String fileName, String customerId)
    {
        return mapper.insertFrontImageRecord(fileName, customerId);
    }

    @Override
    public int insertBackImageRecord(String fileName, String customerId)
    {
        return mapper.insertBackImageRecord(fileName, customerId);
    }

    @Override
    public String getDeviceToken(String merchandiserId)
    {
        return mapper.getDeviceToken(merchandiserId);
    }

    @Override
    public int insertRecordByUser(String customerId)
    {
        return mapper.insertRecordByUser(customerId);
    }

    @Override
    public int deleteUser(String customerId)
    {
        return mapper.deleteUser(customerId);
    }

    @Override
    public int countHadCustomerAccount(String customerId, String myTeamId)
    {
        return mapper.countHadCustomerAccount(customerId, myTeamId);
    }

    @Override
    public int getCustomerExist(String userPhone, String myTeamId, String userId)
    {
        return mapper.getCustomerExist(userPhone, myTeamId, userId);
    }

    @Override
    public List<CustomerVO> listPromoter(CustomerVO customerVO, String pid)
    {
        return mapper.listPromoter(customerVO, pid);
    }

    @Override
    public List<CustomerRepertoryVO> listRepertoryLevel(String myTeamId)
    {
        return mapper.listRepertoryLevel(myTeamId);
    }

    @Override
    public String getUserImage(String userId)
    {
        return mapper.getUserImage(userId);
    }

    @Override
    public String getDepartmentName(String userId)
    {
        return mapper.getDepartmentName(userId);
    }

    @Override
    public int countCustomerAccount(CustomerAccountRequest accountRequest)
    {
        return mapper.countCustomerAccount(accountRequest);
    }

    @Override
    public String getUserName(String userId)
    {
        return mapper.getUserName(userId);
    }

}
