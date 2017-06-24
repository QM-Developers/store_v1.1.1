package com.dgg.store.util.core.token;

import com.dgg.store.util.core.generator.IDGenerator;

public class TokenUtil
{
    private static final String privateKey = "djfksldkfjalewiorjf";

    public static String getToken()
    {
//        return CryptographyUtil.md5(data, privateKey)+System.currentTimeMillis();
        return IDGenerator.generator()+System.currentTimeMillis();
    }


    public static boolean validToken(String token, String data)
    {
        String confirm = getToken();
        if (confirm.equals(token))
            return true;
        else
            return false;
    }
}
