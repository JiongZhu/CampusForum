package com.qxczh.rest.service;

import com.qxczh.common.base.BaseService;
import com.qxczh.common.entity.Label;
import com.qxczh.common.entity.Posts;
import com.qxczh.common.entity.User;
import org.springframework.data.domain.Page;

import java.util.List;


public interface PostsService extends BaseService<Posts> {

    /**
     * 保存帖子
     * @param posts 帖子
     * @param labelId 标签id
     */
    void savePosts(Posts posts,Integer labelId,User user);
    /**
     * 翻页查询帖子
     * @param type
     * @param search
     * @param pageNo
     * @param length
     * @return
     */
    Page<Posts> getPostsByPage(String type ,String search, int pageNo,int length);

    /**
     * 获取用户最近发布的10个POSTS
     * @param user
     * @return
     */
    List<Posts> getPostsByUser(User user);


    /**
     * 根据标签分页获取获取Posts
     * @param label
     * @return
     */
    Page<Posts> getPostsByLabel(Label label,int pageNo,int lenght);
}
