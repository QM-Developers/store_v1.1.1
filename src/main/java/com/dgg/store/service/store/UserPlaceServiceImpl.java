package com.dgg.store.service.store;

import com.dgg.store.dao.store.UserPlaceDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserPlaceServiceImpl implements UserPlaceService
{
    @Autowired
    private UserPlaceDao dao;


}
