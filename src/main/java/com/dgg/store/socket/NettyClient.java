package com.dgg.store.socket;

import com.dgg.store.util.core.constant.Constant;
import io.netty.bootstrap.Bootstrap;
import io.netty.channel.*;
import io.netty.channel.nio.NioEventLoopGroup;
import io.netty.channel.socket.SocketChannel;
import io.netty.channel.socket.nio.NioSocketChannel;
import io.netty.handler.codec.protobuf.ProtobufDecoder;
import io.netty.handler.codec.protobuf.ProtobufEncoder;
import io.netty.handler.codec.protobuf.ProtobufVarint32LengthFieldPrepender;

public class NettyClient
{
    private ChannelHandlerContext context;

    private NettyClient self = this;

    public void connect(int port, String host) throws Exception
    {
        EventLoopGroup group = new NioEventLoopGroup();
        try
        {
            Bootstrap b = new Bootstrap();
            b.group(group).channel(NioSocketChannel.class)
                    .option(ChannelOption.TCP_NODELAY, true)
                    .handler(new ChannelInitializer<SocketChannel>()
                    {
                        @Override
                        protected void initChannel(SocketChannel ch) throws Exception
                        {
                            ch.pipeline().addLast(new ProtobufVarint32LengthFieldPrepender());
                            ch.pipeline().addLast(new ProtobufEncoder());
                            ch.pipeline().addLast(new ProtobufDecoder(MainMessageProto.ProtoMessage.getDefaultInstance()));
                            ch.pipeline().addLast(new NettyClientHandle(self));
                        }
                    });
            ChannelFuture f = b.connect(host, port).sync();
            f.channel().closeFuture().sync();
        } finally
        {
//            group.shutdownGracefully();
            reConnectServer();
        }
    }

    private void reConnectServer()
    {
        try
        {
            Thread.sleep(5000);
            System.err.println("客户端进行断线重连");
            connect(Constant.NETTY_PORT, Constant.NETTY_HOST);
        } catch (Exception e)
        {
            e.printStackTrace();
        }
    }

    public boolean isConnect()
    {
        return context == null || context.channel().isActive();
    }

    public void setContext(ChannelHandlerContext context)
    {
        this.context = context;
    }
}
