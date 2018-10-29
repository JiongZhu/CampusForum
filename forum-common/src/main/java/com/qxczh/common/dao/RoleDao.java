package com.qxczh.common.dao;

import com.qxczh.common.entity.Role;
import org.springframework.cache.annotation.CacheConfig;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;


@Repository
@CacheConfig(cacheNames = "roles")
public interface RoleDao extends JpaRepository<Role,Integer>{

    Role findOne(Integer integer);

    @Cacheable
    List<Role> findAll();

}
