package com.qxczh.porent.interceptor;

import com.qxczh.porent.entity.User;
import com.qxczh.porent.service.UserService;
import com.qxczh.porent.utils.CookieUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 登录拦截
 */
public class LoginInterceptor implements HandlerInterceptor {

    @Autowired
    private UserService userService;

    @Value("${cookie_name}")
    private String CookieName;

    @Override
    public boolean preHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o) throws Exception {

        String token = CookieUtils.getCookieValue(httpServletRequest, "QUARK_TOKEN");
        if (token==null) {
            // 跳转到登录页面
            httpServletResponse.sendRedirect("/user/login");
            // 返回false
            return false;
        }
        User user = userService.getUserByApi(token);

        // 取不到用户信息
        if (user == null) {
            // 跳转到登录页面
            httpServletResponse.sendRedirect("/user/login");
            // 返回false
            return false;
        }
        return true;
    }

    @Override
    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {

    }

    @Override
    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {

    }
}
