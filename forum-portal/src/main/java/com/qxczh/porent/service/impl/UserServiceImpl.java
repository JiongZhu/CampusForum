package com.qxczh.porent.service.impl;

import com.qxczh.porent.entity.QuarkResult;
import com.qxczh.porent.entity.User;
import com.qxczh.porent.service.UserService;
import com.qxczh.porent.utils.HttpClientUtils;
import com.qxczh.porent.utils.JsonUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;


@Service
public class UserServiceImpl implements UserService{

    @Value("${api_getUserByToken}")
    private String api_getUserByToken;

    @Override
    public User getUserByApi(String token) {
        String s = HttpClientUtils.doGet(api_getUserByToken + token);
        QuarkResult quarkResult = JsonUtils.jsonToQuarkResult(s, User.class);
        User data= (User) quarkResult.getData();
        return data;
    }
}
