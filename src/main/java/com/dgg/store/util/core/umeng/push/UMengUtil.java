package com.dgg.store.util.core.umeng.push;

import com.dgg.store.util.core.constant.UMConstant;
import com.dgg.store.util.core.umeng.push.android.AndroidUnicast;
import com.dgg.store.util.pojo.PushMessage;

public class UMengUtil
{
    private static void sendAndroidUnicast(String token, PushMessage msg) throws Exception
    {
        AndroidUnicast unicast = new AndroidUnicast(UMConstant.APP_KEY, UMConstant.MASTER_SECRET);
        unicast.setDeviceToken(token);
        unicast.setTicker(msg.getMsgTicker());
        unicast.setTitle(msg.getMsgTitle());
        unicast.setText(msg.getMsgText());
        unicast.goAppAfterOpen();
        unicast.setDisplayType(AndroidNotification.DisplayType.NOTIFICATION);
        unicast.setProductionMode();
        UMengClientFactory.getInstance().send(unicast);
    }

    public static void sendAndroidMessage(String token, PushMessage msg) throws Exception
    {
        AndroidUnicast unicast = new AndroidUnicast(UMConstant.APP_KEY, UMConstant.MASTER_SECRET);
        unicast.setDeviceToken(token);
        unicast.setCustomField(msg.getField());
        unicast.setDisplayType(AndroidNotification.DisplayType.MESSAGE);
        unicast.setProductionMode();
        UMengClientFactory.getInstance().send(unicast);
    }

    public static void sendUnicast(String deviceToken, PushMessage msg)
    {
        try
        {
            sendAndroidUnicast(deviceToken, msg);
        } catch (Exception e)
        {
            e.printStackTrace();
        }
    }

    public static void sendMessage(String deviceToken, PushMessage msg)
    {
        try
        {
            sendAndroidMessage(deviceToken,msg);
        } catch (Exception e)
        {
            e.printStackTrace();
        }
    }
}
