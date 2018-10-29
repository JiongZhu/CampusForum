package com.qxczh.admin.service;

import com.qxczh.common.base.BaseService;
import com.qxczh.common.dto.QuarkResult;
import com.qxczh.common.entity.Permission;
import com.qxczh.common.entity.Role;
import org.springframework.data.domain.Page;


public interface RoleService extends BaseService<Role> {

    /**
     * 根据用户id查询用户的角色
     *
     * @param id
     * @return
     */
    QuarkResult findRolesAndSelected(Integer id);

    /**
     * 翻页查询
     * @param pageNo
     * @param length
     * @return
     */
    Page<Role> findByPage(int pageNo, int length);

    /**
     * 保存角色的权限
     * @param roleid
     * @param pers
     */
    void saveRolePermission(Integer roleid, Permission[] pers);
}
