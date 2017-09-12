package com.dgg.store.mapper;

import com.dgg.store.util.vo.core.LoginRepVO;
import com.dgg.store.util.vo.core.LoginVO;
import org.apache.ibatis.annotations.Param;

public interface LoginMapper
{
    LoginRepVO findLoginUser(LoginVO loginVO);

    int updateLoginInfo(@Param("userId") String userId,@Param("deviceToken") String deviceToken);

    String getDeviceToken(@Param("userId") String userId);
}
