package com.dgg.store.service.store;

import com.alibaba.fastjson.JSONObject;
import com.dgg.store.dao.store.CustomerDao;
import com.dgg.store.util.core.constant.Constant;
import com.dgg.store.util.core.constant.KeyConstant;
import com.dgg.store.util.core.generator.IDGenerator;
import com.dgg.store.util.core.page.PagingUtil;
import com.dgg.store.util.core.string.StringUtil;
import com.dgg.store.util.vo.CustomerVO;
import com.dgg.store.util.vo.core.PageVO;
import com.dgg.store.util.vo.core.ResultVO;
import com.dgg.store.util.vo.core.SessionVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CustomerServiceImpl implements CustomerService
{
    @Autowired
    private CustomerDao dao;

    @Override
    public String insertCustomerRecord(CustomerVO customerVO, SessionVO sessionVO)
    {
        Integer result = 1;
        int i = 0;
        int count = 2;

        while (result > 0)
        {
            switch (i)
            {
                case 0:
                    customerVO.setUserId(IDGenerator.generator());
                    customerVO.setUserStatus(Constant.USER_STATE_0);
                    customerVO.setRoleId(Integer.parseInt(Constant.ROLE_DEFAULT_USER));
                    customerVO.setMyTeamId(sessionVO.getMyTeamId());
                    result = dao.insertCustomerRecord(customerVO);
                    break;
                case 1:
                    customerVO.setPromoterId(sessionVO.getUserId());
                    customerVO.setCustomerId(IDGenerator.generator());
                    customerVO.setBusinessAddress(StringUtil.isEmpty(customerVO.getBusinessAddress()) ? "" : customerVO.getBusinessAddress());
                    customerVO.setStation(StringUtil.isEmpty(customerVO.getStation()) ? "" : customerVO.getStation());
                    result = dao.insertCustomer(customerVO);
                    break;
                default:
                    result = 0;
                    break;
            }
            i++;
        }

        if (i - 1 < count)
            throw new RuntimeException(Constant.STR_ADD_FAILED);
        else
            result = 1;

        JSONObject json = (JSONObject) JSONObject.toJSON(new ResultVO(result == 1 ? 1 : 0, sessionVO.getToken(), customerVO.getCustomerId()));

        return json.toJSONString();
    }

    @Override
    public String listCustomer(SessionVO sessionVO, PageVO pageVO, CustomerVO customerVO)
    {
        int start = PagingUtil.getStart(pageVO.getPageNum(), pageVO.getPageSize());
        int end = pageVO.getPageSize();
        int pageCount = dao.countCustomer(customerVO);
        pageCount = PagingUtil.getCount(pageCount,pageVO.getPageSize());

        customerVO.setMyTeamId(sessionVO.getMyTeamId());
        customerVO.setUserId(sessionVO.getUserId());
        List<CustomerVO> result = dao.listCustomer(customerVO, start, end);

        JSONObject json = (JSONObject) JSONObject.toJSON(new ResultVO(1, sessionVO.getToken(), result));
        json.put(KeyConstant.PAGE_COUNT,pageCount);

        return json.toJSONString();
    }

    @Override
    public String updateCustomer(SessionVO sessionVO, CustomerVO customerVO)
    {
        Integer result = 1;
        int i = 0;
        int count = 2;

        while (result > 0)
        {
            switch (i)
            {
                case 0:
                    result = dao.updateCustomerUser(customerVO);
                    if (result < 1)
                        result = dao.updateCustomerUserRecord(customerVO);
                    break;
                case 1:
                    result = dao.updateCustomer(customerVO);
                    break;
                default:
                    result = 0;
                    break;
            }
            i++;
        }

        if (i - 1 < count)
            throw new RuntimeException(Constant.STR_ADD_FAILED);
        else
            result = 1;

        JSONObject json = (JSONObject) JSONObject.toJSON(new ResultVO(result == 1 ? 1 : 0, sessionVO.getToken()));

        return json.toJSONString();
    }

}
