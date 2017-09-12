package com.dgg.store.util.core.constant;

/**
 * 消息类型常量类
 */
public class MessageConstant
{
    public static final int TEXT = 0x00000001;  // 聊天消息
    public static final int REQUEST = 0x00000002;   // 好友申请
    public static final int PING = 0x00000003;  // 心跳请求
    public static final int PONG = 0x00000004;  // 心跳响应
    public static final int OFFLINE = 0x00000007;   // 下线通知
    public static final int REFRESH_FRIEND = 0x00000008;    // 刷新好友列表
    public static final int CARD = 0x00000009; // 发送名片消息
    public static final int CONNECT = 0x000000010;  // 连接信息

    public static final int CONNECT_SUCCESS = 0x00000005;   // 连接成功信号
    public static final int CONNECT_FAILED = 0x00000006; // 连接失败信号

    public static final String LOGOUT = "logout";
}
