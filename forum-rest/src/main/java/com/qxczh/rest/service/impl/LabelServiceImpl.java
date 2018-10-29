package com.qxczh.rest.service.impl;

import com.qxczh.common.base.BaseServiceImpl;
import com.qxczh.common.dao.LabelDao;
import com.qxczh.common.entity.Label;
import com.qxczh.rest.service.LabelService;
import org.springframework.stereotype.Service;


@Service
public class LabelServiceImpl extends BaseServiceImpl<LabelDao,Label> implements LabelService{
}
