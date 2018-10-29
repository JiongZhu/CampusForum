package com.qxczh.admin.service.impl;

import com.qxczh.admin.service.ReplyService;
import com.qxczh.common.base.BaseServiceImpl;
import com.qxczh.common.dao.ReplyDao;
import com.qxczh.common.entity.Posts;
import com.qxczh.common.entity.Reply;
import com.qxczh.common.entity.User;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;

import javax.persistence.criteria.*;
import java.util.ArrayList;


@Service
public class ReplyServiceImpl extends BaseServiceImpl<ReplyDao,Reply> implements ReplyService {

    @Override
    public Page<Reply> findByPage(Reply reply, int pageNo, int length) {
        PageRequest pageable = new PageRequest(pageNo, length);

        Specification<Posts> specification = new Specification<Posts>(){

            @Override
            public Predicate toPredicate(Root<Posts> root, CriteriaQuery<?> criteriaQuery, CriteriaBuilder criteriaBuilder) {
                Path<Integer> $id = root.get("id");
                Path<String> $content = root.get("content");
                Path<User> $user = root.get("user");

                ArrayList<Predicate> list = new ArrayList<>();
                if (reply.getId()!=null) list.add(criteriaBuilder.equal($id,reply.getId()));
                if (reply.getContent()!=null) list.add(criteriaBuilder.like($content,"%" + reply.getContent() + "%"));
                if (reply.getUser()!=null) list.add(criteriaBuilder.equal($user,reply.getUser()));

                Predicate predicate = criteriaBuilder.and(list.toArray(new Predicate[list.size()]));

                return predicate;
            }
        };
        Page<Reply> page = repository.findAll(specification, pageable);
        return page;
    }
}
