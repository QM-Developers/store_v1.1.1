package com.dgg.store.util.core.constant;

public class PushMessageConstant
{
    public static final String APPLY_NEW = "apply_new"; // 新的通用申请
    public static final String APPLY_PASS = "apply_pass";   // 通用申请通过
    public static final String APPLY_REFUSE = "apply_refuse";   // 通用申请不通过

    public static final String ORDER_SALES_NEW = "order_sales_new"; // 业务获得新的订单通知
    public static final String ORDER_FINANCE_NEW = "order_finance_new"; // 财务获得新的订单通知
    public static final String ORDER_SALES_REFUSE = "order_sales_refuse";   // 业务订单审核未通过
    public static final String ORDER_FINANCE_REFUSE = "order_finance_refuse";   // 财务订单审核未通过
    public static final String ORDER_SALES_PASS = "order_sales_pass";   // 业务订单审核通过
    public static final String ORDER_FINANCE_PASS = "order_finance_pass";   // 财务订单审核通过

    public static final String REFUSE_SALES_NEW = "refuse_sales_new";   // 业务获得新的退货订单
    public static final String REFUSE_SALES_PASS = "refuse_sales_pass"; // 退货订单审核通过
    public static final String REFUSE_FINANCE_NEW = "refuse_finance_new";   // 财务获得新的退款订单
    public static final String REFUSE_FINANCE_PASS = "refuse_finance_pass"; // 财务退款通过

    public static final String CUSTOMER_NEW = "customer_new";   // 收到客户建账申请
    public static final String CUSTOMER_PASS = "customer_pass"; // 建账申请通过
    public static final String CUSTOMER_REFUSE = "customer_refuse"; // 建账申请未通过

    public static final String REPERTORY_NEW = "repertory_new"; // 新的库存申请
    public static final String REPERTORY_PASS = "repertory_pass";   // 库存申请通过
    public static final String REPERTORY_REFUSE = "repertory_refuse";   // 库存申请未通过

    public static final String LOGOUT = "logout";   // 强制下线

}
