package com.dgg.store.service.common;

import com.dgg.store.dao.common.PasswordDao;
import com.dgg.store.netease.CloudMessageUtil;
import com.dgg.store.util.core.constant.Constant;
import com.dgg.store.util.core.shiro.CryptographyUtil;
import com.dgg.store.util.vo.core.LoginRepVO;
import com.dgg.store.util.vo.core.PasswordConstant;
import com.dgg.store.util.vo.core.ResultVO;
import com.dgg.store.util.vo.core.SessionVO;
import com.dgg.store.util.vo.password.PasswordVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.IOException;

@Service
public class PasswordServiceImpl implements PasswordService
{
    @Autowired
    private PasswordDao dao;

    @Override
    public ResultVO getPasswordVerify(PasswordVO passwordVO)
    {
        PasswordVO condition = new PasswordVO();
        condition.setUserPhone(passwordVO.getUserPhone());
        condition.setMyTeamId(passwordVO.getMyTeamId());
        LoginRepVO result = dao.findLoginRepVO(condition);
        boolean flag = false;

        if (result == null)
            return new ResultVO(PasswordConstant.USER_NOT_FIND);

        try
        {
            flag = CloudMessageUtil.sendCode(result.getUserPhone());
        } catch (IOException e)
        {
            e.printStackTrace();
        }

        return new ResultVO(flag == false ? Constant.REQUEST_FAILED : Constant.REQUEST_SUCCESS, null, result);
    }

    @Override
    public ResultVO passwordVerify(PasswordVO passwordVO)
    {
        boolean flag = false;
        try
        {
            flag = CloudMessageUtil.verifyCode(passwordVO.getUserPhone(),passwordVO.getVerify());
        } catch (IOException e)
        {
            e.printStackTrace();
        }

        if(!flag)
            return new ResultVO(Constant.REQUEST_FAILED);

        PasswordVO condition = new PasswordVO();
        condition.setUserPhone(passwordVO.getUserPhone());
        condition.setMyTeamId(passwordVO.getMyTeamId());
        LoginRepVO result = dao.findLoginRepVO(condition);
        if (result == null)
            return new ResultVO(PasswordConstant.USER_NOT_FIND);

        return new ResultVO(flag == false ? Constant.REQUEST_FAILED : Constant.REQUEST_SUCCESS, null, result);
    }

    @Override
    public ResultVO updatePassword(SessionVO sessionVO, PasswordVO passwordVO)
    {
        PasswordVO condition = new PasswordVO();
        condition.setMyTeamId(sessionVO.getMyTeamId());
        condition.setUserId(passwordVO.getUserId());
        condition.setUserPassword(CryptographyUtil.md5(passwordVO.getUserPassword(),Constant.SALT));

        int result = dao.updatePassword(condition);

        ResultVO resultVO = new ResultVO(result != 1?Constant.REQUEST_FAILED:Constant.REQUEST_SUCCESS);

        return resultVO;
    }


}
