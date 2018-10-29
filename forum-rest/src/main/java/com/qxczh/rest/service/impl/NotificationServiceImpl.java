package com.qxczh.rest.service.impl;

import com.qxczh.common.base.BaseServiceImpl;
import com.qxczh.common.dao.NotificationDao;
import com.qxczh.common.entity.Notification;
import com.qxczh.common.entity.User;
import com.qxczh.rest.service.NotificationService;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;


@Service
@Transactional
public class NotificationServiceImpl extends BaseServiceImpl<NotificationDao,Notification> implements NotificationService{

    @Override
    public long getNotificationCount(int uid) {
        return repository.getNotificationCount(uid);
    }

    @Override
    public List<Notification> findByUser(User user) {
        List<Notification> list = repository.getByTouserOrderByInitTimeDesc(user);
        repository.updateByIsRead(user);
        return list;
    }

    @Override
    public void deleteByUser(User user) {
        List<Notification> list = repository.getByTouserOrderByInitTimeDesc(user);
        repository.deleteInBatch(list);
    }
}
