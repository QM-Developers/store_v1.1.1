package com.dgg.store.dao.common;

import com.dgg.store.mapper.RegisterMapper;
import com.dgg.store.util.vo.core.LoginRepVO;
import com.dgg.store.util.vo.register.RegisterVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class RegisterDaoImpl implements RegisterDao
{
    @Autowired
    private RegisterMapper mapper;

    @Override
    public int updateUserData(RegisterVO condition)
    {
        return mapper.updateUserData(condition);
    }

    @Override
    public LoginRepVO findLoginRepVO(RegisterVO condition)
    {
        return mapper.findLoginRepVO(condition);
    }
}
