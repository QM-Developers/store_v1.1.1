package com.dgg.store.util.core.shiro;

import org.apache.shiro.codec.Base64;
import org.apache.shiro.crypto.hash.Md5Hash;

public class CryptographyUtil
{

    /**
     * base64加密
     *
     * @param str
     * @return
     */
    public static String encBase64(String str)
    {
        return Base64.encodeToString(str.getBytes());
    }

    /**
     * base64解密
     *
     * @param str
     * @return
     */
    public static String decBase64(String str)
    {
        return Base64.decodeToString(str);
    }

    public static String selfEncode(String str)
    {
        byte[] bytes = str.getBytes();
        for (int i = 0; i < bytes.length; i++)
            bytes[i] = (byte) (bytes[i] + 1);
        return new String(bytes);
    }

    public static String selfDecode(String str)
    {
        byte[] bytes = str.getBytes();
        for (int i = 0; i < bytes.length; i++)
            bytes[i] = (byte) (bytes[i] - 1);
        return new String(bytes);
    }

    /**
     * Md5加密
     *
     * @param str
     * @param salt
     * @return
     */
    public static String md5(String str, String salt)
    {
        return new Md5Hash(str, salt).toString();
    }
}
