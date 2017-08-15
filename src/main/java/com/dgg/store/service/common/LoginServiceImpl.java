package com.dgg.store.service.common;

import com.alibaba.fastjson.JSONObject;
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

import javax.servlet.http.HttpSession;

@Service
public class LoginServiceImpl implements LoginService
{
    @Autowired
    private LoginDao dao;

    @Override
    public String findUserByLogin(HttpSession session, LoginVO loginVO)
    {
        loginVO.setMyTeamId(loginVO.getMyTeamId());
        LoginRepVO result = dao.findLoginUser(loginVO);

        if (result == null)
            return JSONObject.toJSONString(new ResultVO(LoginConstant.ACCOUNT_NOT_FOUND));
        if (!Constant.USER_STATE_2.equals(result.getUserStatus()))
            return JSONObject.toJSONString(new ResultVO(LoginConstant.NOT_REGISTER));
        if (!CryptographyUtil.md5(loginVO.getUserPassword(), Constant.SALT).equals(result.getUserPassword()))
            return JSONObject.toJSONString(new ResultVO(LoginConstant.NO_ACCESS));

        SessionVO sessionVO = new SessionVO();

        sessionVO.setRoleId(result.getRoleId());
        sessionVO.setUserId(result.getUserId());
        sessionVO.setUserPhone(result.getUserPhone());
        sessionVO.setUserName(result.getUserName());
        sessionVO.setUserImg(result.getUserImg());
        sessionVO.setMyTeamId(result.getMyTeamId());
        sessionVO.setDepartmentId(result.getDepartmentId());

        session.setAttribute(Constant.LOGININFO, sessionVO);

        return JSONObject.toJSONString(new ResultVO(LoginConstant.SUCCESS));
    }

    @Override
    public String updateLoginInfo(LoginVO loginVO)
    {
        LoginVO condition = new LoginVO();
        condition.setUserPhone(loginVO.getUserPhone());
        condition.setMyTeamId(loginVO.getMyTeamId());
        LoginRepVO result = dao.findLoginUser(condition);

        if (result == null)
            return JSONObject.toJSONString(new ResultVO(LoginConstant.ACCOUNT_NOT_FOUND));
        if (!Constant.USER_STATE_2.equals(result.getUserStatus()))
            return JSONObject.toJSONString(new ResultVO(LoginConstant.NOT_REGISTER));
        if (!CryptographyUtil.md5(loginVO.getUserPassword(), Constant.SALT).equals(result.getUserPassword()))
            return JSONObject.toJSONString(new ResultVO(LoginConstant.NO_ACCESS));

        result.setUserPhone(null);
        if (dao.updateLoginInfo(result.getUserId()) < 1)
            throw new RuntimeException(Constant.STR_ADD_FAILED);

        return JSONObject.toJSONString(new ResultVO(Constant.REQUEST_SUCCESS, TokenUtil.getToken(), result));
    }

}
