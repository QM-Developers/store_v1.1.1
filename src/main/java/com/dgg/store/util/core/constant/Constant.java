package com.dgg.store.util.core.constant;

import java.io.IOException;
import java.util.Properties;

public class Constant
{
    public static final String EMPTY = "";
    public static final String STRING_45 = "-";

    public static final String delimiterStr = "_#_";

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
     * 角色 id
     */
    public static final String ROLE_DEFAULT_USER = "1001";  // 普通用户
    public static final String ROLE_MANAGER = "1002";   // 超级管理员
    public static final String ROLE_TEAM_PERSONAL = "1003"; // 普通员工
    public static final String ROLE_TEAM_PRESIDENT = "1004";  // 集团总裁
    public static final String ROLE_TEAM_COMPANY_MANAGER = "1005";   // 公司经理
    public static final String ROLE_TEAM_DEPARTMENT_MANAGER = "1006"; // 部门主管

    /**
     * 团队类型
     */
    public static final String TEAM_TYPE_CORPORATION = "Corporation";   // 集团
    public static final String TEAM_TYPE_COMPANY = "Company";   // 公司

    /**
     * 部门类型
     */
    public static final String DEPARTMENT_NORMAL = "normal";    // 普通部门
    public static final String DEPARTMENT_PRESIDENT = "president";  // 总裁办
    public static final String DEPARTMENT_MANAGER = "manager";  // 总经办
    public static final String DEPARTMENT_FINANCIAL = "financial";  // 财务部
    public static final String DEPARTMENT_BUSINESS = "business";   // 业务部
    public static final String DEPARTMENT_PERSONNEL = "personnel";   // 人事部

    /**
     * 用户状态码
     */
    public static final String USERST_0 = "u_st_0"; // 用户刚建档状态
    public static final String USERST_1 = "u_st_1"; // 用户刚建账状态
    public static final String USERST_2 = "u_st_2"; // 用户已注册状态

    /**
     * 好友申请状态
     */
    public static final String FRIEND_REQUEST = "request";  // 请求添加
    public static final String FRIEND_AGREE = "agree";  // 同意添加
    public static final String FRIEND_NEGATIVE = "negative";    // 拒绝添加


    /**
     * 用户图片上传路径
     */
    public static final String USER_PLACE_IMG_PATH; // 用户场地图片路径
    public static final String USER_PERSONAL_INFO_IMG_PATH; // 用户个人信息图片路径
    public static final String USER_HEAD_PORTRAIT_IMG_PATH; // 用户头像图片路径
    public static final String USER_IMAGE_SPACE_PATH;   // 用户图片空间路径

    /**
     * 订单状态
     */
    public static final String WAITING_PAY = "order_st_waiting_pay";    // 新订单，等待付款
    public static final String WAITING_VERIFICATION = "order_st_checking";    // 付款完成，进入等待审核状态
    public static final String PASS_VERIFICATION = "order_st_pass";    // 通过审核
    public static final String WAITING_DELIVER = "order_st_waiting_deliver";    // 等待发货
    public static final String WAITING_ESTIMATE = "order_st_waiting_estimate";  // 等待评价
    public static final String ORDER_SUCCEEDED = "order_st_succeeded";    // 交易成功

    public static String NETTY_HOST;
    public static int NETTY_PORT;

    static
    {
        ClassLoader classloader = Thread.currentThread().getContextClassLoader();
        Properties uploadPath = new Properties();
        Properties netty = new Properties();
        try
        {
            uploadPath.load(classloader.getResourceAsStream("uploadPath.ini"));
            netty.load(classloader.getResourceAsStream("netty.ini"));
        } catch (IOException e)
        {
            e.printStackTrace();
        }
        USER_PLACE_IMG_PATH = uploadPath.getProperty("USER_PLACE_IMG_PATH");
        USER_PERSONAL_INFO_IMG_PATH = uploadPath.getProperty("USER_PERSONAL_INFO_IMG_PATH");
        USER_HEAD_PORTRAIT_IMG_PATH = uploadPath.getProperty("USER_HEAD_PORTRAIT_IMG_PATH");
        USER_IMAGE_SPACE_PATH = uploadPath.getProperty("USER_IMAGE_SPACE_PATH");
        NETTY_HOST = netty.getProperty("HOST");
        NETTY_PORT = Integer.valueOf(netty.getProperty("PORT"));
    }
}
