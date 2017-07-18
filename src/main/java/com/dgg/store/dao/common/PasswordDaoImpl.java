package com.dgg.store.dao.common;

import com.dgg.store.mapper.PasswordMapper;
import com.dgg.store.util.vo.core.LoginRepVO;
import com.dgg.store.util.vo.password.PasswordVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class PasswordDaoImpl implements PasswordDao
{
    @Autowired
    private PasswordMapper mapper;

    @Override
    public LoginRepVO findLoginRepVO(PasswordVO condition)
    {
        return mapper.findLoginRepVO(condition);
    }

    @Override
    public Integer updatePassword(PasswordVO condition)
    {
        return mapper.updatePassword(condition);
    }
}
