package com.qxczh.admin.controller;

import com.qxczh.admin.service.UserService;
import com.qxczh.common.base.BaseController;
import com.qxczh.common.dto.PageResult;
import com.qxczh.common.dto.QuarkResult;
import com.qxczh.common.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/users")
public class UserController extends BaseController{

    @Autowired
    private UserService userService;

    @GetMapping
    public PageResult getAll(User user, String draw,
                             @RequestParam(required = false, defaultValue = "1") int start,
                             @RequestParam(required = false, defaultValue = "10") int length) {
        int pageNo = start / length;
        Page<User> page = userService.findByPage(user, pageNo, length);
        PageResult<List<User>> result = new PageResult<>(
                draw,
                page.getTotalElements(),
                page.getTotalElements(),
                page.getContent());
        return result;
    }

    @PostMapping("/saveUserEnable")
    public QuarkResult saveUserEnable(@RequestParam(value = "id[]") Integer[] id){
        QuarkResult result = restProcessor(() -> {
            userService.saveUserEnable(id);
            return QuarkResult.ok();
        });
        return result;
    }

}
