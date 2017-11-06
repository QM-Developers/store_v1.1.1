package com.dgg.store.mapper;

import com.dgg.store.util.pojo.FreightTemp;
import com.dgg.store.util.pojo.MyOrder;
import com.dgg.store.util.pojo.MyOrderExample;

import java.util.List;

import com.dgg.store.util.vo.order.MyOrderListVO;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
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

    List<FreightTemp> listFreightTemp(@Param("myTeamId") String myTeamId,@Param("pageNum") int pageNum,@Param("pageSize") int pageSize);

    int getCustomerRepertory(@Param("customerType") String customerType, @Param("myTeamId") String myTeamId);

    String getCustomerType(@Param("userId") String userId, @Param("myTeamId") String myTeamId);

    String getLatLng1(@Param("myTeamId") String myTeamId);

    String getLatLng2(@Param("userId") String userId, @Param("myTeamId") String myTeamId);

    int getGoodsRepertoryFirst(@Param("standardId") String standardId, @Param("myTeamId") String myTeamId, @Param("branchType") byte branchType);

    int getGoodsRepertorySecond(@Param("standardId") String id, @Param("userId") String userId, @Param("myTeamId") String standardId);

    int updateRepertoryFirst(@Param("standardId") String standardId, @Param("repertory") int repertory);

    int updateRepertorySecond(@Param("userId") String userId, @Param("standardId") String standardId, @Param("repertory") int repertory);

    int countSalesOrder(@Param("order") MyOrder myOrder, @Param("userId") String userId);

    List<MyOrder> listSalesOrder(@Param("order") MyOrder myOrder, @Param("userId") String userId, @Param("pageNum") int pageNum, @Param("pageSize") int pageSize);

    List<MyOrder> listFinanceOrder(@Param("order") MyOrder myOrder, @Param("myTeamId") String myTeamId, @Param("pageNum") int pageNum, @Param("pageSize") int pageSize);

    int countFinanceOrder(@Param("order") MyOrder myOrder, @Param("myTeamId") String myTeamId);

    String getFinanceDeviceToken(@Param("myTeamId") String myTeamId, @Param("permissionId") String permissionId);

    String getSalesDeviceToken(@Param("userId") String userId, @Param("myTeamId") String myTeamId);

    String getDeviceToken(@Param("userId") String userId);

    int countOrderNumber(@Param("orderNumber") String orderNumber, @Param("myTeamId") String myTeamId);

    List<MyOrder> listFollowerOrder(@Param("order") MyOrder myOrder, @Param("userId") String userId, @Param("pageNum") int pageNum, @Param("pageSize") int pageSize);

    List<MyOrder> listSales(@Param("userId") String userId);

    int countFollowerOrder(@Param("order") MyOrder myOrder, @Param("userId") String userId);

    int countOrderSelectiveByManager(@Param("order") MyOrder myOrder, @Param("userId") String userId);

    List<MyOrder> listOrderSelectiveByManager(@Param("order") MyOrder myOrder, @Param("userId") String userId, @Param("pageNum") int pageNum, @Param("pageSize") int pageSize);

    int countGoodsStandard(@Param("standardId") String standardId);

    String getUserRole(String userId);

    String getFirstBranchId(@Param("myTeamId") String myTeamId, @Param("branchType") byte branchType);

    String getCurrentBranchId(String userId);

    int getBranchRepertory(@Param("branchId") String branchId, @Param("standardId") String standardId);

    int updateBranchRepertory(@Param("branchId") String branchId, @Param("standardId") String standardId, @Param("count") int repertory);

    String getCurrentBranchIdByCustomer(String userId);

    String getBranchLatLng(String branchId);

    String getMerchandiserId(String userId);

    String getUserName(String userId);

    String getPromoterId(String userId);

    int countFreightTemp(String myTeamId);

    String getGoodsType(String standardId);

    String getGoodsCode(String standardId);
}