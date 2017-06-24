package com.dgg.store.service.user;

import com.dgg.store.dao.user.UserUploadDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserUploadServiceImpl implements UserUploadService
{
    @Autowired
    private UserUploadDao dao;

    @Override
    public int updateUserImg(String userId, String fileName)
    {
        return dao.updateUserImg(userId,fileName);
    }
}
