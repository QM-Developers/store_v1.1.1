package com.dgg.store.dao.common;

import com.dgg.store.mapper.LoginMapper;
import com.dgg.store.util.vo.core.LoginVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class LoginDaoImpl implements LoginDao
{
    @Autowired
    private LoginMapper mapper;


    @Override
    public Object findLoginUser(LoginVO loginVO)
    {
        return mapper.findLoginUser(loginVO);
    }

    @Override
    public int updateToken(String loginName, String token)
    {
        return mapper.updateToken(loginName,token);
    }

    @Override
    public Object findLoginUserByPhone(LoginVO loginVO)
    {
        return mapper.findLoginUserByPhone(loginVO);
    }

}
