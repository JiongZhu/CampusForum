package com.qxczh.chat.entity;

import com.qxczh.common.entity.User;
import io.netty.channel.Channel;


public class ChatUser {

    private User user;

    private boolean isAuth = false;//是否认证

    private long time = 0;//活跃时间

    private Channel channel;//用户对应的channel

    private String addr;            // 地址

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public boolean isAuth() {
        return isAuth;
    }

    public void setAuth(boolean auth) {
        isAuth = auth;
    }

    public long getTime() {
        return time;
    }

    public void setTime(long time) {
        this.time = time;
    }

    public Channel getChannel() {
        return channel;
    }

    public void setChannel(Channel channel) {
        this.channel = channel;
    }

    public String getAddr() {
        return addr;
    }

    public void setAddr(String addr) {
        this.addr = addr;
    }
}
