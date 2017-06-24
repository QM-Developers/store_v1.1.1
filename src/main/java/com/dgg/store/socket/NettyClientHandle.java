package com.dgg.store.socket;

import io.netty.channel.ChannelHandlerContext;
import io.netty.channel.ChannelInboundHandlerAdapter;

public class NettyClientHandle extends ChannelInboundHandlerAdapter
{

    @Override
    public void channelActive(ChannelHandlerContext ctx) throws Exception
    {
        NettyClient.context = ctx;
    }

    @Override
    public void channelRead(ChannelHandlerContext ctx, Object msg) throws Exception
    {
    }

    @Override
    public void channelReadComplete(ChannelHandlerContext ctx) throws Exception
    {
        super.channelReadComplete(ctx);
    }

    @Override
    public void exceptionCaught(ChannelHandlerContext ctx, Throwable cause) throws Exception
    {
        super.exceptionCaught(ctx, cause);
    }

    @Override
    public void userEventTriggered(ChannelHandlerContext ctx, Object evt) throws Exception
    {
    }

}
