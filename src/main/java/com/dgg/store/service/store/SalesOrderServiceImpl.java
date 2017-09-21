package com.dgg.store.service.store;

import com.alibaba.fastjson.JSONObject;
import com.dgg.store.dao.common.MyOrderDao;
import com.dgg.store.mapper.PushMessageMapper;
import com.dgg.store.util.core.constant.*;
import com.dgg.store.util.core.page.PagingUtil;
import com.dgg.store.util.core.umeng.push.PushMessageFactory;
import com.dgg.store.util.core.umeng.push.UMengUtil;
import com.dgg.store.util.pojo.MyOrder;
import com.dgg.store.util.pojo.MyOrderExample;
import com.dgg.store.util.vo.core.PageVO;
import com.dgg.store.util.vo.core.ResultVO;
import com.dgg.store.util.vo.core.SessionVO;
import com.dgg.store.util.vo.order.MyOrderListVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public class SalesOrderServiceImpl implements SalesOrderService
{
    @Autowired
    private MyOrderDao dao;

    @Autowired
    private PushMessageMapper mapper;

    @Override
    public String updateRefundReceive(SessionVO sessionVO, MyOrder myOrder)
    {
        myOrder = dao.selectByPrimaryKey(myOrder.getOrderId());

        boolean flag = myOrder.getOrderStatus().equals(OrderConstant.REFUND_GOODS);

        if (!flag)
            return JSONObject.toJSONString(new ResultVO(Constant.REQUEST_FAILED, sessionVO.getToken()));

        String customerType = dao.getCustomerType(myOrder.getUserId(), sessionVO.getMyTeamId());
        int repositoryLevel = dao.getCustomerRepertory(customerType, sessionVO.getMyTeamId());
        List<MyOrderListVO> orderList = dao.listOrderList(myOrder.getOrderId());
        orderList = listRepertory(repositoryLevel, orderList, myOrder, sessionVO);

        int repertory;
        int result;
        switch (repositoryLevel)
        {
            case CustomerConstant.REPERTORY_LEVEL1:
                for (MyOrderListVO vo : orderList)
                {
                    repertory = vo.getRepertory() + vo.getRefundNum();
                    result = dao.updateRepertoryFirst(vo.getStandardId(), repertory);
                    if (result < 1)
                        throw new RuntimeException(Constant.STR_ADD_FAILED);
                }
                break;
            case CustomerConstant.REPERTORY_LEVEL2:
                for (MyOrderListVO vo : orderList)
                {
                    repertory = vo.getRepertory() + vo.getRefundNum();
                    result = dao.updateRepertorySecond(sessionVO.getUserId(), vo.getStandardId(), repertory);
                    if (result < 1)
                        throw new RuntimeException(Constant.STR_ADD_FAILED);
                }
                break;
            default:
                break;
        }

        MyOrder record = new MyOrder();
        record.setOrderId(myOrder.getOrderId());
        record.setOrderStatus(OrderConstant.REFUND_RECEIVE);
        result = dao.updateByPrimaryKeySelective(record);

        if (result < 1)
            throw new RuntimeException(Constant.STR_ADD_FAILED);

        return JSONObject.toJSONString(new ResultVO(Constant.REQUEST_SUCCESS, sessionVO.getToken()));
    }

    @Override
    public String updateRefundPass(SessionVO sessionVO, MyOrder myOrder)
    {
        myOrder = dao.selectByPrimaryKey(myOrder.getOrderId());

        boolean flag = myOrder.getOrderStatus().equals(OrderConstant.REFUND_WAITING);

        if (!flag)
            return JSONObject.toJSONString(new ResultVO(Constant.REQUEST_FAILED, sessionVO.getToken()));

        MyOrder record = new MyOrder();
        record.setOrderId(myOrder.getOrderId());
        record.setOrderStatus(OrderConstant.REFUND_PASS);
        int result = dao.updateByPrimaryKeySelective(record);

        if (result < 1)
            throw new RuntimeException(Constant.STR_ADD_FAILED);

        UMengUtil.sendUnicast(dao.getDeviceToken(myOrder.getUserId()), PushMessageFactory.getInstance(mapper).get(PushMessageConstant.REFUSE_SALES_PASS));
        UMengUtil.sendUnicast(dao.getFinanceDeviceToken(sessionVO.getMyTeamId(), QMPermissionConstant.FINANCE_CHECK), PushMessageFactory.getInstance(mapper).get(PushMessageConstant.REFUSE_FINANCE_NEW));

        return JSONObject.toJSONString(new ResultVO(Constant.REQUEST_SUCCESS, sessionVO.getToken()));
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

    @Override
    public String updateFinancePassB(SessionVO sessionVO, MyOrder myOrder)
    {
        myOrder = dao.selectByPrimaryKey(myOrder.getOrderId());

        boolean flag = myOrder.getOrderStatus().equals(OrderConstant.ALREADY_SIGN);
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

        boolean flag = myOrder.getOrderStatus().equals(OrderConstant.ALREADY_SIGN);

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
    public String updateFinancePassA(SessionVO sessionVO, MyOrder myOrder)
    {
        myOrder = dao.selectByPrimaryKey(myOrder.getOrderId());

        boolean flag = myOrder.getOrderStatus().equals(OrderConstant.WAITING_CHECK);
        flag |= myOrder.getOrderStatus().equals(OrderConstant.FINANCE_CHECK_FAIL_A);
        flag &= myOrder.getPaymentStatus().equals(OrderConstant.NOT_PAY);
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

        boolean flag = myOrder.getOrderStatus().equals(OrderConstant.WAITING_CHECK);
        flag |= myOrder.getOrderStatus().equals(OrderConstant.FINANCE_CHECK_FAIL_A);
        flag &= myOrder.getPaymentStatus().equals(OrderConstant.NOT_PAY);
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
    public String updateSalesmanPass(SessionVO sessionVO, MyOrder myOrder)
    {
        myOrder = dao.selectByPrimaryKey(myOrder.getOrderId());

        boolean flag = myOrder.getOrderStatus().equals(OrderConstant.WAITING_CHECK);
        flag |= myOrder.getOrderStatus().equals(OrderConstant.WAITING_SALESMAN_CHECK);

        if (!flag)
            return JSONObject.toJSONString(new ResultVO(Constant.REQUEST_FAILED, sessionVO.getToken()));

        String customerType = dao.getCustomerType(myOrder.getUserId(), sessionVO.getMyTeamId());
        int repositoryLevel = dao.getCustomerRepertory(customerType, sessionVO.getMyTeamId());
        List<MyOrderListVO> orderList = dao.listOrderList(myOrder.getOrderId());
        orderList = listRepertory(repositoryLevel, orderList, myOrder, sessionVO);

        if (!hadEnoughRepertory(orderList))
            return JSONObject.toJSONString(new ResultVO(OrderConstant.REPERTORY_NOT_ENOUGH, sessionVO.getToken()));

        int repertory;
        int result;
        switch (repositoryLevel)
        {
            case CustomerConstant.REPERTORY_LEVEL1:
                for (MyOrderListVO vo : orderList)
                {
                    repertory = vo.getRepertory() - vo.getBuyNum();
                    result = dao.updateRepertoryFirst(vo.getStandardId(), repertory);
                    if (result < 1)
                        throw new RuntimeException(Constant.STR_ADD_FAILED);
                }
                break;
            case CustomerConstant.REPERTORY_LEVEL2:
                for (MyOrderListVO vo : orderList)
                {
                    repertory = vo.getRepertory() - vo.getBuyNum();
                    result = dao.updateRepertorySecond(sessionVO.getUserId(), vo.getStandardId(), repertory);
                    if (result < 1)
                        throw new RuntimeException(Constant.STR_ADD_FAILED);
                }
                break;
            default:
                break;
        }

        MyOrder record = new MyOrder();
        record.setOrderId(myOrder.getOrderId());
        record.setOrderStatus(OrderConstant.WAITING_DELIVER);

        result = dao.updateByPrimaryKeySelective(record);
        if (result < 1)
            throw new RuntimeException(Constant.STR_ADD_FAILED);

        UMengUtil.sendUnicast(dao.getDeviceToken(myOrder.getUserId()), PushMessageFactory.getInstance(mapper).get(PushMessageConstant.ORDER_SALES_PASS));

        return JSONObject.toJSONString(new ResultVO(Constant.REQUEST_SUCCESS, sessionVO.getToken()));
    }

    private boolean hadEnoughRepertory(List<MyOrderListVO> orderList)
    {
        for (MyOrderListVO vo : orderList)
            if (vo.getRepertory() < vo.getBuyNum())
                return false;
        return true;
    }

    private List<MyOrderListVO> listRepertory(int repositoryLevel, List<MyOrderListVO> orderList, MyOrder myOrder, SessionVO sessionVO)
    {
        switch (repositoryLevel)
        {
            case CustomerConstant.REPERTORY_LEVEL1:
                for (MyOrderListVO vo : orderList)
                    vo.setRepertory(dao.getGoodsRepertoryFirst(vo.getStandardId()));
                break;
            case CustomerConstant.REPERTORY_LEVEL2:
                for (MyOrderListVO vo : orderList)
                    vo.setRepertory(dao.getGoodsRepertorySecond(vo.getStandardId(), myOrder.getUserId(), sessionVO.getMyTeamId()));
                break;
            default:
                break;
        }
        return orderList;
    }


    @Override
    public String updateDelivered(SessionVO sessionVO, MyOrder myOrder)
    {
        myOrder = dao.selectByPrimaryKey(myOrder.getOrderId());

        boolean flag = myOrder.getOrderStatus().equals(OrderConstant.WAITING_DELIVER);

        if (!flag)
            return JSONObject.toJSONString(new ResultVO(Constant.REQUEST_FAILED, sessionVO.getToken()));

        MyOrder record = new MyOrder();
        record.setOrderId(myOrder.getOrderId());
        record.setOrderStatus(OrderConstant.ALREADY_DELIVERED);

        int result = dao.updateByPrimaryKeySelective(record);

        return JSONObject.toJSONString(new ResultVO(result < 1 ? 2 : 1, sessionVO.getToken()));
    }

    @Override
    public String listSalesOrderSelective(SessionVO sessionVO, MyOrder myOrder, PageVO pageVO)
    {
        int pageNum = PagingUtil.getStart(pageVO.getPageNum(), pageVO.getPageSize());
        int pageSize = pageVO.getPageSize();

        int pageCount = PagingUtil.getCount(dao.countSalesOrder(myOrder, sessionVO.getUserId()), pageVO.getPageSize());
        List<MyOrder> result = dao.listSalesOrder(myOrder, sessionVO.getUserId(), pageNum, pageSize);
        result = getOrderList(result);

        JSONObject json = (JSONObject) JSONObject.toJSON(new ResultVO(Constant.REQUEST_SUCCESS, sessionVO.getToken(), result));
        json.put(KeyConstant.PAGE_COUNT, pageCount);

        return json.toJSONString();
    }

    @Override
    public String listFinanceOrderSelective(SessionVO sessionVO, MyOrder myOrder, PageVO pageVO)
    {
        int pageNum = PagingUtil.getStart(pageVO.getPageNum(), pageVO.getPageSize());
        int pageSize = pageVO.getPageSize();

        int pageCount = PagingUtil.getCount(dao.countFinanceOrder(myOrder, sessionVO.getMyTeamId()), pageVO.getPageSize());
        List<MyOrder> result = dao.listFinanceOrder(myOrder, sessionVO.getMyTeamId(), pageNum, pageSize);
        result = getOrderList(result);

        JSONObject json = (JSONObject) JSONObject.toJSON(new ResultVO(Constant.REQUEST_SUCCESS, sessionVO.getToken(), result));
        json.put(KeyConstant.PAGE_COUNT, pageCount);

        return json.toJSONString();
    }

    @Override
    public String listSalesOrderByOrderNumber(SessionVO sessionVO, MyOrder myOrder)
    {
        MyOrderExample example = new MyOrderExample();
        MyOrderExample.Criteria criteria = example.createCriteria();

        criteria.andOrderNumberEqualTo(myOrder.getOrderNumber());

        List<MyOrder> result = dao.selectByExample(example);
        result = getOrderList(result);

        return JSONObject.toJSONString(new ResultVO(Constant.REQUEST_SUCCESS, sessionVO.getToken(), result));
    }

    private List<MyOrder> getOrderList(List<MyOrder> data)
    {
        List<MyOrderListVO> orderList = null;
        for (int i = 0; i < data.size(); i++)
        {
            orderList = dao.listOrderList(data.get(i).getOrderId());
            for (MyOrderListVO orderListVO : orderList)
                orderListVO.setGoodsImage(dao.getImage(orderListVO.getGoodsImage().split(SymbolConstant.REG_VERTICAL)[0]));
            data.get(i).setOrderList(orderList);
        }

        return data;
    }

}
