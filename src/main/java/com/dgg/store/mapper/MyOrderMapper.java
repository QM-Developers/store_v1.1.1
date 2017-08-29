package com.dgg.store.mapper;

import com.dgg.store.util.pojo.FreightTemp;
import com.dgg.store.util.pojo.MyOrder;
import com.dgg.store.util.pojo.MyOrderExample;

import java.util.List;

import com.dgg.store.util.vo.order.MyOrderListVO;
import org.apache.ibatis.annotations.Param;

public interface MyOrderMapper
{
    long countByExample(MyOrderExample example);

    int deleteByExample(MyOrderExample example);

    int deleteByPrimaryKey(String orderId);

    int insert(MyOrder record);

    int insertSelective(MyOrder record);

    List<MyOrder> selectByExampleWithBLOBs(MyOrderExample example);

    List<MyOrder> selectByExample(MyOrderExample example);

    MyOrder selectByPrimaryKey(String orderId);

    int updateByExampleSelective(@Param("record") MyOrder record, @Param("example") MyOrderExample example);

    int updateByExampleWithBLOBs(@Param("record") MyOrder record, @Param("example") MyOrderExample example);

    int updateByExample(@Param("record") MyOrder record, @Param("example") MyOrderExample example);

    int updateByPrimaryKeySelective(MyOrder record);

    int updateByPrimaryKeyWithBLOBs(MyOrder record);

    int updateByPrimaryKey(MyOrder record);

    int insertOrderList(MyOrderListVO orderList);

    MyOrderListVO getOrderList(@Param("standardId") String standardId);

    List<String> listImage(@Param("goodsId") String goodsId);

    List<MyOrderListVO> listOrderList(@Param("orderId") String orderId);

    String getImage(String imageId);

    int updateListByPrimaryKeySelective(MyOrderListVO myOrderList);

    List<FreightTemp> listFreightTemp(@Param("myTeamId") String myTeamId);

    int getCustomerRepertory(@Param("customerType") String customerType, @Param("myTeamId") String myTeamId);

    String getCustomerType(@Param("userId") String userId, @Param("myTeamId") String myTeamId);

    String getLatLng1(@Param("myTeamId") String myTeamId);

    String getLatLng2(@Param("userId") String userId, @Param("myTeamId") String myTeamId);

    int getGoodsRepertoryFirst(@Param("standardId") String standardId);

    int getGoodsRepertorySecond(@Param("standardId") String id, @Param("userId") String userId, @Param("myTeamId") String standardId);

    int updateRepertoryFirst(@Param("standardId") String standardId, @Param("repertory") int repertory);

    int updateRepertorySecond(@Param("userId") String userId, @Param("standardId") String standardId, @Param("repertory") int repertory);

    int countSalesOrder(@Param("order") MyOrder myOrder, @Param("userId") String userId);

    List<MyOrder> listSalesOrder(@Param("order") MyOrder myOrder, @Param("userId") String userId, @Param("pageNum") int pageNum, @Param("pageSize") int pageSize);

    List<MyOrder> listFinanceOrder(@Param("order") MyOrder myOrder, @Param("myTeamId") String myTeamId, @Param("pageNum") int pageNum, @Param("pageSize") int pageSize);

    int countFinanceOrder(@Param("order") MyOrder myOrder, @Param("myTeamId") String myTeamId);
}