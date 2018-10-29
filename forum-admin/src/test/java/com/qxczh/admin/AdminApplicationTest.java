package com.qxczh.admin;

import com.qxczh.admin.service.*;
import com.qxczh.common.dao.AdminUserDao;
import com.qxczh.common.entity.Posts;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.data.domain.Page;
import org.springframework.test.context.TestPropertySource;
import org.springframework.test.context.junit4.SpringRunner;

import javax.sql.DataSource;


@RunWith(SpringRunner.class)
@TestPropertySource(locations = {"classpath:admin.properties"})
@SpringBootTest
public class AdminApplicationTest {

    @Autowired
    DataSource dataSource;

    @Autowired(required=true)
    AdminUserService adminUserService;

    @Autowired(required=true)
    PermissionService permissionService;

    @Autowired(required=true)
    RoleService roleService;

    @Autowired
    AdminUserDao dao;

    @Autowired
    UserService userService;

    @Autowired
    PostsService postsService;

    @Test
    public void testDataSource() {
       System.out.println(dao.findOne(3));

    }



    @Test
    public void testRole(){
//        AdminUser user1 = new AdminUser();
//        AdminUser user2 = new AdminUser();
//        AdminUser user3 = new AdminUser();
//        user1.setId(11);
//        user2.setId(12);
//        user3.setId(13);
        adminUserService.saveAdminEnable(new Integer[]{11,12,13});
    }

    @Test
    public void testPosts(){
        Posts posts = new Posts();
//        posts.setId(1);
        posts.setTitle("测试");
        posts.setUser(userService.findOne(2));
        Page<Posts> page = postsService.findByPage(posts, 0, 10);
        System.out.println(page.getContent());
    }
}
