package com.qxczh.porent.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping("/posts")
public class PostsController {

    @RequestMapping("/add")
    public String add(){
        return "posts/add";
    }

    @RequestMapping("/detail")
    public String detail() {
        return "posts/detail";
    }
}
