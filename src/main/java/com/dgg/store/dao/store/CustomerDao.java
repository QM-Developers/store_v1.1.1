package com.dgg.store.dao.store;

import com.dgg.store.util.pojo.CustomerAccountRequest;
import com.dgg.store.util.vo.customer.CustomerRepertoryVO;
import com.dgg.store.util.vo.customer.CustomerVO;

import java.util.List;

public interface CustomerDao
{
    int insertCustomerRecord(CustomerVO customerVO);

    Integer insertCustomer(CustomerVO customerVO);

    List<CustomerVO> listCustomer(CustomerVO condition, int start, int end);

    Integer updateCustomer(CustomerVO customerVO);

    Integer updateCustomerUser(CustomerVO customerVO);

    Integer updateCustomerUserRecord(CustomerVO customerVO);

    int countCustomer(CustomerVO customerVO);

    CustomerVO getCustomer(CustomerVO customerVO);

    int insertFrontImage(String fileName, String customerId);

    int insertBackImage(String fileName, String customerId);

    int insertHandImage(String fileName, String customerId);

    int getRepertoryLevel(String customerType, String myTeamId);

    int countRepertoryLevel(CustomerRepertoryVO repertory);

    int insertRepertoryLevel(CustomerRepertoryVO repertory);

    List<CustomerVO> listMerchandiserFirst(CustomerVO customerVO);

    List<CustomerVO> listMerchandiserSecond(CustomerVO customerVO);

    List<CustomerVO> listAccountChecker(String myTeamId, String departmentId, String accountCheck);

    int insertCustomerAccount(CustomerAccountRequest accountRequest);

    int updateCustomerAccountById(CustomerAccountRequest accountRequest);

    int updateRecordToAccount(String customerId);

    int deleteRecord(String customerId);

    CustomerAccountRequest getCustomerAccount(String requestId);

    List<CustomerAccountRequest> listCustomerAccount(CustomerAccountRequest accountRequest, int pageNum, int pageSize);

    int insertHandImageRecord(String fileName, String customerId);

    int insertFrontImageRecord(String fileName, String customerId);

    int insertBackImageRecord(String fileName, String customerId);

    String getDeviceToken(String merchandiserId);

    int insertRecordByUser(String customerId);

    int deleteUser(String customerId);

    int countHadCustomerAccount(String customerId, String myTeamId);

    int getCustomerExist(String userPhone, String myTeamId, String userId);

    List<CustomerVO> listPromoter(CustomerVO customerVO, String pid);

    List<CustomerRepertoryVO> listRepertoryLevel(String myTeamId);

    String getUserImage(String userId);

    String getDepartmentName(String userId);

    int countCustomerAccount(CustomerAccountRequest accountRequest);

    String getUserName(String userId);

}
