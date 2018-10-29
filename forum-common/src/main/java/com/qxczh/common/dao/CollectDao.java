package com.qxczh.common.dao;

import com.qxczh.common.entity.Collect;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface CollectDao extends JpaRepository<Collect,Integer> {
}
