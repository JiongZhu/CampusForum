package com.qxczh.admin.service;

import com.qxczh.common.base.BaseService;
import com.qxczh.common.entity.Label;
import org.springframework.data.domain.Page;

public interface LabelService extends BaseService<Label> {

    /**
     * 翻页查询
     * @param pageNo
     * @param length
     * @return
     */
    Page<Label> findByPage(int pageNo, int length);
}
