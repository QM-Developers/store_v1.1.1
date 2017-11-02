package com.dgg.store.mapper;

import com.dgg.store.util.pojo.CustomerAccountRequest;
import com.dgg.store.util.vo.customer.CustomerRepertoryVO;
import com.dgg.store.util.vo.customer.CustomerVO;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface CustomerMapper
{
    int insertCustomerRecord(CustomerVO customerVO);

    Integer insertCustomer(CustomerVO customerVO);

    List<CustomerVO> listCustomer(@Param("customer") CustomerVO condition, @Param("start") int start, @Param("end") int end);

    Integer updateCustomer(CustomerVO customerVO);

    Integer updateCustomerUserRecord(CustomerVO customerVO);

    Integer updateCustomerUser(CustomerVO customerVO);

    int countCustomer(CustomerVO customerVO);

    CustomerVO getCustomer(CustomerVO customerVO);

    int insertFrontImage(@Param("fileName") String fileName, @Param("customerId") String customerId);

    int insertBackImage(@Param("fileName") String fileName, @Param("customerId") String customerId);

    int insertHandImage(@Param("fileName") String fileName, @Param("customerId") String customerId);

    int getRepertoryLevel(@Param("customerType") String customerType, @Param("myTeamId") String myTeamId);

    int countRepertoryLevel(CustomerRepertoryVO repertory);

    int insertRepertoryLevel(CustomerRepertoryVO repertory);

    List<CustomerVO> listMerchandiserFirst(CustomerVO customerVO);

    List<CustomerVO> listMerchandiserSecond(CustomerVO customerVO);

    List<CustomerVO> listAccountChecker(@Param("myTeamId") String myTeamId, @Param("permissionId") String accountCheck);

    int insertCustomerAccount(CustomerAccountRequest accountRequest);

    int updateCustomerAccountById(CustomerAccountRequest accountRequest);

    int updateRecordToAccount(@Param("customerId") String customerId);

    int deleteRecord(@Param("customerId") String customerId);

    CustomerAccountRequest getCustomerAccount(@Param("requestId") String requestId);

    List<CustomerAccountRequest> listCustomerAccount(@Param("request") CustomerAccountRequest accountRequest,@Param("pageNum") int pageNum,@Param("pageSize") int pageSize);

    int insertHandImageRecord(@Param("fileName") String fileName, @Param("customerId") String customerId);

    int insertFrontImageRecord(@Param("fileName") String fileName, @Param("customerId") String customerId);

    int insertBackImageRecord(@Param("fileName") String fileName, @Param("customerId") String customerId);

    String getDeviceToken(@Param("userId") String merchandiserId);

    int insertRecordByUser(@Param("customerId") String customerId);

    int deleteUser(@Param("customerId") String customerId);

    int countCustomerAccount(@Param("customerId") String customerId, @Param("myTeamId") String myTeamId);

    int getCustomerExist(@Param("userPhone") String userPhone, @Param("myTeamId") String myTeamId, @Param("userId") String userId);

    List<CustomerVO> listPromoter(@Param("myTeamId") String myTeamId, @Param("permissionId") String accountCheck);

    List<CustomerRepertoryVO> listRepertoryLevel(String myTeamId);

    String getUserImage(String userId);

    String getDepartmentName(String userId);
}
