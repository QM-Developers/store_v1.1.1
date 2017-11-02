package com.dgg.store.service.store;

import com.dgg.store.util.pojo.CustomerAssist;
import com.dgg.store.util.pojo.CustomerAssistUser;
import com.dgg.store.util.vo.core.PageVO;
import com.dgg.store.util.vo.core.SessionVO;
import org.springframework.web.multipart.MultipartFile;

public interface CustomerAssistService
{
    String insertCustomerAssist(SessionVO sessionVO, CustomerAssist assist);

    String insertAssistImage(SessionVO sessionVO, MultipartFile file, CustomerAssist assist);

    String listCustomerAssistByProposer(SessionVO sessionVO, PageVO pageVO);

    String listCustomerAssistByHelper(SessionVO sessionVO, CustomerAssist assist, PageVO pageVO);

    String getCustomerAssist(SessionVO sessionVO, CustomerAssist assist);

    String updateCustomerAssistResult(SessionVO sessionVO, CustomerAssistUser assistUser);
}
