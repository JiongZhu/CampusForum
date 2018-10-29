package com.qxczh.rest.service;

import java.util.List;


public interface RankService {

    /**
     * 获取最近一周热帖排行榜
     * @return
     */
   List<Object> findPostsRank();

    /**
     * 获取最近一周的新注册用户
     * @return
     */
   List<Object> findUserRank();
}
