package com.dgg.store.service.store;

import com.dgg.store.dao.store.ManageDao;
import com.dgg.store.util.core.constant.Constant;
import com.dgg.store.util.core.shiro.CryptographyUtil;
import com.dgg.store.util.vo.LoginVO;
import com.dgg.store.util.vo.core.ResultVO;
import com.dgg.store.util.vo.core.SessionVO;
import com.dgg.store.util.vo.manage.ManageMenuVO;
import com.dgg.store.util.vo.manage.MemberVO;
import com.dgg.store.util.vo.permission.QMPermissionVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class ManageServiceImpl implements ManageService
{
    @Autowired
    private ManageDao dao;

    @Override
    public ResultVO findLoginUser(SessionVO sessionVO, LoginVO loginVO)
    {
        loginVO.setUserPassword(CryptographyUtil.md5(loginVO.getUserPassword(), Constant.SALT));
        int result = dao.findLoginUser(loginVO);

        ResultVO resultVO = new ResultVO(1,sessionVO.getToken(),result);

        return resultVO;
    }

    @Override
    public ResultVO findTeamAndMemberCount(SessionVO sessionVO)
    {
        List<ManageMenuVO> result = new ArrayList<>();
        result.add(dao.findTeamAndMemberCount(sessionVO.getMyTeamId()));
        result.addAll(dao.findDepartmentAndMemberCount(sessionVO.getMyTeamId()));

        ResultVO resultVO = new ResultVO(1,sessionVO.getToken(),result);

        return resultVO;
    }

    @Override
    public ResultVO findMemberList(SessionVO sessionVO, MemberVO memberVO)
    {
        return null;
    }
}
