package com.dgg.store.dao.common;

import com.dgg.store.util.pojo.FreightTemp;
import com.dgg.store.util.pojo.MyOrder;
import com.dgg.store.util.pojo.MyOrderExample;
import com.dgg.store.util.vo.order.MyOrderListVO;

import java.util.List;

public interface MyOrderDao
{
    long countByExample(MyOrderExample example);

    int deleteByExample(MyOrderExample example);

    int deleteByPrimaryKey(String orderId);

    int insert(MyOrder record);

    int insertSelective(MyOrder record);

    List<MyOrder> selectByExample(MyOrderExample example);

    MyOrder selectByPrimaryKey(String orderId);

    int updateByExampleSelective(MyOrder record, MyOrderExample example);

    int updateByExample(MyOrder record, MyOrderExample example);

    int updateByPrimaryKeySelective(MyOrder record);

    int updateByPrimaryKey(MyOrder record);

    int insertOrderList(MyOrderListVO orderList);

    MyOrderListVO getOrderList(String standardId);

    List<String> listImage(String goodsId);

    List<MyOrderListVO> listOrderList(String orderId);

    String getImage(String imageId);

    int updateListByPrimaryKeySelective(MyOrderListVO myOrderList);

    List<FreightTemp> listFreightTemp(String myTeamId);

    int getCustomerRepertory(String customerType, String myTeamId);

    String getCustomerType(String userId, String myTeamId);

    String getLatLng1(String myTeamId);

    String getLatLng2(String userId, String myTeamId);

    int getGoodsRepertoryFirst(String standardId);

    int getGoodsRepertorySecond(String standardId, String userId, String myTeamId);

    int updateRepertoryFirst(String standardId, int repertory);

    int updateRepertorySecond(String userId , String standardId, int repertory);

    int countSalesOrder(MyOrder myOrder, String userId);

    List<MyOrder> listSalesOrder(MyOrder myOrder, String userId, int pageNum, int pageSize);

    int countFinanceOrder(MyOrder myOrder, String myTeamId);

    List<MyOrder> listFinanceOrder(MyOrder myOrder, String myTeamId, int pageNum, int pageSize);

    String getFinanceDeviceToken(String myTeamId, String permissionId);

    String getSalesDeviceToken(String userId, String myTeamId);

    String getDeviceToken(String userId);

    int countOrderNumber(String number, String teamId);

    List<MyOrder> listFollowerOrder(MyOrder myOrder, String userId, int pageNum, int pageSize);

    List<MyOrder> listSales(String userId);

    int countFollowerOrder(MyOrder myOrder, String userId);

    int countOrderSelectiveByManager(MyOrder myOrder, String userId);

    List<MyOrder> listOrderSelectiveByManager(MyOrder myOrder, String userId, int pageNum, int pageSize);
}
