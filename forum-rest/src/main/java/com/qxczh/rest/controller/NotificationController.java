package com.qxczh.rest.controller;

import com.qxczh.common.base.BaseController;
import com.qxczh.common.dto.QuarkResult;
import com.qxczh.common.entity.Notification;
import com.qxczh.common.entity.User;
import com.qxczh.rest.service.NotificationService;
import com.qxczh.rest.service.UserService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;


@Api("通知消息接口")
@RequestMapping("/notification")
@RestController
public class NotificationController extends BaseController {

    @Autowired
    private NotificationService notificationService;

    @Autowired
    private UserService userService;

    @ApiOperation("获取用户的通知消息")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "uid",value = "用户的id",dataType ="int")
    })
    @GetMapping("/{uid}")
    public QuarkResult getAllNotification(@PathVariable("uid") Integer uid) {
        QuarkResult result = restProcessor(() -> {
            User user = userService.findOne(uid);
            if (user==null) return QuarkResult.warn("用户不存在！");
            List<Notification> list = notificationService.findByUser(user);
            return QuarkResult.ok(list);
        });
        return result;
    }

    @ApiOperation("删除用户的通知消息")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "uid",value = "用户的id",dataType ="int")
    })
    @DeleteMapping("/{uid}")
    public QuarkResult deleteAllNotification(@PathVariable("uid") Integer uid){
        QuarkResult result = restProcessor(() -> {
            User user = userService.findOne(uid);
            if (user == null) return QuarkResult.warn("用户不存在！");
            notificationService.deleteByUser(user);
            return QuarkResult.ok();
        });

        return result;
    }

}
