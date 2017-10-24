package com.dgg.store.util.core.constant;

public class OrderConstant
{

    public static final byte WAITING_FINANCE_CHECK_A = 90;  // 待财务审核（转账）
    public static final byte WAITING_FINANCE_CHECK_B = 91;  // 待财务审核（月结、到付）
    public static final byte WAITING_SALESMAN_CHECK = 92;   // 待跟单审核
    public static final byte WAITING_DELIVER = 101; // 待发货
    public static final byte ALREADY_DELIVERED = 102;    // 已发货
    //    public static final byte ALREADY_SIGN = 103;    // 已签收
    public static final byte FINANCE_CHECK_FAIL_A = 105;   // 财务审核不通过
    public static final byte FINANCE_CHECK_FAIL_B = 106;    // 财务审核不通过
    public static final byte ORDER_CLOSE = 107;    // 订单关闭
    public static final byte ORDER_SUCCESS = 108;    // 交易成功

    public static final byte ALREADY_PAY = 111; // 已付款
    public static final byte NOT_PAY = 112; // 未付款

    public static final byte REFUND_WAITING = 120;  // 申请退款，等待审核
    //    public static final byte REFUND_PASS = 121; // 退款审核通过
    public static final byte REFUND_GOODS = 122;    // 已退货
    public static final byte REFUND_RECEIVE = 123;  // 已收到退货

    public static final byte PAYMENT_TRANSFER = 10; // 转账
    public static final byte PAYMENT_MONTHLY = 20;  // 月结
    public static final byte PAYMENT_DESTINATION = 30;  // 到付

    public static final byte STATUS_CHECKING = 40;   // 待审批
    public static final byte STATUS_PAY = 41;   // 待付款
    public static final byte STATUS_RECEIVE = 42;   // 待收货
    public static final byte STATUS_SEND = 43;   // 待发货

    public static final int REPERTORY_NOT_ENOUGH = 3;   // 库存不足
    public static final int GOODS_NOT_FIND = 4; // 商品已下架
}
