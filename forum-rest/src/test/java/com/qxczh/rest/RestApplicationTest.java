package com.qxczh.rest;

import com.qxczh.common.dao.AdminUserDao;
import com.qxczh.common.dao.PostsDao;
import com.qxczh.rest.service.PostsService;
import com.qxczh.rest.service.RedisService;
import com.qxczh.rest.service.ReplyService;
import com.qxczh.rest.service.UserService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.test.context.TestPropertySource;
import org.springframework.test.context.junit4.SpringRunner;

import javax.sql.DataSource;


@RunWith(SpringRunner.class)
@TestPropertySource(locations = {"classpath:rest.properties"})
@SpringBootTest
public class RestApplicationTest {

    @Autowired
    RedisTemplate redisTemplate;

    @Autowired
    UserService userService;

    @Autowired
    DataSource dataSource;

    @Autowired
    PostsService postsService;

    @Autowired
    ReplyService replyService;

    @Autowired
    AdminUserDao dao;

    @Autowired
    RedisService<Integer> redisService;

    @Autowired
    PostsDao postsDao;

    @Value("${REDIS_USERID_KEY}")
    private String REDIS_USERID_KEY;
    @Test
    public void testDataSource() {
//        userService.updateUserPassword("2a8e48c8-9d09-4ef4-892c-b3436070297c","12345678","123456");
//        redisService.cacheSet(REDIS_USERID_KEY,8);
//        redisService.cacheSet(REDIS_USERID_KEY,10);
//        redisService.deleteSet(REDIS_USERID_KEY,8);
//            System.out.println(redisService.setHasValue(REDIS_USERID_KEY,5));
//        postsDao.findAll();
    }

}
