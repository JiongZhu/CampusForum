package com.qxczh.rest.controller;

import com.qxczh.common.base.BaseController;
import com.qxczh.common.dto.QuarkResult;
import com.qxczh.common.entity.Label;
import com.qxczh.rest.service.LabelService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;



@Api(value = "标签接口",description = "获取标签")
@RestController
@RequestMapping("/label")
public class LabelController extends BaseController{

    @Autowired
    private LabelService labelService;

    @ApiOperation("获取标签")
    @GetMapping
    public QuarkResult getAllLabel(){

        QuarkResult result = restProcessor(() -> {
            List<Label> labels = labelService.findAll();
            return QuarkResult.ok(labels);
        });

        return result;
    }
}
