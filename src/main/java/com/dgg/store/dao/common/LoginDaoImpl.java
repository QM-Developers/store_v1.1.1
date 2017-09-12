package com.dgg.store.dao.common;

import com.dgg.store.mapper.LoginMapper;
import com.dgg.store.util.vo.core.LoginRepVO;
import com.dgg.store.util.vo.core.LoginVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class LoginDaoImpl implements LoginDao
{
    @Autowired
    private LoginMapper mapper;


    @Override
    public LoginRepVO findLoginUser(LoginVO loginVO)
    {
        return mapper.findLoginUser(loginVO);
    }

    @Override
    public int updateLoginInfo(String userId,String deviceToken)
    {
        return mapper.updateLoginInfo(userId,deviceToken);
    }

    @Override
    public String getDeviceToken(String userId)
    {
        return mapper.getDeviceToken(userId);
    }
}
