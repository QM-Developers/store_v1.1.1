package com.dgg.store.mapper;

import com.dgg.store.util.vo.core.LoginVO;
import org.apache.ibatis.annotations.Param;

public interface LoginMapper
{

    int updateToken(@Param("loginName") String loginName,@Param("token") String token);

    Object findLoginUser(LoginVO loginVO);

    Object findLoginUserByPhone(LoginVO loginVO);
}
