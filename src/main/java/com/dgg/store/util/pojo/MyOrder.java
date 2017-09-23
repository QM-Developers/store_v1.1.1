package com.dgg.store.util.pojo;

import com.dgg.store.util.vo.order.MyOrderListVO;

import java.util.Date;
import java.util.List;

public class MyOrder {
    private String myTeamId;

    private String memberId;

    private String orderId;

    private Byte orderStatus;

    private Byte orderStatusBefore;

    private String userId;

    private String userName;

    private String sellerMessage;

    private String buyerMessage;

    private String refundMessage;

    private Float freight;

    private Byte paymentType;

    private Byte paymentStatus;

    private String shoppingAddress;

    private String logisticsStatus;

    private Date createDate;

    private Date refundDate;

    private Date finishDate;

    private String orderNumber;

    private List<MyOrderListVO> orderList;

    private String goods;

    public String getOrderId() {
        return orderId;
    }

    public void setOrderId(String orderId) {
        this.orderId = orderId == null ? null : orderId.trim();
    }

    public Byte getOrderStatus() {
        return orderStatus;
    }

    public void setOrderStatus(Byte orderStatus) {
        this.orderStatus = orderStatus;
    }

    public Byte getOrderStatusBefore() {
        return orderStatusBefore;
    }

    public void setOrderStatusBefore(Byte orderStatusBefore) {
        this.orderStatusBefore = orderStatusBefore;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId == null ? null : userId.trim();
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName == null ? null : userName.trim();
    }

    public String getSellerMessage() {
        return sellerMessage;
    }

    public void setSellerMessage(String sellerMessage) {
        this.sellerMessage = sellerMessage == null ? null : sellerMessage.trim();
    }

    public String getBuyerMessage() {
        return buyerMessage;
    }

    public void setBuyerMessage(String buyerMessage) {
        this.buyerMessage = buyerMessage == null ? null : buyerMessage.trim();
    }

    public String getRefundMessage() {
        return refundMessage;
    }

    public void setRefundMessage(String refundMessage) {
        this.refundMessage = refundMessage == null ? null : refundMessage.trim();
    }

    public Float getFreight() {
        return freight;
    }

    public void setFreight(Float freight) {
        this.freight = freight;
    }

    public Byte getPaymentType() {
        return paymentType;
    }

    public void setPaymentType(Byte paymentType) {
        this.paymentType = paymentType;
    }

    public Byte getPaymentStatus() {
        return paymentStatus;
    }

    public void setPaymentStatus(Byte paymentStatus) {
        this.paymentStatus = paymentStatus;
    }

    public String getShoppingAddress() {
        return shoppingAddress;
    }

    public void setShoppingAddress(String shoppingAddress) {
        this.shoppingAddress = shoppingAddress == null ? null : shoppingAddress.trim();
    }

    public String getLogisticsStatus() {
        return logisticsStatus;
    }

    public void setLogisticsStatus(String logisticsStatus) {
        this.logisticsStatus = logisticsStatus == null ? null : logisticsStatus.trim();
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public Date getRefundDate() {
        return refundDate;
    }

    public void setRefundDate(Date refundDate) {
        this.refundDate = refundDate;
    }

    public Date getFinishDate() {
        return finishDate;
    }

    public void setFinishDate(Date finishDate) {
        this.finishDate = finishDate;
    }

    public String getOrderNumber() {
        return orderNumber;
    }

    public void setOrderNumber(String orderNumber) {
        this.orderNumber = orderNumber == null ? null : orderNumber.trim();
    }

    public void setOrderList(List<MyOrderListVO> orderList)
    {
        this.orderList = orderList;
    }

    public List<MyOrderListVO> getOrderList()
    {
        return orderList;
    }

    public String getGoods()
    {
        return goods;
    }

    public void setGoods(String goods)
    {
        this.goods = goods;
    }

    public String getMemberId()
    {
        return memberId;
    }

    public void setMemberId(String memberId)
    {
        this.memberId = memberId;
    }

    public String getMyTeamId()
    {
        return myTeamId;
    }

    public void setMyTeamId(String myTeamId)
    {
        this.myTeamId = myTeamId;
    }
}