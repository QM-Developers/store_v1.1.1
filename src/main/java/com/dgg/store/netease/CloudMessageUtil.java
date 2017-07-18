package com.dgg.store.netease;

import com.alibaba.fastjson.JSON;
import com.dgg.store.util.core.constant.NetEaseConstant;
import com.dgg.store.util.core.generator.IDGenerator;
import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;


public class CloudMessageUtil
{
    public static final boolean sendCode(String phone) throws IOException
    {
        String NONCE = IDGenerator.generator();
        CloseableHttpClient httpclient = HttpClients.createDefault();
        HttpPost post = new HttpPost(NetEaseConstant.URL_CODE);

        String curTime = String.valueOf((new Date().getTime() / 1000L));
        String checkSum = CheckSumBuilder.getCheckSum(NetEaseConstant.APP_SECRET, NONCE, curTime);

        //设置请求的header
        post.addHeader("AppKey", NetEaseConstant.APP_KEY);
        post.addHeader("Nonce", NONCE);
        post.addHeader("CurTime", curTime);
        post.addHeader("CheckSum", checkSum);
        post.addHeader("Content-Type", "application/x-www-form-urlencoded;charset=utf-8");

        //设置请求参数
        List<NameValuePair> nameValuePairs = new ArrayList<>();
        nameValuePairs.add(new BasicNameValuePair("mobile", phone));

        post.setEntity(new UrlEncodedFormEntity(nameValuePairs, "utf-8"));

        //执行请求
        HttpResponse response = httpclient.execute(post);
        String responseEntity = EntityUtils.toString(response.getEntity(), "utf-8");

        //判断是否发送成功，发送成功返回true
        String code = JSON.parseObject(responseEntity).getString("code");
        return code.equals("200");
    }

    public static final boolean verifyCode(String phone, String code) throws IOException
    {
        String NONCE = IDGenerator.generator();
        CloseableHttpClient httpclient = HttpClients.createDefault();
        HttpPost post = new HttpPost(NetEaseConstant.URL_VERIFY);

        String curTime = String.valueOf((new Date().getTime() / 1000L));
        String checkSum = CheckSumBuilder.getCheckSum(NetEaseConstant.APP_SECRET, NONCE, curTime);

        //设置请求的header
        post.addHeader("AppKey", NetEaseConstant.APP_KEY);
        post.addHeader("Nonce", NONCE);
        post.addHeader("CurTime", curTime);
        post.addHeader("CheckSum", checkSum);
        post.addHeader("Content-Type", "application/x-www-form-urlencoded;charset=utf-8");

        //设置请求参数
        List<NameValuePair> nameValuePairs = new ArrayList<NameValuePair>();
        nameValuePairs.add(new BasicNameValuePair("mobile", phone));
        nameValuePairs.add(new BasicNameValuePair("code", code));

        post.setEntity(new UrlEncodedFormEntity(nameValuePairs, "utf-8"));

        //执行请求
        HttpResponse response = httpclient.execute(post);
        String responseEntity = EntityUtils.toString(response.getEntity(), "utf-8");
        String state = JSON.parseObject(responseEntity).getString("code");
        return state.equals("200");
    }
}
