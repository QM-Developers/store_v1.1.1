package com.dgg.store.service.store;

import com.alibaba.fastjson.JSONObject;
import com.dgg.store.mapper.MyOrderMapper;
import com.dgg.store.mapper.PushMessageMapper;
import com.dgg.store.util.core.OrderUtil;
import com.dgg.store.util.core.constant.*;
import com.dgg.store.util.core.page.PagingUtil;
import com.dgg.store.util.core.parameter.ParameterUtil;
import com.dgg.store.util.core.umeng.push.PushMessageFactory;
import com.dgg.store.util.core.umeng.push.UMengUtil;
import com.dgg.store.util.pojo.MyOrder;
import com.dgg.store.util.vo.core.PageVO;
import com.dgg.store.util.vo.core.ResultVO;
import com.dgg.store.util.vo.core.SessionVO;
import com.dgg.store.util.vo.order.MyOrderListVO;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class FollowerOrderServiceImpl implements FollowerOrderService
{
    private final MyOrderMapper orderMapper;
    private final PushMessageMapper pushMapper;

    public FollowerOrderServiceImpl(MyOrderMapper orderMapper, PushMessageMapper pushMapper)
    {
        this.orderMapper = orderMapper;
        this.pushMapper = pushMapper;
    }

    @Override
    public String updateRefundReceive(SessionVO sessionVO, MyOrder myOrder)
    {
        myOrder = orderMapper.selectByPrimaryKey(myOrder.getOrderId());

        boolean flag = myOrder.getOrderStatus().equals(OrderConstant.REFUND_GOODS);

        if (!flag)
            return JSONObject.toJSONString(new ResultVO(Constant.REQUEST_FAILED, sessionVO.getToken()));

        String customerType = orderMapper.getCustomerType(myOrder.getUserId(), sessionVO.getMyTeamId());
        int repositoryLevel = orderMapper.getCustomerRepertory(customerType, sessionVO.getMyTeamId());
        List<MyOrderListVO> orderList = orderMapper.listOrderList(myOrder.getOrderId());
        orderList = listRepertory(repositoryLevel, orderList, myOrder, sessionVO);

        int repertory;
        int result;
        switch (repositoryLevel)
        {
            case CustomerConstant.REPERTORY_LEVEL1:
                for (MyOrderListVO vo : orderList)
                {
                    repertory = vo.getRepertory() + vo.getRefundNum();
                    result = orderMapper.updateRepertoryFirst(vo.getStandardId(), repertory);
                    if (result < 1)
                        throw new RuntimeException(Constant.STR_ADD_FAILED);
                }
                break;
            case CustomerConstant.REPERTORY_LEVEL2:
                for (MyOrderListVO vo : orderList)
                {
                    repertory = vo.getRepertory() + vo.getRefundNum();
                    result = orderMapper.updateRepertorySecond(sessionVO.getUserId(), vo.getStandardId(), repertory);
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
        result = orderMapper.updateByPrimaryKeySelective(record);

        if (result < 1)
            throw new RuntimeException(Constant.STR_ADD_FAILED);

        return JSONObject.toJSONString(new ResultVO(Constant.REQUEST_SUCCESS, sessionVO.getToken()));
    }

    @Override
    public String updateRefundPass(SessionVO sessionVO, MyOrder myOrder)
    {
        myOrder = orderMapper.selectByPrimaryKey(myOrder.getOrderId());

        boolean flag = myOrder.getOrderStatus().equals(OrderConstant.REFUND_WAITING);

        if (!flag)
            return JSONObject.toJSONString(new ResultVO(Constant.REQUEST_FAILED, sessionVO.getToken()));

        MyOrder record = new MyOrder();
        record.setOrderId(myOrder.getOrderId());
        record.setOrderStatus(OrderConstant.REFUND_GOODS);
        int result = orderMapper.updateByPrimaryKeySelective(record);

        if (result < 1)
            throw new RuntimeException(Constant.STR_ADD_FAILED);

        UMengUtil.sendUnicast(orderMapper.getDeviceToken(myOrder.getUserId()), PushMessageFactory.getInstance(pushMapper).get(PushMessageConstant.REFUSE_SALES_PASS));
        UMengUtil.sendUnicast(orderMapper.getFinanceDeviceToken(sessionVO.getMyTeamId(), QMPermissionConstant.FINANCE_CHECK), PushMessageFactory.getInstance(pushMapper).get(PushMessageConstant.REFUSE_FINANCE_NEW));

        return JSONObject.toJSONString(new ResultVO(Constant.REQUEST_SUCCESS, sessionVO.getToken()));
    }


    @Override
    public String updateSalesmanPass(SessionVO sessionVO, MyOrder myOrder)
    {
        myOrder = orderMapper.selectByPrimaryKey(myOrder.getOrderId());

        boolean flag = myOrder.getOrderStatus().equals(OrderConstant.WAITING_SALESMAN_CHECK);

        if (!flag)
            return JSONObject.toJSONString(new ResultVO(Constant.REQUEST_FAILED, sessionVO.getToken()));

        String customerType = orderMapper.getCustomerType(myOrder.getUserId(), sessionVO.getMyTeamId());
        int repositoryLevel = orderMapper.getCustomerRepertory(customerType, sessionVO.getMyTeamId());

        String branchId;
        if (repositoryLevel == CustomerConstant.REPERTORY_LEVEL1)
            branchId = orderMapper.getFirstBranchId(sessionVO.getMyTeamId(), BranchConstant.BRANCH_FIRST);
        else
            branchId = orderMapper.getCurrentBranchId(sessionVO.getUserId());

        List<MyOrderListVO> orderList = orderMapper.listOrderList(myOrder.getOrderId());
        for (MyOrderListVO vo : orderList)
            vo.setRepertory(orderMapper.getBranchRepertory(branchId, vo.getStandardId()));

        if (!hadEnoughRepertory(orderList))
            return JSONObject.toJSONString(new ResultVO(OrderConstant.REPERTORY_NOT_ENOUGH, sessionVO.getToken()));

        for (MyOrderListVO vo : orderList)
            if (orderMapper.updateBranchRepertory(branchId, vo.getStandardId(), vo.getRepertory() - vo.getBuyNum()) < 1)
                throw new RuntimeException(Constant.STR_ADD_FAILED);

        MyOrder record = new MyOrder();
        record.setOrderId(myOrder.getOrderId());
        record.setOrderStatus(OrderConstant.WAITING_DELIVER);

        if (orderMapper.updateByPrimaryKeySelective(record) < 1)
            throw new RuntimeException(Constant.STR_ADD_FAILED);

        UMengUtil.sendUnicast(orderMapper.getDeviceToken(myOrder.getUserId()), PushMessageFactory.getInstance(pushMapper).get(PushMessageConstant.ORDER_SALES_PASS));

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
                    vo.setRepertory(orderMapper.getGoodsRepertoryFirst(vo.getStandardId(), sessionVO.getMyTeamId(), BranchConstant.BRANCH_FIRST));
                break;
            case CustomerConstant.REPERTORY_LEVEL2:
                for (MyOrderListVO vo : orderList)
                    vo.setRepertory(orderMapper.getGoodsRepertorySecond(vo.getStandardId(), myOrder.getUserId(), sessionVO.getMyTeamId()));
                break;
            default:
                break;
        }
        return orderList;
    }


    @Override
    public String updateDelivered(SessionVO sessionVO, MyOrder myOrder)
    {
        myOrder = orderMapper.selectByPrimaryKey(myOrder.getOrderId());

        boolean flag = myOrder.getOrderStatus().equals(OrderConstant.WAITING_DELIVER);

        if (!flag)
            return JSONObject.toJSONString(new ResultVO(Constant.REQUEST_FAILED, sessionVO.getToken()));

        MyOrder record = new MyOrder();
        record.setOrderId(myOrder.getOrderId());
        record.setOrderStatus(OrderConstant.ALREADY_DELIVERED);

        int result = orderMapper.updateByPrimaryKeySelective(record);

        return JSONObject.toJSONString(new ResultVO(result < 1 ? 2 : 1, sessionVO.getToken()));
    }

    @Override
    public String listFollowerOrderSelective(SessionVO sessionVO, MyOrder myOrder, PageVO pageVO)
    {
        if (ParameterUtil.objectIsNull(pageVO))
            return JSONObject.toJSONString(new ResultVO(Constant.REQUEST_FAILED, sessionVO.getToken()));

        int pageNum = PagingUtil.getStart(pageVO.getPageNum(), pageVO.getPageSize());
        int pageSize = pageVO.getPageSize();

        myOrder.setStatusList(OrderUtil.getOrderStatus(myOrder.getOrderStatus()));

        int pageCount = PagingUtil.getCount(orderMapper.countFollowerOrder(myOrder, sessionVO.getUserId()), pageVO.getPageSize());
        List<MyOrder> result = orderMapper.listFollowerOrder(myOrder, sessionVO.getUserId(), pageNum, pageSize);
        result = OrderUtil.getOrderList(result, orderMapper);
        result = OrderUtil.getOrderCount(result);

        JSONObject json = (JSONObject) JSONObject.toJSON(new ResultVO(Constant.REQUEST_SUCCESS, sessionVO.getToken(), result));
        json.put(KeyConstant.PAGE_COUNT, pageCount);

        return json.toJSONString();
    }
}
