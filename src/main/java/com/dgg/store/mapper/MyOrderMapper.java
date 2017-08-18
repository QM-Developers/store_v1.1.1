package com.dgg.store.mapper;

import com.dgg.store.util.pojo.MyOrder;
import com.dgg.store.util.pojo.MyOrderExample;
import java.util.List;

import com.dgg.store.util.vo.order.MyOrderListVO;
import org.apache.ibatis.annotations.Param;

public interface MyOrderMapper {
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
}