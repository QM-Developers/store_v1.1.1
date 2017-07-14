package com.dgg.store.service.user;

import com.alibaba.fastjson.JSONObject;
import com.dgg.store.dao.user.UserRegisterDao;
import com.dgg.store.util.core.constant.Constant;
import com.dgg.store.util.core.shiro.CryptographyUtil;
import com.dgg.store.util.core.token.TokenUtil;
import com.dgg.store.util.pojo.User;
import com.dgg.store.util.vo.core.LoginRepVO;
import com.dgg.store.util.vo.core.SessionVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserRegisterServiceImpl implements UserRegisterService
{
    @Autowired
    private UserRegisterDao dao;

    @Override
    public Object updateUserStatus(SessionVO sessionVO, User user)
    {
        String userArea = user.getUserArea();
        String userPassword = user.getUserPassword();
        String HXName = user.getHxName();
        String HXPassword = user.getHxPassword();

        user = dao.findUserByPhone(user.getMyTeamId(), user.getUserPhone());

        if (user == null)
            return 0;

        if (Constant.USER_STATE_1.equals(user.getUserStatus()))
        {
            String token = TokenUtil.getToken();

            user.setUserStatus(Constant.USER_STATE_2);
            user.setUserArea(userArea);
            user.setUserPassword(CryptographyUtil.md5(userPassword, Constant.SALT));
            user.setHxName(HXName);
            user.setHxPassword(HXPassword);
            user.setToken(token);
            if (0 == dao.updateUserById(user))
                return 0;
        }

        LoginRepVO result = new LoginRepVO(user);

        return result;
    }

    @Override
    public Object findUserStatus(SessionVO sessionVO, User user)
    {
        JSONObject obj = new JSONObject();

        obj.put("status", dao.findUserByPhone(sessionVO.getMyTeamId(), user.getUserPhone()) == null ? 1 : 0);

        return obj;
    }

}
