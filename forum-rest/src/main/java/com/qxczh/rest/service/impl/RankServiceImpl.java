package com.qxczh.rest.service.impl;

import com.qxczh.common.dao.PostsDao;
import com.qxczh.common.dao.UserDao;
import com.qxczh.rest.service.RankService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class RankServiceImpl  implements RankService{
    @Autowired
    private PostsDao postsDao;

    @Autowired
    private UserDao userDao;

    @Override
    public List<Object> findPostsRank() {
        return postsDao.findHot();
    }

    @Override
    public List<Object> findUserRank() {
        return userDao.findNewUser();
    }
}
