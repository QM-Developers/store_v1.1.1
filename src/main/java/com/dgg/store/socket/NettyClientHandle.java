package com.dgg.store.socket;

import io.netty.channel.ChannelHandlerContext;
import io.netty.channel.ChannelInboundHandlerAdapter;

public class NettyClientHandle extends ChannelInboundHandlerAdapter
{
    private NettyClient client;

    public NettyClientHandle(NettyClient client)
    {
        this.client = client;
    }

    @Override
    public void channelActive(ChannelHandlerContext ctx) throws Exception
    {
        System.out.println("连接服务器成功");
        client.setContext(ctx);
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
