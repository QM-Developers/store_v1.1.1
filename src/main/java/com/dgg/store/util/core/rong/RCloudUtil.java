package com.dgg.store.util.core.rong;


import com.alibaba.fastjson.JSONObject;
import com.dgg.store.util.core.constant.Constant;
import com.dgg.store.util.core.constant.KeyConstant;
import com.dgg.store.util.core.rong.models.TokenResult;

public class RCloudUtil
{
    public static final String getToken(RongCloud rongCloud, String userId, String userName) throws Exception
    {
        // 获取 Token 方法
        TokenResult userGetTokenResult = rongCloud.user.getToken(userId, userName, Constant.EMPTY);

        JSONObject json = JSONObject.parseObject(userGetTokenResult.toString());

        return json.getString(KeyConstant.TOKEN);
    }
}
