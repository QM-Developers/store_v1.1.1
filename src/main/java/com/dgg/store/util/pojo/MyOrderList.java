package com.dgg.store.util.pojo;

public class MyOrderList
{
    private String orderListId;

    private String orderId;

    private String goodsId;

    private Integer goodsNum;

    private Float price;

    private String goodsName;

    public String getOrderListId() {
        return orderListId;
    }

    public void setOrderListId(String orderListId) {
        this.orderListId = orderListId == null ? null : orderListId.trim();
    }

    public String getOrderId() {
        return orderId;
    }

    public void setOrderId(String orderId) {
        this.orderId = orderId == null ? null : orderId.trim();
    }

    public String getGoodsId() {
        return goodsId;
    }

    public void setGoodsId(String goodsId) {
        this.goodsId = goodsId == null ? null : goodsId.trim();
    }

    public Integer getGoodsNum() {
        return goodsNum;
    }

    public void setGoodsNum(Integer goodsNum) {
        this.goodsNum = goodsNum;
    }

    public Float getPrice() {
        return price;
    }

    public void setPrice(Float price) {
        this.price = price;
    }

    public String getGoodsName() {
        return goodsName;
    }

    public void setGoodsName(String goodsName) {
        this.goodsName = goodsName == null ? null : goodsName.trim();
    }
}