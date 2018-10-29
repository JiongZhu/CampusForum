package com.qxczh.porent.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@RequestMapping("/label")
@Controller
public class LabelController {

    @RequestMapping("/detail")
    public String getLabelDetail(){
        return "label/detail";
    }

}
