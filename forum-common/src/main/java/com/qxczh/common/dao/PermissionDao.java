package com.qxczh.common.dao;

import com.qxczh.common.entity.Permission;
import org.springframework.cache.annotation.CacheConfig;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;


@Repository
@CacheConfig(cacheNames = "permissions")
public interface PermissionDao extends JpaRepository<Permission,Integer> {


    Permission findOne(Integer integer);

    @Cacheable
    List<Permission> findAll();

}
