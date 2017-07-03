package com.dgg.store.service.common;

import com.dgg.store.dao.common.LoginDao;
import com.dgg.store.util.core.constant.Constant;
import com.dgg.store.util.core.shiro.CryptographyUtil;
import com.dgg.store.util.core.token.TokenUtil;
import com.dgg.store.util.vo.LoginRepVO;
import com.dgg.store.util.vo.LoginVO;
import com.dgg.store.util.vo.core.SessionVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LoginServiceImpl implements LoginService
{
    @Autowired
    private LoginDao dao;

    @Override
    public Object updateAndFindLoginUser(LoginVO loginVO)
    {
        loginVO.setUserPassword(CryptographyUtil.md5(loginVO.getUserPassword(), Constant.SALT));
        loginVO.setMyTeamId(loginVO.getMyTeamId());
        LoginRepVO vo = (LoginRepVO) dao.findLoginUser(loginVO);
        boolean tokenFlag = loginVO.getToken() == null || "".equals(loginVO.getToken());

        String token = TokenUtil.getToken();

        if (vo != null && tokenFlag)
        {
            vo.setMyTeamId(vo.getMyTeamId());
            if (dao.updateToken(loginVO.getUserPhone(),token) == 0)
                throw new RuntimeException("更新 token 出错");
            vo.setToken(token);
        }

        return vo == null ? 0 : vo;
    }

    @Override
    public Object findUserByLogin(LoginVO loginVO)
    {
        loginVO.setMyTeamId(loginVO.getMyTeamId());
        loginVO.setUserPassword(CryptographyUtil.md5(loginVO.getUserPassword(), Constant.SALT));
        LoginRepVO vo = (LoginRepVO) dao.findLoginUser(loginVO);

        if (vo == null)
            return null;

        SessionVO sessionVO = new SessionVO();

        sessionVO.setRoleId(vo.getRoleId());
        sessionVO.setUserId(vo.getUserId());
        sessionVO.setUserPhone(vo.getUserPhone());
        sessionVO.setUserName(vo.getUserName());
        sessionVO.setUserImg(vo.getUserImg());
        sessionVO.setMyTeamId(vo.getMyTeamId());
        sessionVO.setDepartmentId(vo.getDepartmentId());
        sessionVO.setDepartmentType(vo.getDepartmentType());

        return sessionVO;
    }

    @Override
    public Object LoginByVerify(LoginVO loginVO)
    {
        LoginRepVO vo = (LoginRepVO) dao.findLoginUserByPhone(loginVO);
        boolean tokenFlag = loginVO.getToken() == null || "".equals(loginVO.getToken());

        String token = TokenUtil.getToken();
        token += System.currentTimeMillis();

        if (vo != null && tokenFlag)
        {
            vo.setMyTeamId(vo.getMyTeamId());

            if (dao.updateToken(loginVO.getUserPhone(),token) == 0)
                throw new RuntimeException("更新 token 出错");

            vo.setToken(token);
        }

        return vo == null ? 0 : vo;
    }
}
