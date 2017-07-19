package com.dgg.store.service.common;

import com.dgg.store.dao.common.RegisterDao;
import com.dgg.store.netease.CloudMessageUtil;
import com.dgg.store.util.core.constant.Constant;
import com.dgg.store.util.core.constant.LoginConstant;
import com.dgg.store.util.core.constant.RegisterConstant;
import com.dgg.store.util.core.generator.IDGenerator;
import com.dgg.store.util.core.shiro.CryptographyUtil;
import com.dgg.store.util.core.upload.UploadFileUtil;
import com.dgg.store.util.vo.core.LoginRepVO;
import com.dgg.store.util.vo.core.ResultVO;
import com.dgg.store.util.vo.core.SessionVO;
import com.dgg.store.util.vo.manage.PerUserReVO;
import com.dgg.store.util.vo.register.RegisterVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@Service
public class RegisterServiceImpl implements RegisterService
{
    @Autowired
    private RegisterDao dao;

    @Override
    public ResultVO insertCardHand(SessionVO sessionVO, MultipartFile file, String realPath)
    {
        String uuid = IDGenerator.generator();
        String fileName = saveImage(file, realPath, uuid);
        int result = Constant.STR_ADD_FAILED.equals(fileName) ? 2 : 1;
        if (result == 1)
        {
            RegisterVO condition = new RegisterVO();
            condition.setUserId(sessionVO.getUserId());
            condition.setCardHand(fileName);
            result = dao.updateUserData(condition) == 1 ? 1 : 2;
        }

        ResultVO resultVO = new ResultVO(result, sessionVO.getToken(), fileName);

        return resultVO;
    }

    @Override
    public ResultVO insertCardBack(SessionVO sessionVO, MultipartFile file, String realPath)
    {
        String uuid = IDGenerator.generator();
        String fileName = saveImage(file, realPath, uuid);
        int result = Constant.STR_ADD_FAILED.equals(fileName) ? 2 : 1;
        if (result == 1)
        {
            RegisterVO condition = new RegisterVO();
            condition.setUserId(sessionVO.getUserId());
            condition.setCardBack(fileName);
            result = dao.updateUserData(condition) == 1 ? 1 : 2;
        }

        ResultVO resultVO = new ResultVO(result, sessionVO.getToken(), fileName);

        return resultVO;
    }

    @Override
    public ResultVO insertCardFront(SessionVO sessionVO, MultipartFile file, String realPath)
    {
        String uuid = IDGenerator.generator();
        String fileName = saveImage(file, realPath, uuid);
        int result = Constant.STR_ADD_FAILED.equals(fileName) ? 2 : 1;
        if (result == 1)
        {
            RegisterVO condition = new RegisterVO();
            condition.setUserId(sessionVO.getUserId());
            condition.setCardFront(fileName);
            result = dao.updateUserData(condition) == 1 ? 1 : 2;
        }

        ResultVO resultVO = new ResultVO(result, sessionVO.getToken(), fileName);

        return resultVO;
    }

    @Override
    public ResultVO updateRegisterUser(SessionVO sessionVO, RegisterVO registerVO)
    {
        int result = 1;
        int i = 0;
        int count = 2;
        LoginRepVO loginRepVO = null;

        while (result > 0)
        {
            switch (i)
            {
                case 0:
                    registerVO.setUserPassword(CryptographyUtil.md5(registerVO.getUserPassword(), Constant.SALT));
                    result = dao.updateUserData(registerVO);
                    break;
                case 1:
                    RegisterVO condition = new RegisterVO();
                    condition.setUserId(registerVO.getUserId());
                    loginRepVO = dao.findLoginRepVO(condition);
                    result = loginRepVO == null ? 0 : 1;
                    break;
                default:
                    result = 0;
                    break;
            }
            i++;
        }

        if (i - 1 < count)
            throw new RuntimeException(Constant.STR_ADD_FAILED);
        else
            result = 1;

        ResultVO resultVO = new ResultVO(result, Constant.EMPTY, loginRepVO);

        return resultVO;
    }

    @Override
    public ResultVO getRegisterVerify(RegisterVO registerVO)
    {
        LoginRepVO result = dao.findLoginRepVO(registerVO);
        if (result == null)
            return new ResultVO(RegisterConstant.NOT_RECORD);
        if (Constant.USER_STATE_2.equals(result.getUserStatus()))
            return new ResultVO(RegisterConstant.REGISTERED);

        boolean flag = false;

        try
        {
            flag = CloudMessageUtil.sendCode(registerVO.getUserPhone());
        } catch (IOException e)
        {
            e.printStackTrace();
        }

        return new ResultVO(flag == false ? Constant.REQUEST_FAILED : Constant.REQUEST_SUCCESS);
    }

    @Override
    public ResultVO registerVerify(RegisterVO registerVO)
    {
        boolean flag = false;
        LoginRepVO result = null;

        try
        {
            flag = CloudMessageUtil.verifyCode(registerVO.getUserPhone(), registerVO.getVerify());
        } catch (IOException e)
        {
            e.printStackTrace();
        }

        if (flag)
        {
            RegisterVO condition = new RegisterVO();
            condition.setMyTeamId(registerVO.getMyTeamId());
            condition.setUserPhone(registerVO.getUserPhone());
            result = dao.findLoginRepVO(condition);
        }

        return new ResultVO(result == null ? Constant.REQUEST_FAILED : Constant.REQUEST_SUCCESS, null, result);
    }

    private String saveImage(MultipartFile file, String realPath, String uuid)
    {
        StringBuffer path = new StringBuffer();
        String fileName = null;

        try
        {
            path.append(Constant.USER_ID_CARD_PATH);
            fileName = UploadFileUtil.doUpload(file, path.toString(), realPath, uuid);
        } catch (IOException e)
        {
            e.printStackTrace();
            fileName = Constant.STR_ADD_FAILED;
        }

        return fileName;
    }
}
