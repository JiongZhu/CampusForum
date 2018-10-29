package com.qxczh.admin.service.impl;

import com.qxczh.admin.service.LabelService;
import com.qxczh.common.base.BaseServiceImpl;
import com.qxczh.common.dao.LabelDao;
import com.qxczh.common.entity.Label;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;


@Service
public class LabelServiceImpl extends BaseServiceImpl<LabelDao,Label> implements LabelService{


    @Override
    public Page<Label> findByPage(int pageNo, int length) {
        PageRequest pageRequest = new PageRequest(pageNo, length);
        Page<Label> page = repository.findAll(pageRequest);
        return page;
    }
}
