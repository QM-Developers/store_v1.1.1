package com.dgg.store.dao.common;

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
}
