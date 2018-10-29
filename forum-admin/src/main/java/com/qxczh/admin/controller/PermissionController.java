package com.qxczh.admin.controller;

import com.qxczh.admin.service.PermissionService;
import com.qxczh.admin.shiro.ShiroService;
import com.qxczh.common.base.BaseController;
import com.qxczh.common.dto.PageResult;
import com.qxczh.common.dto.QuarkResult;
import com.qxczh.common.entity.Permission;
import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.web.bind.annotation.*;

import java.util.Arrays;
import java.util.List;


@RestController
@RequestMapping("/permissions")
public class PermissionController extends BaseController {
    @Autowired
    private PermissionService permissionService;

    @Autowired
    private ShiroService shiroService;

    @PostMapping("/loadMenu")
    public List<Permission> loadMenu(){
        Integer userid = (Integer) SecurityUtils.getSubject().getSession().getAttribute("AdminSessionId");
        List<Permission> list = permissionService.loadUserPermissionByType(userid,1);
        return list;
    }

    @PostMapping("/PermissionWithSelected")
    public QuarkResult PermissionWithSelected(Integer roleId){
        QuarkResult result = restProcessor(() -> {
            List<Permission> data = permissionService.findPermissionsAndSelected(roleId);
            return QuarkResult.ok(data);
        });

        return result;
    }

    @GetMapping
    public PageResult getAll(String draw,
                             @RequestParam(required = false, defaultValue = "1") int start,
                             @RequestParam(required = false, defaultValue = "10") int length){
        int pageNo = start/length;
        Page<Permission> page = permissionService.findByPage(pageNo, length);
        PageResult<List<Permission>> result = new PageResult<>(
                draw,
                page.getTotalElements(),
                page.getTotalElements(),
                page.getContent());

        return result;
    }

    @PostMapping("/add")
    public QuarkResult add(Permission permission) {
        QuarkResult result = restProcessor(() -> {
            permissionService.save(permission);
            //更新权限
            shiroService.updatePermission();
            return QuarkResult.ok();
        });
        return result;
    }

    @PostMapping("/delete")
    public QuarkResult delete(@RequestParam(value = "id[]") Permission[] id){
        QuarkResult result = restProcessor(() -> {
            permissionService.deleteInBatch(Arrays.asList(id));
            //更新权限
            shiroService.updatePermission();
            return QuarkResult.ok();
        });
        return result;
    }

}
