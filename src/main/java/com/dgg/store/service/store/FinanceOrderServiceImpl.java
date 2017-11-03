package com.dgg.store.service.store;

import com.alibaba.fastjson.JSONObject;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.dgg.store.dao.common.MyOrderDao;
import com.dgg.store.mapper.MyOrderMapper;
import com.dgg.store.mapper.PushMessageMapper;
import com.dgg.store.util.core.OrderUtil;
import com.dgg.store.util.core.constant.*;
import com.dgg.store.util.core.page.PagingUtil;
import com.dgg.store.util.core.umeng.push.PushMessageFactory;
import com.dgg.store.util.core.umeng.push.UMengUtil;
import com.dgg.store.util.pojo.MyOrder;
import com.dgg.store.util.pojo.MyOrderExample;
import com.dgg.store.util.vo.core.PageVO;
import com.dgg.store.util.vo.core.ResultVO;
import com.dgg.store.util.vo.core.SessionVO;
import com.dgg.store.util.vo.manage.MemberVO;
import com.dgg.store.util.vo.order.MyOrderListVO;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Service
public class FinanceOrderServiceImpl implements FinanceOrderService
{
    private final MyOrderMapper orderMapper;
    private final PushMessageMapper mapper;

    public FinanceOrderServiceImpl(MyOrderMapper orderMapper, PushMessageMapper mapper)
    {
        this.orderMapper = orderMapper;
        this.mapper = mapper;
    }

    @Override
    public String listFinanceOrderSelective(SessionVO sessionVO, MyOrder myOrder, PageVO pageVO)
    {
        int pageNum = PagingUtil.getStart(pageVO.getPageNum(), pageVO.getPageSize());
        int pageSize = pageVO.getPageSize();

        myOrder.setStatusList(OrderUtil.getOrderStatus(myOrder.getOrderStatus()));

        int pageCount = PagingUtil.getCount(orderMapper.countFinanceOrder(myOrder, sessionVO.getMyTeamId()), pageVO.getPageSize());
        List<MyOrder> result = orderMapper.listFinanceOrder(myOrder, sessionVO.getMyTeamId(), pageNum, pageSize);
        result = OrderUtil.getOrderList(result, orderMapper);
        result = OrderUtil.getOrderCount(result);

        JSONObject json = (JSONObject) JSONObject.toJSON(new ResultVO(Constant.REQUEST_SUCCESS, sessionVO.getToken(), result));
        json.put(KeyConstant.PAGE_COUNT, pageCount);

        return json.toJSONString();
    }

    @Override
    public String updateFinancePassA(SessionVO sessionVO, MyOrder myOrder)
    {
        myOrder = orderMapper.selectByPrimaryKey(myOrder.getOrderId());

        boolean flag = myOrder.getOrderStatus().equals(OrderConstant.WAITING_FINANCE_CHECK_A);
        flag |= myOrder.getOrderStatus().equals(OrderConstant.FINANCE_CHECK_FAIL_A);
        flag &= myOrder.getPaymentType().equals(OrderConstant.PAYMENT_TRANSFER);

        if (!flag)
            return JSONObject.toJSONString(new ResultVO(Constant.REQUEST_FAILED, sessionVO.getToken()));

        MyOrder record = new MyOrder();
        record.setOrderId(myOrder.getOrderId());
        record.setPaymentStatus(OrderConstant.ALREADY_PAY);
        record.setOrderStatus(OrderConstant.WAITING_SALESMAN_CHECK);

        int result = orderMapper.updateByPrimaryKeySelective(record);

        UMengUtil.sendUnicast(orderMapper.getDeviceToken(myOrder.getUserId()), PushMessageFactory.getInstance(mapper).get(PushMessageConstant.ORDER_FINANCE_PASS));
        UMengUtil.sendUnicast(orderMapper.getSalesDeviceToken(myOrder.getUserId(), sessionVO.getMyTeamId()), PushMessageFactory.getInstance(mapper).get(PushMessageConstant.ORDER_FINANCE_PASS));

        return JSONObject.toJSONString(new ResultVO(result < 1 ? 2 : 1, sessionVO.getToken()));
    }

    @Override
    public String updateFinanceFailA(SessionVO sessionVO, MyOrder myOrder)
    {
        myOrder = orderMapper.selectByPrimaryKey(myOrder.getOrderId());

        boolean flag = myOrder.getOrderStatus().equals(OrderConstant.WAITING_FINANCE_CHECK_A);
        flag |= myOrder.getOrderStatus().equals(OrderConstant.FINANCE_CHECK_FAIL_A);
        flag &= myOrder.getPaymentType().equals(OrderConstant.PAYMENT_TRANSFER);
        if (!flag)
            return JSONObject.toJSONString(new ResultVO(Constant.REQUEST_FAILED, sessionVO.getToken()));

        MyOrder record = new MyOrder();
        record.setOrderId(myOrder.getOrderId());
        record.setOrderStatus(OrderConstant.FINANCE_CHECK_FAIL_A);

        int result = orderMapper.updateByPrimaryKeySelective(record);

        UMengUtil.sendUnicast(orderMapper.getDeviceToken(myOrder.getUserId()), PushMessageFactory.getInstance(mapper).get(PushMessageConstant.ORDER_FINANCE_REFUSE));
        UMengUtil.sendUnicast(orderMapper.getSalesDeviceToken(myOrder.getUserId(), sessionVO.getMyTeamId()), PushMessageFactory.getInstance(mapper).get(PushMessageConstant.ORDER_FINANCE_REFUSE));

        return JSONObject.toJSONString(new ResultVO(result < 1 ? 2 : 1, sessionVO.getToken()));
    }

    @Override
    public String updateFinancePassB(SessionVO sessionVO, MyOrder myOrder)
    {
        myOrder = orderMapper.selectByPrimaryKey(myOrder.getOrderId());

        boolean flag = myOrder.getOrderStatus().equals(OrderConstant.WAITING_FINANCE_CHECK_B);
        flag |= myOrder.getOrderStatus().equals(OrderConstant.FINANCE_CHECK_FAIL_B);

        if (!flag)
            return JSONObject.toJSONString(new ResultVO(Constant.REQUEST_FAILED, sessionVO.getToken()));

        MyOrder record = new MyOrder();
        record.setOrderId(myOrder.getOrderId());
        record.setOrderStatus(OrderConstant.ORDER_SUCCESS);
        record.setFinishDate(new Date());

        int result = orderMapper.updateByPrimaryKeySelective(record);

        UMengUtil.sendUnicast(orderMapper.getDeviceToken(myOrder.getUserId()), PushMessageFactory.getInstance(mapper).get(PushMessageConstant.ORDER_FINANCE_PASS));
        UMengUtil.sendUnicast(orderMapper.getSalesDeviceToken(myOrder.getUserId(), sessionVO.getMyTeamId()), PushMessageFactory.getInstance(mapper).get(PushMessageConstant.ORDER_FINANCE_PASS));

        return JSONObject.toJSONString(new ResultVO(result < 1 ? 2 : 1, sessionVO.getToken()));
    }

    @Override
    public String updateFinanceFailB(SessionVO sessionVO, MyOrder myOrder)
    {
        myOrder = orderMapper.selectByPrimaryKey(myOrder.getOrderId());

        boolean flag = myOrder.getOrderStatus().equals(OrderConstant.WAITING_FINANCE_CHECK_B);

        if (!flag)
            return JSONObject.toJSONString(new ResultVO(Constant.REQUEST_FAILED, sessionVO.getToken()));

        MyOrder record = new MyOrder();
        record.setOrderId(myOrder.getOrderId());
        record.setOrderStatus(OrderConstant.FINANCE_CHECK_FAIL_B);

        int result = orderMapper.updateByPrimaryKeySelective(record);

        UMengUtil.sendUnicast(orderMapper.getDeviceToken(myOrder.getUserId()), PushMessageFactory.getInstance(mapper).get(PushMessageConstant.ORDER_FINANCE_REFUSE));
        UMengUtil.sendUnicast(orderMapper.getSalesDeviceToken(myOrder.getUserId(), sessionVO.getMyTeamId()), PushMessageFactory.getInstance(mapper).get(PushMessageConstant.ORDER_FINANCE_REFUSE));

        return JSONObject.toJSONString(new ResultVO(result < 1 ? 2 : 1, sessionVO.getToken()));
    }

    @Override
    public String updateRefundMoney(SessionVO sessionVO, MyOrder myOrder)
    {
        myOrder = orderMapper.selectByPrimaryKey(myOrder.getOrderId());

        boolean flag = myOrder.getOrderStatus().equals(OrderConstant.REFUND_RECEIVE);

        if (!flag)
            return JSONObject.toJSONString(new ResultVO(Constant.REQUEST_FAILED, sessionVO.getToken()));

        MyOrder record = new MyOrder();
        record.setOrderId(myOrder.getOrderId());
        record.setOrderStatus(OrderConstant.ORDER_CLOSE);
        int result = orderMapper.updateByPrimaryKeySelective(record);

        if (result < 1)
            throw new RuntimeException(Constant.STR_ADD_FAILED);

        UMengUtil.sendUnicast(orderMapper.getDeviceToken(myOrder.getUserId()), PushMessageFactory.getInstance(mapper).get(PushMessageConstant.REFUSE_FINANCE_PASS));
        UMengUtil.sendUnicast(orderMapper.getSalesDeviceToken(myOrder.getUserId(), sessionVO.getMyTeamId()), PushMessageFactory.getInstance(mapper).get(PushMessageConstant.REFUSE_FINANCE_PASS));

        return JSONObject.toJSONString(new ResultVO(Constant.REQUEST_SUCCESS, sessionVO.getToken()));
    }

    @Override
    public String updateFinancePass(SessionVO sessionVO, MyOrder myOrder)
    {
        myOrder = orderMapper.selectByPrimaryKey(myOrder.getOrderId());

        boolean flagB = myOrder.getOrderStatus().equals(OrderConstant.WAITING_FINANCE_CHECK_B);
        flagB |= myOrder.getOrderStatus().equals(OrderConstant.FINANCE_CHECK_FAIL_B);
        boolean flagA = myOrder.getOrderStatus().equals(OrderConstant.WAITING_FINANCE_CHECK_A);
        flagA |= myOrder.getOrderStatus().equals(OrderConstant.FINANCE_CHECK_FAIL_A);

        if (flagA)
            return updateFinancePassA(sessionVO, myOrder);

        if (flagB)
            return updateFinancePassB(sessionVO, myOrder);

        return JSONObject.toJSONString(new ResultVO(Constant.REQUEST_FAILED, sessionVO.getToken()));
    }

    @Override
    public String updateFinanceFail(SessionVO sessionVO, MyOrder myOrder)
    {
        myOrder = orderMapper.selectByPrimaryKey(myOrder.getOrderId());

        boolean flagB = myOrder.getOrderStatus().equals(OrderConstant.WAITING_FINANCE_CHECK_B);

        boolean flagA = myOrder.getOrderStatus().equals(OrderConstant.WAITING_FINANCE_CHECK_A);

        if (flagA)
            return updateFinanceFailA(sessionVO, myOrder);

        if (flagB)
            return updateFinanceFailB(sessionVO, myOrder);

        return JSONObject.toJSONString(new ResultVO(Constant.REQUEST_FAILED, sessionVO.getToken()));
    }

    @Override
    public String listFinanceOrderByKeyword(SessionVO sessionVO, String keyword, PageVO pageVO)
    {
        int pageNum = PagingUtil.getStart(pageVO.getPageNum(), pageVO.getPageSize());
        int pageSize = pageVO.getPageSize();

        MyOrder myOrder = new MyOrder();
        myOrder.setStatusList(new ArrayList<>());
        myOrder.setKeyword(keyword);

        int pageCount = PagingUtil.getCount(orderMapper.countFinanceOrder(myOrder, sessionVO.getMyTeamId()), pageVO.getPageSize());
        List<MyOrder> result = orderMapper.listFinanceOrder(myOrder, sessionVO.getMyTeamId(), pageNum, pageSize);
        result = OrderUtil.getOrderList(result, orderMapper);
        result = OrderUtil.getOrderCount(result);

        JSONObject json = (JSONObject) JSONObject.toJSON(new ResultVO(Constant.REQUEST_SUCCESS, sessionVO.getToken(), result));
        json.put(KeyConstant.PAGE_COUNT, pageCount);

        return json.toJSONString();
    }

    @Override
    public String getFinanceOrder(SessionVO sessionVO, MyOrder myOrder)
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
        myOrder.setMerchandiserId(orderMapper.getMerchandiserId(myOrder.getUserId()));
        myOrder.setMerchandiserName(orderMapper.getUserName(myOrder.getMerchandiserId()));

        return JSONObject.toJSONString(new ResultVO(Constant.REQUEST_SUCCESS, sessionVO.getToken(), myOrder), SerializerFeature.WriteNullStringAsEmpty);
    }
}
