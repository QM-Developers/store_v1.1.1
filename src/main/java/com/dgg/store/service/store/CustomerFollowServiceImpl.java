package com.dgg.store.service.store;

import com.alibaba.fastjson.JSONObject;
import com.dgg.store.dao.store.CustomerFollowDao;
import com.dgg.store.util.core.constant.Constant;
import com.dgg.store.util.core.constant.KeyConstant;
import com.dgg.store.util.core.generator.IDGenerator;
import com.dgg.store.util.core.page.PagingUtil;
import com.dgg.store.util.pojo.CustomerFollow;
import com.dgg.store.util.pojo.CustomerFollowExample;
import com.dgg.store.util.vo.core.PageVO;
import com.dgg.store.util.vo.core.ResultVO;
import com.dgg.store.util.vo.core.SessionVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CustomerFollowServiceImpl implements CustomerFollowService
{
    @Autowired
    private CustomerFollowDao dao;

    @Override
    public String insertCustomerFollow(SessionVO sessionVO, CustomerFollow follow)
    {
        follow.setFollowId(IDGenerator.generator());
        follow.setPromoterId(sessionVO.getUserId());
        follow.setPromoterName(dao.getUserName(sessionVO.getUserId()));

        int result = dao.insertSelective(follow);

        return JSONObject.toJSONString(new ResultVO(result < 1 ? Constant.REQUEST_FAILED : Constant.REQUEST_SUCCESS, sessionVO.getToken(), result));
    }

    @Override
    public String listCustomerFollow(SessionVO sessionVO, CustomerFollow follow, PageVO pageVO)
    {
        CustomerFollowExample example = new CustomerFollowExample();
        CustomerFollowExample.Criteria criteria = example.createCriteria();

        example.setPageNum(PagingUtil.getStart(pageVO.getPageNum(), pageVO.getPageSize()));
        example.setPageSize(pageVO.getPageSize());

        criteria.andCustomerIdEqualTo(follow.getCustomerId());

        int pageCount = PagingUtil.getCount((int) dao.countByExample(example), pageVO.getPageSize());
        List<CustomerFollow> result = dao.selectByExample(example);

        JSONObject json = (JSONObject) JSONObject.toJSON(new ResultVO(Constant.REQUEST_SUCCESS, sessionVO.getToken(), result));
        json.put(KeyConstant.PAGE_COUNT, pageCount);

        return json.toJSONString();
    }

    @Override
    public String getCustomerFollow(SessionVO sessionVO, CustomerFollow follow)
    {
        CustomerFollow result = dao.selectByPrimaryKey(follow.getFollowId());

        return JSONObject.toJSONString(new ResultVO(result == null ? Constant.REQUEST_FAILED : Constant.REQUEST_SUCCESS, sessionVO.getToken(), result));
    }

    @Override
    public String updateCustomerFollow(SessionVO sessionVO, CustomerFollow follow)
    {
        follow.setPromoterId(null);
        follow.setPromoterName(null);
        follow.setCustomerId(null);
        follow.setCustomerName(null);

        int result = dao.updateByPrimaryKeySelective(follow);

        return JSONObject.toJSONString(new ResultVO(result < 1 ? Constant.REQUEST_FAILED : Constant.REQUEST_SUCCESS, sessionVO.getToken()));
    }


}
