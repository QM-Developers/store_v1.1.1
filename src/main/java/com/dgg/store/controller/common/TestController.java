package com.dgg.store.controller.common;

import com.alibaba.fastjson.JSONObject;
import com.dgg.store.socket.NettyClient;
import com.dgg.store.util.pojo.User;
import com.dgg.store.util.vo.core.ResultVO;
import io.netty.buffer.ByteBuf;
import io.netty.buffer.Unpooled;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.io.UnsupportedEncodingException;

@Controller
public class TestController
{
    @RequestMapping(value = "user_test", method = RequestMethod.GET)
    @ResponseBody
    public ResultVO userTest(User user)
    {
        JSONObject json = new JSONObject();
        json.put("userName", "张三");
        json.put("userPhone", "13688888888");
        ResultVO resultVO = new ResultVO(1, "521934322bc940f4b72ac357e029863b1493025106133", json);

        String str = json.toJSONString() + NettyClient.delimiterStr;
        ByteBuf msg = Unpooled.buffer(str.length());
        msg.writeBytes(str.getBytes());
        NettyClient.context.writeAndFlush(msg);

        return resultVO;
    }

}
