package com.dgg.store.dao.common;

import com.dgg.store.mapper.MyOrderMapper;
import com.dgg.store.util.pojo.FreightTemp;
import com.dgg.store.util.pojo.MyOrder;
import com.dgg.store.util.pojo.MyOrderExample;
import com.dgg.store.util.vo.order.MyOrderListVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class MyOrderDaoImpl implements MyOrderDao
{
    @Autowired
    private MyOrderMapper mapper;

    @Override
    public long countByExample(MyOrderExample example)
    {
        return mapper.countByExample(example);
    }

    @Override
    public int deleteByExample(MyOrderExample example)
    {
        return mapper.deleteByExample(example);
    }

    @Override
    public int deleteByPrimaryKey(String userPlaceId)
    {
        return mapper.deleteByPrimaryKey(userPlaceId);
    }

    @Override
    public int insert(MyOrder record)
    {
        return mapper.insert(record);
    }

    @Override
    public int insertSelective(MyOrder record)
    {
        return mapper.insertSelective(record);
    }

    @Override
    public List<MyOrder> selectByExample(MyOrderExample example)
    {
        return mapper.selectByExample(example);
    }

    @Override
    public MyOrder selectByPrimaryKey(String userPlaceId)
    {
        return mapper.selectByPrimaryKey(userPlaceId);
    }

    @Override
    public int updateByExampleSelective(MyOrder record, MyOrderExample example)
    {
        return mapper.updateByExampleSelective(record, example);
    }

    @Override
    public int updateByExample(MyOrder record, MyOrderExample example)
    {
        return mapper.updateByExample(record, example);
    }

    @Override
    public int updateByPrimaryKeySelective(MyOrder record)
    {
        return mapper.updateByPrimaryKeySelective(record);
    }

    @Override
    public int updateByPrimaryKey(MyOrder record)
    {
        return mapper.updateByPrimaryKey(record);
    }

    @Override
    public int insertOrderList(MyOrderListVO orderList)
    {
        return mapper.insertOrderList(orderList);
    }

    @Override
    public MyOrderListVO getOrderList(String standardId)
    {
        return mapper.getOrderList(standardId);
    }

    @Override
    public List<String> listImage(String goodsId)
    {
        return mapper.listImage(goodsId);
    }

    @Override
    public List<MyOrderListVO> listOrderList(String orderId)
    {
        return mapper.listOrderList(orderId);
    }

    @Override
    public String getImage(String imageId)
    {
        return mapper.getImage(imageId);
    }

    @Override
    public int updateListByPrimaryKeySelective(MyOrderListVO myOrderList)
    {
        return mapper.updateListByPrimaryKeySelective(myOrderList);
    }

    @Override
    public List<FreightTemp> listFreightTemp(String myTeamId)
    {
        return mapper.listFreightTemp(myTeamId);
    }

    @Override
    public int getCustomerRepertory(String customerType, String myTeamId)
    {
        return mapper.getCustomerRepertory(customerType, myTeamId);
    }

    @Override
    public String getCustomerType(String userId, String myTeamId)
    {
        return mapper.getCustomerType(userId, myTeamId);
    }

    @Override
    public String getLatLng1(String myTeamId)
    {
        return mapper.getLatLng1(myTeamId);
    }

    @Override
    public String getLatLng2(String userId, String myTeamId)
    {
        return mapper.getLatLng2(userId, myTeamId);
    }

    @Override
    public int getGoodsRepertoryFirst(String standardId, String myTeamId, byte branchType)
    {
        return mapper.getGoodsRepertoryFirst(standardId,myTeamId,branchType);
    }

    @Override
    public int getGoodsRepertorySecond(String standardId, String userId, String myTeamId)
    {
        return mapper.getGoodsRepertorySecond(standardId, userId, myTeamId);
    }

    @Override
    public int updateRepertoryFirst(String standardId, int repertory)
    {
        return mapper.updateRepertoryFirst(standardId, repertory);
    }

    @Override
    public int updateRepertorySecond(String userId, String standardId, int repertory)
    {
        return mapper.updateRepertorySecond(userId, standardId, repertory);
    }

    @Override
    public int countSalesOrder(MyOrder myOrder, String userId)
    {
        return mapper.countSalesOrder(myOrder, userId);
    }

    @Override
    public List<MyOrder> listSalesOrder(MyOrder myOrder, String userId, int pageNum, int pageSize)
    {
        return mapper.listSalesOrder(myOrder, userId, pageNum, pageSize);
    }

    @Override
    public int countFinanceOrder(MyOrder myOrder, String userId)
    {
        return mapper.countFinanceOrder(myOrder, userId);
    }

    @Override
    public List<MyOrder> listFinanceOrder(MyOrder myOrder, String myTeamId, int pageNum, int pageSize)
    {
        return mapper.listFinanceOrder(myOrder, myTeamId, pageNum, pageSize);
    }

    @Override
    public String getFinanceDeviceToken(String myTeamId, String permissionId)
    {
        return mapper.getFinanceDeviceToken(myTeamId, permissionId);
    }

    @Override
    public String getSalesDeviceToken(String userId, String myTeamId)
    {
        return mapper.getSalesDeviceToken(userId, myTeamId);
    }

    @Override
    public String getDeviceToken(String userId)
    {
        return mapper.getDeviceToken(userId);
    }

    @Override
    public int countOrderNumber(String number, String teamId)
    {
        return mapper.countOrderNumber(number, teamId);
    }

    @Override
    public List<MyOrder> listFollowerOrder(MyOrder myOrder, String userId, int pageNum, int pageSize)
    {
        return mapper.listFollowerOrder(myOrder, userId, pageNum, pageSize);
    }

    @Override
    public List<MyOrder> listSales(String userId)
    {
        return mapper.listSales(userId);
    }

    @Override
    public int countFollowerOrder(MyOrder myOrder, String userId)
    {
        return mapper.countFollowerOrder(myOrder,userId);
    }

    @Override
    public int countOrderSelectiveByManager(MyOrder myOrder, String userId)
    {
        return mapper.countOrderSelectiveByManager(myOrder,userId);
    }

    @Override
    public List<MyOrder> listOrderSelectiveByManager(MyOrder myOrder, String userId, int pageNum, int pageSize)
    {
        return mapper.listOrderSelectiveByManager(myOrder, userId, pageNum, pageSize);
    }

    @Override
    public int countGoodsStandard(String standardId)
    {
        return mapper.countGoodsStandard(standardId);
    }

    @Override
    public String getUserRole(String userId)
    {
        return mapper.getUserRole(userId);
    }

    @Override
    public String getFirstBranchId(String myTeamId, byte branchFirst)
    {
        return null;
    }

    @Override
    public String getCurrentBranchId(String userId)
    {
        return null;
    }

    @Override
    public int getBranchRepertory(String branchId)
    {
        return 0;
    }

    @Override
    public int updateBranchRepertory(String branchId, int repertory)
    {
        return 0;
    }

}
