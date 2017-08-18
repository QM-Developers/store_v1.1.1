package com.dgg.store.util.core.constant;

public class OrderConstant
{
    public static final Byte WAITING_CHECK = 100;  // 待审核
    public static final Byte WAITING_DELIVER = 101; // 待发货
    public static final Byte ALREADY_DELIVERED = 102;    // 已发货
    public static final Byte ALREADY_SIGN = 103;    // 已签收
    public static final Byte WAITING_SALESMAN_CHECK = 104;   // 待财务审核
    public static final Byte WAITING_FINANCE_CHECK_B = 105;   // 待财务审核
    public static final Byte FINANCE_CHECK_FAIL_A = 106;   // 待财务审核
    public static final Byte ORDER_CLOSE = 106;    // 订单关闭
    public static final Byte ORDER_SUCCESS = 107;    // 交易成功

    public static final Byte ALREADY_PAY = 111;
    public static final Byte NOT_PAY = 112;

    public static final Byte WAITING_REFUND = 120;

    public static final Byte PAYMENT_TRANSFER = 10; // 转账
    public static final Byte PAYMENT_MONTHLY = 20;  // 月结
    public static final Byte PAYMENT_DESTINATION = 30;  // 到付

}
