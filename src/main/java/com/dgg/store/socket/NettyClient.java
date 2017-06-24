package com.dgg.store.socket;

import io.netty.bootstrap.Bootstrap;
import io.netty.buffer.ByteBuf;
import io.netty.buffer.Unpooled;
import io.netty.channel.*;
import io.netty.channel.nio.NioEventLoopGroup;
import io.netty.channel.socket.SocketChannel;
import io.netty.channel.socket.nio.NioSocketChannel;
import io.netty.handler.codec.DelimiterBasedFrameDecoder;
import io.netty.handler.codec.string.StringDecoder;
import io.netty.handler.timeout.IdleStateHandler;

public class NettyClient
{
    public static final ByteBuf delimiter = Unpooled.copiedBuffer("_#_".getBytes());
    public static final String delimiterStr = "_#_";
    public static final int readerIdleTimeSeconds = 0;
    public static final int writerIdleTimeSeconds = 0;
    public static final int allIdleTimeSeconds = 60;
    public static final int maxFrameLength = 1024;

    public volatile static ChannelHandlerContext context;

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
                            ch.pipeline().addLast(new IdleStateHandler(readerIdleTimeSeconds,writerIdleTimeSeconds,0));
                            ch.pipeline().addLast(new DelimiterBasedFrameDecoder(maxFrameLength, delimiter));
                            ch.pipeline().addLast(new StringDecoder());
                            ch.pipeline().addLast(new NettyClientHandle());
                            ch.pipeline().addLast(MarshallingCodeCFactory.buildMarshallingDecoder());
                            ch.pipeline().addLast(MarshallingCodeCFactory.buildMarshallingEncoder());
                        }
                    });
            ChannelFuture f = b.connect(host, port).sync();
            f.channel().closeFuture().sync();
        } finally
        {
            group.shutdownGracefully();
        }
    }

//    public static void main(String[] args) throws Exception
//    {
//        String host = "192.168.1.13";
//        int port = 8090;
//        new ChatClient().connect(port, host);
//    }
}
