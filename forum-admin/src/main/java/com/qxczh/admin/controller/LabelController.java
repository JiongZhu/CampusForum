package com.qxczh.admin.controller;

import com.qxczh.admin.service.LabelService;
import com.qxczh.common.base.BaseController;
import com.qxczh.common.dto.PageResult;
import com.qxczh.common.dto.QuarkResult;
import com.qxczh.common.entity.Label;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.web.bind.annotation.*;

import java.util.Arrays;
import java.util.List;


@RequestMapping("/labels")
@RestController
public class LabelController extends BaseController {

    @Autowired
    private LabelService labelService;

    @GetMapping
    public PageResult getAll(String draw,
                             @RequestParam(required = false, defaultValue = "1") int start,
                             @RequestParam(required = false, defaultValue = "10") int length) {

        int pageNo = start / length;
        Page<Label> page = labelService.findByPage(pageNo, length);
        PageResult<List<Label>> result = new PageResult<>(draw,
                page.getTotalElements(),
                page.getTotalElements(),
                page.getContent());

        return result;
    }

    @PostMapping("/delete")
    public QuarkResult deleteLabels(@RequestParam(value = "id[]") Label[] id) {
        QuarkResult result = restProcessor(() -> {
            labelService.deleteInBatch(Arrays.asList(id));
            return QuarkResult.ok();
        });
        return result;
    }

    @PostMapping("/add")
    public QuarkResult addLabels(Label label){
        QuarkResult result = restProcessor(() -> {
            labelService.save(label);
            return QuarkResult.ok();
        });

        return result;
    }

}
