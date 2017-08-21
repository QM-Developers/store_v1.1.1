package com.dgg.store.dao.common;

import com.dgg.store.mapper.MyOrderMapper;
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

}
