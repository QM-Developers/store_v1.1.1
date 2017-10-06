package com.dgg.store.util.core.constant;

public class OrderConstant
{
    public static final Byte WAITING_CHECK = 100;  // 待审核
    public static final Byte WAITING_DELIVER = 101; // 待发货
    public static final Byte ALREADY_DELIVERED = 102;    // 已发货
    public static final Byte ALREADY_SIGN = 103;    // 已签收
    public static final Byte WAITING_SALESMAN_CHECK = 104;   // 待业务审核
    public static final Byte FINANCE_CHECK_FAIL_A = 105;   // 财务审核不通过
    public static final Byte FINANCE_CHECK_FAIL_B = 106;    // 财务审核不通过
    public static final Byte ORDER_CLOSE = 107;    // 订单关闭
    public static final Byte ORDER_SUCCESS = 108;    // 交易成功

    public static final Byte ALREADY_PAY = 111; // 已付款
    public static final Byte NOT_PAY = 112; // 未付款

    public static final Byte REFUND_WAITING = 120;  // 申请退款，等待审核
    public static final Byte REFUND_PASS = 121; // 退款审核通过
    public static final Byte REFUND_GOODS = 122;    // 已退货
    public static final Byte REFUND_RECEIVE = 123;  // 已收到退货

    public static final byte PAYMENT_TRANSFER = 10; // 转账
    public static final byte PAYMENT_MONTHLY = 20;  // 月结
    public static final byte PAYMENT_DESTINATION = 30;  // 到付

    public static final Integer REPERTORY_NOT_ENOUGH = 3;
}
