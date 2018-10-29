package com.qxczh.porent.config;

import com.qxczh.porent.interceptor.LoginInterceptor;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;


@Configuration
public class WebAppConfig extends WebMvcConfigurerAdapter {


    @Bean
    LoginInterceptor loginInterceptor() {
        return new LoginInterceptor();
    }


    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(loginInterceptor()).addPathPatterns(
                "/posts/add",
                "/user/set",
                "/user/seticon",
                "/user/setpsw",
                "/user/message",
                "/chat");
        super.addInterceptors(registry);
    }
}
