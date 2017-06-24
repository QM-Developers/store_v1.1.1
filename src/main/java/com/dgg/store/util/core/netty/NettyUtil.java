package com.dgg.store.util.core.netty;


import io.netty.buffer.ByteBuf;
import io.netty.buffer.Unpooled;
import io.netty.channel.ChannelHandlerContext;

public class NettyUtil
{
    public static void writeAndFlushString(ChannelHandlerContext ctx,String data)
    {
        ByteBuf msg = Unpooled.buffer(data.length());
        msg.writeBytes(data.getBytes());
        ctx.writeAndFlush(msg);
    }
}
