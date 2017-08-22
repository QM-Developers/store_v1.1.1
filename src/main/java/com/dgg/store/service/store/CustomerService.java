package com.dgg.store.service.store;

import com.dgg.store.util.vo.CustomerVO;
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
}
