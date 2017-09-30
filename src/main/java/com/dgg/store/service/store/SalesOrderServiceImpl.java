package com.dgg.store.service.store;

import com.alibaba.fastjson.JSONObject;
import com.dgg.store.dao.common.MyOrderDao;
import com.dgg.store.util.core.OrderUtil;
import com.dgg.store.util.core.constant.Constant;
import com.dgg.store.util.core.constant.KeyConstant;
import com.dgg.store.util.core.page.PagingUtil;
import com.dgg.store.util.pojo.MyOrder;
import com.dgg.store.util.vo.core.PageVO;
import com.dgg.store.util.vo.core.ResultVO;
import com.dgg.store.util.vo.core.SessionVO;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SalesOrderServiceImpl implements SalesOrderService
{
    private final MyOrderDao dao;

    public SalesOrderServiceImpl(MyOrderDao dao)
    {
        this.dao = dao;
    }


    @Override
    public String listOrderSelective(SessionVO sessionVO, MyOrder myOrder, PageVO pageVO)
    {
        int pageNum = PagingUtil.getStart(pageVO.getPageNum(), pageVO.getPageSize());
        int pageSize = pageVO.getPageSize();

        int pageCount = PagingUtil.getCount(dao.countSalesOrder(myOrder, sessionVO.getUserId()), pageVO.getPageSize());
        List<MyOrder> result = dao.listSalesOrder(myOrder, sessionVO.getUserId(), pageNum, pageSize);
        result = OrderUtil.getOrderList(result, dao);
        result = OrderUtil.getOrderCount(result);

        JSONObject json = (JSONObject) JSONObject.toJSON(new ResultVO(Constant.REQUEST_SUCCESS, sessionVO.getToken(), result));
        json.put(KeyConstant.PAGE_COUNT, pageCount);

        return json.toJSONString();
    }

    @Override
    public String listSales(SessionVO sessionVO)
    {
        List<MyOrder> result = dao.listSales(sessionVO.getUserId());

        return JSONObject.toJSONString(new ResultVO(Constant.REQUEST_SUCCESS, sessionVO.getToken(), result));
    }

    @Override
    public String listOrderSelectiveByManager(SessionVO sessionVO, MyOrder myOrder, PageVO pageVO)
    {
        int pageNum = PagingUtil.getStart(pageVO.getPageNum(), pageVO.getPageSize());
        int pageSize = pageVO.getPageSize();

        int pageCount = PagingUtil.getCount(dao.countOrderSelectiveByManager(myOrder, sessionVO.getUserId()), pageVO.getPageSize());
        List<MyOrder> result = dao.listOrderSelectiveByManager(myOrder, sessionVO.getUserId(), pageNum, pageSize);
        result = OrderUtil.getOrderList(result, dao);
        result = OrderUtil.getOrderCount(result);

        JSONObject json = (JSONObject) JSONObject.toJSON(new ResultVO(Constant.REQUEST_SUCCESS, sessionVO.getToken(), result));
        json.put(KeyConstant.PAGE_COUNT, pageCount);

        return json.toJSONString();
    }
}
