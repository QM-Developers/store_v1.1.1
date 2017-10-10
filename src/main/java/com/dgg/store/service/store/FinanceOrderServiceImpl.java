package com.dgg.store.service.store;

import com.alibaba.fastjson.JSONObject;
import com.dgg.store.dao.common.MyOrderDao;
import com.dgg.store.mapper.PushMessageMapper;
import com.dgg.store.util.core.OrderUtil;
import com.dgg.store.util.core.constant.*;
import com.dgg.store.util.core.page.PagingUtil;
import com.dgg.store.util.core.umeng.push.PushMessageFactory;
import com.dgg.store.util.core.umeng.push.UMengUtil;
import com.dgg.store.util.pojo.MyOrder;
import com.dgg.store.util.vo.core.PageVO;
import com.dgg.store.util.vo.core.ResultVO;
import com.dgg.store.util.vo.core.SessionVO;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public class FinanceOrderServiceImpl implements FinanceOrderService
{
    private final MyOrderDao dao;
    private final PushMessageMapper mapper;

    public FinanceOrderServiceImpl(MyOrderDao dao, PushMessageMapper mapper)
    {
        this.dao = dao;
        this.mapper = mapper;
    }

    @Override
    public String listFinanceOrderSelective(SessionVO sessionVO, MyOrder myOrder, PageVO pageVO)
    {
        int pageNum = PagingUtil.getStart(pageVO.getPageNum(), pageVO.getPageSize());
        int pageSize = pageVO.getPageSize();

        int pageCount = PagingUtil.getCount(dao.countFinanceOrder(myOrder, sessionVO.getMyTeamId()), pageVO.getPageSize());
        List<MyOrder> result = dao.listFinanceOrder(myOrder, sessionVO.getMyTeamId(), pageNum, pageSize);
        result = OrderUtil.getOrderList(result,dao);
        result = OrderUtil.getOrderCount(result);

        JSONObject json = (JSONObject) JSONObject.toJSON(new ResultVO(Constant.REQUEST_SUCCESS, sessionVO.getToken(), result));
        json.put(KeyConstant.PAGE_COUNT, pageCount);

        return json.toJSONString();
    }

    @Override
    public String updateFinancePassA(SessionVO sessionVO, MyOrder myOrder)
    {
        myOrder = dao.selectByPrimaryKey(myOrder.getOrderId());

        boolean flag = myOrder.getOrderStatus().equals(OrderConstant.WAITING_FINANCE_CHECK_A);
        flag |= myOrder.getOrderStatus().equals(OrderConstant.FINANCE_CHECK_FAIL_A);
        flag &= myOrder.getPaymentType().equals(OrderConstant.PAYMENT_TRANSFER);
        if (!flag)
            return JSONObject.toJSONString(new ResultVO(Constant.REQUEST_FAILED, sessionVO.getToken()));

        MyOrder record = new MyOrder();
        record.setOrderId(myOrder.getOrderId());
        record.setPaymentStatus(OrderConstant.ALREADY_PAY);
        record.setOrderStatus(OrderConstant.WAITING_SALESMAN_CHECK);

        int result = dao.updateByPrimaryKeySelective(record);

        UMengUtil.sendUnicast(dao.getDeviceToken(myOrder.getUserId()), PushMessageFactory.getInstance(mapper).get(PushMessageConstant.ORDER_FINANCE_PASS));
        UMengUtil.sendUnicast(dao.getSalesDeviceToken(myOrder.getUserId(), sessionVO.getMyTeamId()), PushMessageFactory.getInstance(mapper).get(PushMessageConstant.ORDER_FINANCE_PASS));

        return JSONObject.toJSONString(new ResultVO(result < 1 ? 2 : 1, sessionVO.getToken()));
    }

    @Override
    public String updateFinanceFailA(SessionVO sessionVO, MyOrder myOrder)
    {
        myOrder = dao.selectByPrimaryKey(myOrder.getOrderId());

        boolean flag = myOrder.getOrderStatus().equals(OrderConstant.WAITING_FINANCE_CHECK_A);
        flag |= myOrder.getOrderStatus().equals(OrderConstant.FINANCE_CHECK_FAIL_A);
        flag &= myOrder.getPaymentType().equals(OrderConstant.PAYMENT_TRANSFER);
        if (!flag)
            return JSONObject.toJSONString(new ResultVO(Constant.REQUEST_FAILED, sessionVO.getToken()));

        MyOrder record = new MyOrder();
        record.setOrderId(myOrder.getOrderId());
        record.setOrderStatus(OrderConstant.FINANCE_CHECK_FAIL_A);

        int result = dao.updateByPrimaryKeySelective(record);

        UMengUtil.sendUnicast(dao.getDeviceToken(myOrder.getUserId()), PushMessageFactory.getInstance(mapper).get(PushMessageConstant.ORDER_FINANCE_REFUSE));
        UMengUtil.sendUnicast(dao.getSalesDeviceToken(myOrder.getUserId(), sessionVO.getMyTeamId()), PushMessageFactory.getInstance(mapper).get(PushMessageConstant.ORDER_FINANCE_REFUSE));

        return JSONObject.toJSONString(new ResultVO(result < 1 ? 2 : 1, sessionVO.getToken()));
    }

    @Override
    public String updateFinancePassB(SessionVO sessionVO, MyOrder myOrder)
    {
        myOrder = dao.selectByPrimaryKey(myOrder.getOrderId());

        boolean flag = myOrder.getOrderStatus().equals(OrderConstant.WAITING_FINANCE_CHECK_B);
        flag |= myOrder.getOrderStatus().equals(OrderConstant.FINANCE_CHECK_FAIL_B);

        if (!flag)
            return JSONObject.toJSONString(new ResultVO(Constant.REQUEST_FAILED, sessionVO.getToken()));

        MyOrder record = new MyOrder();
        record.setOrderId(myOrder.getOrderId());
        record.setOrderStatus(OrderConstant.ORDER_SUCCESS);
        record.setFinishDate(new Date());

        int result = dao.updateByPrimaryKeySelective(record);

        UMengUtil.sendUnicast(dao.getDeviceToken(myOrder.getUserId()), PushMessageFactory.getInstance(mapper).get(PushMessageConstant.ORDER_FINANCE_PASS));
        UMengUtil.sendUnicast(dao.getSalesDeviceToken(myOrder.getUserId(), sessionVO.getMyTeamId()), PushMessageFactory.getInstance(mapper).get(PushMessageConstant.ORDER_FINANCE_PASS));

        return JSONObject.toJSONString(new ResultVO(result < 1 ? 2 : 1, sessionVO.getToken()));
    }

    @Override
    public String updateFinanceFailB(SessionVO sessionVO, MyOrder myOrder)
    {
        myOrder = dao.selectByPrimaryKey(myOrder.getOrderId());

        boolean flag = myOrder.getOrderStatus().equals(OrderConstant.WAITING_FINANCE_CHECK_B);

        if (!flag)
            return JSONObject.toJSONString(new ResultVO(Constant.REQUEST_FAILED, sessionVO.getToken()));

        MyOrder record = new MyOrder();
        record.setOrderId(myOrder.getOrderId());
        record.setOrderStatus(OrderConstant.FINANCE_CHECK_FAIL_B);

        int result = dao.updateByPrimaryKeySelective(record);

        UMengUtil.sendUnicast(dao.getDeviceToken(myOrder.getUserId()), PushMessageFactory.getInstance(mapper).get(PushMessageConstant.ORDER_FINANCE_REFUSE));
        UMengUtil.sendUnicast(dao.getSalesDeviceToken(myOrder.getUserId(), sessionVO.getMyTeamId()), PushMessageFactory.getInstance(mapper).get(PushMessageConstant.ORDER_FINANCE_REFUSE));

        return JSONObject.toJSONString(new ResultVO(result < 1 ? 2 : 1, sessionVO.getToken()));
    }

    @Override
    public String updateRefundMoney(SessionVO sessionVO, MyOrder myOrder)
    {
        myOrder = dao.selectByPrimaryKey(myOrder.getOrderId());

        boolean flag = myOrder.getOrderStatus().equals(OrderConstant.REFUND_RECEIVE);

        if (!flag)
            return JSONObject.toJSONString(new ResultVO(Constant.REQUEST_FAILED, sessionVO.getToken()));

        MyOrder record = new MyOrder();
        record.setOrderId(myOrder.getOrderId());
        record.setOrderStatus(OrderConstant.ORDER_CLOSE);
        int result = dao.updateByPrimaryKeySelective(record);

        if (result < 1)
            throw new RuntimeException(Constant.STR_ADD_FAILED);

        UMengUtil.sendUnicast(dao.getDeviceToken(myOrder.getUserId()), PushMessageFactory.getInstance(mapper).get(PushMessageConstant.REFUSE_FINANCE_PASS));
        UMengUtil.sendUnicast(dao.getSalesDeviceToken(myOrder.getUserId(), sessionVO.getMyTeamId()), PushMessageFactory.getInstance(mapper).get(PushMessageConstant.REFUSE_FINANCE_PASS));

        return JSONObject.toJSONString(new ResultVO(Constant.REQUEST_SUCCESS, sessionVO.getToken()));
    }
}
