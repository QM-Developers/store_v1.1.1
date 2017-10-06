package com.dgg.store.util.core.constant;

import java.io.IOException;
import java.util.Properties;

public class PathConstant
{
    /**
     * 用户图片上传路径
     */
    public static final String USER_PLACE_IMG_PATH; // 用户场地图片路径

    public static final String USER_PERSONAL_INFO_IMG_PATH; // 用户个人信息图片路径

    public static final String USER_HEAD_PORTRAIT_IMG_PATH; // 用户头像图片路径

    public static final String USER_IMAGE_SPACE_PATH;   // 用户图片空间路径

    public static final String USER_ID_CARD_PATH;   // 身份证图片路径

    public static final String COMMON_APPLY_IMAGE;   // 通用审批图片路径

    public static final String USER_ASSIST_PATH;    // 申请协助图片路径

    public static final String ORDER_PROOF_PATH;    // 订单凭证路径



    static
    {
        ClassLoader classloader = Thread.currentThread().getContextClassLoader();
        Properties uploadPath = new Properties();
        try
        {
            uploadPath.load(classloader.getResourceAsStream("uploadPath.ini"));
        } catch (IOException e)
        {
            e.printStackTrace();
        }
        USER_PLACE_IMG_PATH = uploadPath.getProperty("USER_PLACE_IMG_PATH");
        USER_PERSONAL_INFO_IMG_PATH = uploadPath.getProperty("USER_PERSONAL_INFO_IMG_PATH");
        USER_HEAD_PORTRAIT_IMG_PATH = uploadPath.getProperty("USER_HEAD_PORTRAIT_IMG_PATH");
        USER_IMAGE_SPACE_PATH = uploadPath.getProperty("USER_IMAGE_SPACE_PATH");
        USER_ID_CARD_PATH = uploadPath.getProperty("USER_ID_CARD_PATH");
        COMMON_APPLY_IMAGE = uploadPath.getProperty("COMMON_APPLY_IMAGE");
        USER_ASSIST_PATH = uploadPath.getProperty("USER_ASSIST_PATH");
        ORDER_PROOF_PATH = uploadPath.getProperty("ORDER_PROOF_PATH");
    }
}
