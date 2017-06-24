package com.dgg.store.util.vo.goods;

import java.util.Date;

public class MyOrderVO
{
    private String orderId;

    private String userId;

    private String orderStatus;

    private String recipient;

    private String contactNumber;

    private String address;

    private String remark;

    private String payment;

    private Date orderCreateDate;

    private Date orderSuccessDate;

    private String goodsList;

    public String getOrderId()
    {
        return orderId;
    }

    public void setOrderId(String orderId)
    {
        this.orderId = orderId;
    }

    public String getUserId()
    {
        return userId;
    }

    public void setUserId(String userId)
    {
        this.userId = userId;
    }

    public String getOrderStatus()
    {
        return orderStatus;
    }

    public void setOrderStatus(String orderStatus)
    {
        this.orderStatus = orderStatus;
    }

    public String getRecipient()
    {
        return recipient;
    }

    public void setRecipient(String recipient)
    {
        this.recipient = recipient;
    }

    public String getContactNumber()
    {
        return contactNumber;
    }

    public void setContactNumber(String contactNumber)
    {
        this.contactNumber = contactNumber;
    }

    public String getAddress()
    {
        return address;
    }

    public void setAddress(String address)
    {
        this.address = address;
    }

    public String getRemark()
    {
        return remark;
    }

    public void setRemark(String remark)
    {
        this.remark = remark;
    }

    public String getPayment()
    {
        return payment;
    }

    public void setPayment(String payment)
    {
        this.payment = payment;
    }

    public String getGoodsList()
    {
        return goodsList;
    }

    public void setGoodsList(String goodsList)
    {
        this.goodsList = goodsList;
    }

    public Date getOrderCreateDate()
    {
        return orderCreateDate;
    }

    public void setOrderCreateDate(Date orderCreateDate)
    {
        this.orderCreateDate = orderCreateDate;
    }

    public Date getOrderSuccessDate()
    {
        return orderSuccessDate;
    }

    public void setOrderSuccessDate(Date orderSuccessDate)
    {
        this.orderSuccessDate = orderSuccessDate;
    }
}
