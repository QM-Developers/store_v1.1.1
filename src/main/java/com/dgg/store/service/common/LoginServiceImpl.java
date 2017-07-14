package com.dgg.store.service.common;

import com.dgg.store.dao.common.LoginDao;
import com.dgg.store.util.core.constant.Constant;
import com.dgg.store.util.core.constant.LoginConstant;
import com.dgg.store.util.core.shiro.CryptographyUtil;
import com.dgg.store.util.core.token.TokenUtil;
import com.dgg.store.util.vo.core.LoginRepVO;
import com.dgg.store.util.vo.core.LoginVO;
import com.dgg.store.util.vo.core.ResultVO;
import com.dgg.store.util.vo.core.SessionVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LoginServiceImpl implements LoginService
{
    @Autowired
    private LoginDao dao;

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

        return sessionVO;
    }

    @Override
    public ResultVO login(LoginVO loginVO)
    {
        LoginVO condition = new LoginVO();
        condition.setUserPhone(loginVO.getUserPhone());
        condition.setMyTeamId(loginVO.getMyTeamId());
        LoginRepVO result = dao.findLoginUser(condition);

        if (result == null)
            return new ResultVO(LoginConstant.ACCOUNT_NOT_FOUND);
        if (!Constant.USER_STATE_2.equals(result.getUserStatus()))
            return new ResultVO(LoginConstant.NOT_REGISTER);
        if (!CryptographyUtil.md5(loginVO.getUserPassword(),Constant.SALT).equals(result.getUserPassword()))
            return new ResultVO(LoginConstant.NO_ACCESS);

        return new ResultVO(Constant.REQUEST_SUCCESS, TokenUtil.getToken(), result);
    }

}
