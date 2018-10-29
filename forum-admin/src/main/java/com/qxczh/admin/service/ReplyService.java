package com.qxczh.admin.service;

import com.qxczh.common.base.BaseService;
import com.qxczh.common.entity.Reply;
import org.springframework.data.domain.Page;


public interface ReplyService extends BaseService<Reply>{

    /**
     * 翻页条件查询回复
     * @param reply
     * @param pageNo
     * @param length
     * @return
     */
   Page<Reply> findByPage(Reply reply, int pageNo, int length);

    
}
