package com.dgg.store.dao.user;

import com.dgg.store.mapper.UploadMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class UserUploadDaoImpl implements UserUploadDao
{
    @Autowired
    private UploadMapper mapper;

    @Override
    public int updateUserImg(String userId, String fileName)
    {
        return mapper.updateUserImg(userId,fileName);
    }

}
