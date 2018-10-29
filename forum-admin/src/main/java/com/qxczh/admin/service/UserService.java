package com.qxczh.admin.service;

import com.qxczh.common.base.BaseService;
import com.qxczh.common.entity.User;
import org.springframework.data.domain.Page;


public interface UserService  extends BaseService<User> {

    /**
     * 翻页获取用户列表
     * @param user
     * @param pageNo
     * @param length
     * @return
     */
    Page<User> findByPage(User user, int pageNo, int length);

    /**
     * 恢复/封禁用户
     * @param id
     */
    void saveUserEnable(Integer[] id);
}
