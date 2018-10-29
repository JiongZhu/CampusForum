package com.qxczh.chat.server;

/**
 * 服务端接口
 */
public interface Server {

    /**
     * 初始化服务器
     */
    void init();

    /**
     * 启动服务器
     */
    void start();

    /**
     * 关闭服务器
     */
    void shutdown();
}
