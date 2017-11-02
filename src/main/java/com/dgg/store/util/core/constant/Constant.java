package com.dgg.store.util.core.constant;

public class Constant
{
    public static final int REQUEST_SUCCESS = 1;

    public static final int REQUEST_FAILED = 2;

    public static final int REQUEST_NOT_PERMISSION = 101;

    public static final String EMPTY = "";

    public static final int ZERO = 0;

    public static final String delimiterStr = "_#_";

    public static final int PATH_LEVEL = 2;

    /**
     * 权限分类
     */
    public static final String WORKER_PERMISSION = "worker_permission"; // 办事权
    public static final String PERSONAL_PERMISSION = "personal_permission"; // 人事权

    /**
     * 字符串常量
     */
    public static final String STR_CORPORATION_MANAGER = "总裁办";
    public static final String STR_COMPANY_MANAGER = "总经办";
    public static final String STR_COMPANY_PERSONNEL = "人事部";
    public static final String STR_COMPANY_BUSINESS = "业务部";
    public static final String STR_COMPANY_FINANCIAL = "财务部";
    public static final String STR_ADD_FAILED = "添加失败";

    /**
     * 登录信息的 session key
     */
    public static final String LOGININFO = "loginInfo";

    /**
     * md5 盐
     */
    public static final String SALT = "nx";


    /**
     * 团队类型
     */
    public static final String TEAM_TYPE_CORPORATION = "Corporation";   // 集团
    public static final String TEAM_TYPE_COMPANY = "Company";   // 公司

    /**
     * 部门类型
     */
//    public static final String DEPARTMENT_NORMAL = "normal";    // 普通部门
//    public static final String DEPARTMENT_PRESIDENT = "president";  // 总裁办
    public static final String DEPARTMENT_MANAGER = "manager";  // 总经办
//    public static final String DEPARTMENT_FINANCIAL = "financial";  // 财务部
//    public static final String DEPARTMENT_BUSINESS = "business";   // 业务部
//    public static final String DEPARTMENT_PERSONNEL = "personnel";   // 人事部

    /**
     * 用户状态码
     */
    public static final String USER_STATE_0 = "u_st_0"; // 用户刚建档状态
    public static final String USER_STATE_1 = "u_st_1"; // 用户刚建账状态
    public static final String USER_STATE_2 = "u_st_2"; // 用户已注册状态
    public static final String USER_STATE_3 = "u_st_3"; // 用户已冻结状态

    /**
     * 好友申请状态
     */
    public static final String FRIEND_REQUEST = "request";  // 请求添加
    public static final String FRIEND_AGREE = "agree";  // 同意添加
    public static final String FRIEND_NEGATIVE = "negative";    // 拒绝添加


    /**
     * 订单状态
     */
    public static final String WAITING_PAY = "order_st_waiting_pay";    // 新订单，等待付款
    public static final String WAITING_VERIFICATION = "order_st_checking";    // 付款完成，进入等待审核状态
    public static final String PASS_VERIFICATION = "order_st_pass";    // 通过审核
    public static final String WAITING_DELIVER = "order_st_waiting_deliver";    // 等待发货
    public static final String WAITING_ESTIMATE = "order_st_waiting_estimate";  // 等待评价
    public static final String ORDER_SUCCEEDED = "order_st_succeeded";    // 交易成功
    public static final String MULTIPART_FORM_DATA = "multipart/form-data";
}
