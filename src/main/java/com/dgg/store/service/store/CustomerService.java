package com.dgg.store.service.store;

import com.dgg.store.util.pojo.CustomerAccountRequest;
import com.dgg.store.util.vo.customer.CustomerRepertoryVO;
import com.dgg.store.util.vo.customer.CustomerVO;
import com.dgg.store.util.vo.core.PageVO;
import com.dgg.store.util.vo.core.SessionVO;
import org.springframework.web.multipart.MultipartFile;

public interface CustomerService
{
    String insertCustomerRecord(CustomerVO customerVO, SessionVO sessionVO);

    String listCustomer(SessionVO sessionVO, PageVO pageVO, CustomerVO customerVO);

    String updateCustomer(SessionVO sessionVO, CustomerVO customerVO);

    String insertFrontImage(SessionVO sessionVO, MultipartFile file, String realPath, CustomerVO customerVO);

    String insertHandImage(SessionVO sessionVO, MultipartFile file, String realPath, CustomerVO customerVO);

    String getCustomer(SessionVO sessionVO, CustomerVO customerVO);

    String insertBackImage(SessionVO sessionVO, MultipartFile file, String realPath, CustomerVO customerVO);

    String listMerchandiser(SessionVO sessionVO, CustomerVO customerVO);

    String insertRepertoryLevel(SessionVO sessionVO, CustomerRepertoryVO repertory);

    String listAccountChecker(SessionVO sessionVO);

    String insertCustomerAccount(SessionVO sessionVO, CustomerAccountRequest accountRequest);

    String updateCustomerAccountAccept(SessionVO sessionVO, CustomerAccountRequest accountRequest);

    String getCustomerAccount(SessionVO sessionVO, CustomerAccountRequest accountRequest);

    String updateCustomerAccountRefuse(SessionVO sessionVO, CustomerAccountRequest accountRequest);

    String listCustomerAccountByProposer(SessionVO sessionVO, CustomerAccountRequest accountRequest);

    String listCustomerAccountByChecker(SessionVO sessionVO, CustomerAccountRequest accountRequest);
}
