package com.dgg.store.controller.common;

import com.dgg.store.service.common.PasswordService;
import com.dgg.store.util.core.constant.Constant;
import com.dgg.store.util.vo.core.ResultVO;
import com.dgg.store.util.vo.core.SessionVO;
import com.dgg.store.util.vo.password.PasswordVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

/**
 * 用户密码控制器
 */
@Controller
public class PasswordController
{
    @Autowired
    private PasswordService service;

    /**
     * 获取验证码
     *
     * @param passwordVO 用户信息
     * @return 操作的结果
     */
    @RequestMapping(value = "retrieveGetPasswordVerify", method = RequestMethod.POST)
    @ResponseBody
    public ResultVO getPasswordVerify(PasswordVO passwordVO)
    {
        return service.getPasswordVerify(passwordVO);
    }

    /**
     * 验证短信验证码
     *
     * @param passwordVO 验证码
     * @return 操作的结果
     */
    @RequestMapping(value = "retrievePasswordVerify", method = RequestMethod.POST)
    @ResponseBody
    public ResultVO passwordVerify(PasswordVO passwordVO)
    {
        return service.passwordVerify(passwordVO);
    }

    /**
     * 修改密码
     *
     * @param request    用户参数
     * @param passwordVO 密码信息
     * @return 操作的结果
     */
    @RequestMapping(value = "updatePassword", method = RequestMethod.POST)
    @ResponseBody
    public ResultVO updatePassword(HttpServletRequest request, PasswordVO passwordVO)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.updatePassword(sessionVO, passwordVO);
    }
}
