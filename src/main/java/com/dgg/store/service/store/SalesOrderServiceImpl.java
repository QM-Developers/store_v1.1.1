package com.dgg.store.service.store;

import com.alibaba.fastjson.JSONObject;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.dgg.store.mapper.MyOrderMapper;
import com.dgg.store.util.core.OrderUtil;
import com.dgg.store.util.core.constant.Constant;
import com.dgg.store.util.core.constant.KeyConstant;
import com.dgg.store.util.core.page.PagingUtil;
import com.dgg.store.util.core.parameter.ParameterUtil;
import com.dgg.store.util.pojo.MyOrder;
import com.dgg.store.util.pojo.MyOrderExample;
import com.dgg.store.util.vo.core.PageVO;
import com.dgg.store.util.vo.core.ResultVO;
import com.dgg.store.util.vo.core.SessionVO;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SalesOrderServiceImpl implements SalesOrderService
{
    private final MyOrderMapper orderMapper;

    public SalesOrderServiceImpl(MyOrderMapper orderMapper)
    {
        this.orderMapper = orderMapper;
    }


    @Override
    public String listOrderSelective(SessionVO sessionVO, MyOrder myOrder, PageVO pageVO)
    {
        if (ParameterUtil.objectIsNull(pageVO))
            return JSONObject.toJSONString(new ResultVO(Constant.REQUEST_FAILED, sessionVO.getToken()));

        int pageNum = PagingUtil.getStart(pageVO.getPageNum(), pageVO.getPageSize());
        int pageSize = pageVO.getPageSize();

        myOrder.setStatusList(OrderUtil.getOrderStatus(myOrder.getOrderStatus()));

        int pageCount = PagingUtil.getCount(orderMapper.countSalesOrder(myOrder, sessionVO.getUserId()), pageVO.getPageSize());
        List<MyOrder> result = orderMapper.listSalesOrder(myOrder, sessionVO.getUserId(), pageNum, pageSize);
        result = OrderUtil.getOrderList(result, orderMapper);
        result = OrderUtil.getOrderCount(result);
        for (MyOrder mo : result)
        {
            mo.setMerchandiserId(orderMapper.getPromoterId(mo.getUserId()));
            mo.setMerchandiserName(orderMapper.getUserName(mo.getMerchandiserId()));
        }

        JSONObject json = (JSONObject) JSONObject.toJSON(new ResultVO(Constant.REQUEST_SUCCESS, sessionVO.getToken(), result));
        json.put(KeyConstant.PAGE_COUNT, pageCount);

        return json.toJSONString();
    }

    @Override
    public String listSales(SessionVO sessionVO)
    {
        List<MyOrder> result = orderMapper.listSales(sessionVO.getUserId());

        return JSONObject.toJSONString(new ResultVO(Constant.REQUEST_SUCCESS, sessionVO.getToken(), result));
    }

    @Override
    public String listOrderSelectiveByManager(SessionVO sessionVO, MyOrder myOrder, PageVO pageVO)
    {
        if (ParameterUtil.objectIsNull(pageVO))
            return JSONObject.toJSONString(new ResultVO(Constant.REQUEST_FAILED, sessionVO.getToken()));

        int pageNum = PagingUtil.getStart(pageVO.getPageNum(), pageVO.getPageSize());
        int pageSize = pageVO.getPageSize();

        myOrder.setStatusList(OrderUtil.getOrderStatus(myOrder.getOrderStatus()));

        int pageCount = PagingUtil.getCount(orderMapper.countOrderSelectiveByManager(myOrder, sessionVO.getUserId()), pageVO.getPageSize());
        List<MyOrder> result = orderMapper.listOrderSelectiveByManager(myOrder, sessionVO.getUserId(), pageNum, pageSize);
        result = OrderUtil.getOrderList(result, orderMapper);
        result = OrderUtil.getOrderCount(result);
        for (MyOrder mo : result)
        {
            mo.setMerchandiserId(orderMapper.getPromoterId(mo.getUserId()));
            mo.setMerchandiserName(orderMapper.getUserName(mo.getMerchandiserId()));
        }

        JSONObject json = (JSONObject) JSONObject.toJSON(new ResultVO(Constant.REQUEST_SUCCESS, sessionVO.getToken(), result));
        json.put(KeyConstant.PAGE_COUNT, pageCount);

        return json.toJSONString();
    }

    @Override
    public String listOrderByKeyword(SessionVO sessionVO, String keyword, PageVO pageVO)
    {
        if (ParameterUtil.objectIsNull(pageVO))
            return JSONObject.toJSONString(new ResultVO(Constant.REQUEST_FAILED, sessionVO.getToken()));

        int pageNum = PagingUtil.getStart(pageVO.getPageNum(), pageVO.getPageSize());
        int pageSize = pageVO.getPageSize();

        MyOrder myOrder = new MyOrder();
        myOrder.setMyTeamId(sessionVO.getMyTeamId());
        myOrder.setKeyword(keyword);
        myOrder.setStatusList(OrderUtil.getOrderStatus(myOrder.getOrderStatus()));

        int pageCount = PagingUtil.getCount(orderMapper.countSalesOrder(myOrder, sessionVO.getUserId()), pageVO.getPageSize());
        List<MyOrder> result = orderMapper.listSalesOrder(myOrder, sessionVO.getUserId(), pageNum, pageSize);
        result = OrderUtil.getOrderList(result, orderMapper);
        result = OrderUtil.getOrderCount(result);
        for (MyOrder mo : result)
        {
            mo.setMerchandiserId(orderMapper.getPromoterId(mo.getUserId()));
            mo.setMerchandiserName(orderMapper.getUserName(mo.getMerchandiserId()));
        }

        JSONObject json = (JSONObject) JSONObject.toJSON(new ResultVO(Constant.REQUEST_SUCCESS, sessionVO.getToken(), result));
        json.put(KeyConstant.PAGE_COUNT, pageCount);

        return json.toJSONString();
    }

    @Override
    public String getOrder(SessionVO sessionVO, MyOrder myOrder)
    {
        MyOrderExample example = new MyOrderExample();
        MyOrderExample.Criteria criteria = example.createCriteria();

        criteria.andUserIdEqualTo(myOrder.getMemberId());
        criteria.andOrderIdEqualTo(myOrder.getOrderId());

        List<MyOrder> orderList = orderMapper.selectByExample(example);
        if (orderList == null || orderList.size() < 1)
            return JSONObject.toJSONString(new ResultVO(Constant.REQUEST_FAILED, sessionVO.getToken()));

        orderList = OrderUtil.getOrderList(orderList, orderMapper);
        myOrder = orderList.get(0);
        myOrder = OrderUtil.getOrderCount(myOrder);
        myOrder.setMerchandiserId(orderMapper.getPromoterId(myOrder.getUserId()));
        myOrder.setMerchandiserName(orderMapper.getUserName(myOrder.getMerchandiserId()));

        return JSONObject.toJSONString(new ResultVO(Constant.REQUEST_SUCCESS, sessionVO.getToken(), myOrder), SerializerFeature.WriteNullStringAsEmpty);
    }
}
