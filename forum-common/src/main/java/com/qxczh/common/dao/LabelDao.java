package com.qxczh.common.dao;

import com.qxczh.common.entity.Label;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface LabelDao extends JpaRepository<Label,Integer> {
}
