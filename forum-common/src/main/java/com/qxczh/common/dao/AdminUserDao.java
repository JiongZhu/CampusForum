package com.qxczh.common.dao;

import com.qxczh.common.entity.AdminUser;
import org.springframework.cache.annotation.CacheConfig;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.stereotype.Repository;

import java.util.List;


@Repository
@CacheConfig(cacheNames = "adminusers")
public interface AdminUserDao extends JpaRepository<AdminUser,Integer>,JpaSpecificationExecutor {

    AdminUser findOne(Integer integer);

    @Cacheable
    List<AdminUser> findAll();

    AdminUser findByUsername(String username);

    @Cacheable
    @Override
    List findAll(Specification specification, Sort sort);
}
