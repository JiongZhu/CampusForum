package com.qxczh.porent.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class PageController {

    @RequestMapping("/index")
    public String indexPage() {
        return "index";
    }

    @RequestMapping("/gossip")
    public String gossipPage() {
        return "gossip";
    }
    @RequestMapping("/emotional")
    public String emotionalPage() {
        return "emotional";
    }
    @RequestMapping("/study")
    public String studyPage() {
        return "study";
    }
    @RequestMapping("/fashion")
    public String fashionPage() {
        return "fashion";
    }
    @RequestMapping("/job")
    public String jobPage() {
        return "job";
    }
    @RequestMapping("/sales")
    public String salesPage() {
        return "sales";
    }

    @RequestMapping("/label")
    public String labelhome() {
        return "label/home";
    }

    @RequestMapping("/chat")
    public String chathome(){
        return "chat/home";
    }
}
