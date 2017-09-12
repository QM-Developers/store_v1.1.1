package com.dgg.store.service.store;

import com.alibaba.fastjson.JSONObject;
import com.dgg.store.dao.store.MyTeamDao;
import com.dgg.store.util.core.constant.Constant;
import com.dgg.store.util.vo.core.ResultVO;
import com.dgg.store.util.vo.core.SessionVO;
import com.dgg.store.util.vo.manage.DepartmentVO;
import com.dgg.store.util.vo.team.MemberVO;
import com.dgg.store.util.vo.team.TeamDepartmentVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MyTeamServiceImpl implements MyTeamService
{
    @Autowired
    private MyTeamDao dao;

    @Override
    public ResultVO findDepartmentDetail(SessionVO sessionVO, TeamDepartmentVO department)
    {
        department.setMyTeamId(sessionVO.getMyTeamId());
        TeamDepartmentVO result = dao.findDepartmentDetail(department);

        ResultVO resultVO = new ResultVO(result == null ? 0 : 1, sessionVO.getToken(), result);

        return resultVO;
    }

    @Override
    public ResultVO findDepartmentMember(SessionVO sessionVO, MemberVO member)
    {
        List<MemberVO> result = dao.findDepartmentMember(member);

        ResultVO resultVO = new ResultVO(1, sessionVO.getToken(), result);

        return resultVO;
    }

    @Override
    public ResultVO findMemberByNameOrPhone(SessionVO sessionVO, MemberVO member)
    {
        member.setMyTeamId(sessionVO.getMyTeamId());
        List<MemberVO> result = dao.findMemberByNameOrPhone(member);

        ResultVO resultVO = new ResultVO(1, sessionVO.getToken(), result);

        return resultVO;
    }

    @Override
    public String listTeamDepartment(SessionVO sessionVO)
    {
        List<TeamDepartmentVO> result = dao.listTeamDepartment(sessionVO.getMyTeamId());

        return JSONObject.toJSONString(new ResultVO(Constant.REQUEST_SUCCESS, sessionVO.getToken(), result));
    }

    @Override
    public String getDepartmentMember(SessionVO sessionVO, MemberVO member)
    {
        List<MemberVO> result = dao.findDepartmentMember(member);
        MemberVO memberVO = null;
        if (result.size() > 0)
            memberVO = result.get(0);

        return JSONObject.toJSONString(new ResultVO(Constant.REQUEST_SUCCESS, sessionVO.getToken(), memberVO));
    }

    @Override
    public String listDepartmentAndMember(SessionVO sessionVO)
    {
        List<TeamDepartmentVO> result = dao.listTeamDepartment(sessionVO.getMyTeamId());
        MemberVO member = new MemberVO();
        for (TeamDepartmentVO department : result)
        {
            member.setTeamDepartmentId(department.getTeamDepartmentId());
            department.setMemberList(dao.findDepartmentMember(member));
        }

        return JSONObject.toJSONString(new ResultVO(Constant.REQUEST_SUCCESS, sessionVO.getToken(), result));
    }

}
