package com.dgg.store.service.store;

import com.dgg.store.dao.store.MyTeamDao;
import com.dgg.store.util.core.constant.Constant;
import com.dgg.store.util.core.generator.IDGenerator;
import com.dgg.store.util.pojo.MyTeam;
import com.dgg.store.util.pojo.TeamDepartment;
import com.dgg.store.util.vo.core.ResultVO;
import com.dgg.store.util.vo.core.SearchVO;
import com.dgg.store.util.vo.core.SessionVO;
import com.dgg.store.util.vo.core.TreeVO;
import com.dgg.store.util.vo.team.DepartmentMemberVO;
import com.dgg.store.util.vo.team.MyTeamVO;
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
    public ResultVO insertMyTeam(SessionVO sessionVO, MyTeamVO teamVO)
    {
        teamVO.setMyTeamPid(sessionVO.getMyTeamId());
        teamVO.setMyTeamId(IDGenerator.generator());

        TeamDepartment[] departments = getDefaultDepartment(teamVO.getMyTeamId());

        Integer result = dao.insertMyTeam(teamVO);
        int i = 0;
        while (result > 0 && i < departments.length)
            result = dao.insertDepartment(departments[i++]);
        if (result < 1)
            throw new RuntimeException(Constant.STR_ADD_FAILED);

        ResultVO resultVO = new ResultVO(result, sessionVO.getToken());

        return resultVO;
    }

    private TeamDepartment[] getDefaultDepartment(String myTeamId)
    {
        TeamDepartment[] departments = new TeamDepartment[4];
        departments[0] = new TeamDepartment(IDGenerator.generator(), myTeamId, Constant.DEPARTMENT_MANAGER, Constant.STR_COMPANY_MANAGER);
        departments[1] = new TeamDepartment(IDGenerator.generator(), myTeamId, Constant.DEPARTMENT_BUSINESS, Constant.STR_COMPANY_BUSINESS);
        departments[2] = new TeamDepartment(IDGenerator.generator(), myTeamId, Constant.DEPARTMENT_FINANCIAL, Constant.STR_COMPANY_FINANCIAL);
        departments[3] = new TeamDepartment(IDGenerator.generator(), myTeamId, Constant.DEPARTMENT_PERSONNEL, Constant.STR_COMPANY_PERSONNEL);

        return departments;
    }

    @Override
    public ResultVO insertDepartment(SessionVO sessionVO, TeamDepartment department)
    {
        department.setMyTeamId(sessionVO.getMyTeamId());
        department.setTeamDepartmentId(IDGenerator.generator());

        Integer result = dao.insertDepartment(department);
        if (result < 1)
            throw new RuntimeException(Constant.STR_ADD_FAILED);

        ResultVO resultVO = new ResultVO(result, sessionVO.getToken());

        return resultVO;
    }

    @Override
    public ResultVO findDepartmentList(SessionVO sessionVO, MyTeam team)
    {
        List<TeamDepartment> result = dao.findDepartmentList(team.getMyTeamId() == null ? sessionVO.getMyTeamId() : team.getMyTeamId());

        ResultVO resultVO = new ResultVO(result.size() < 1 ? 0 : 1, sessionVO.getToken(), result);

        return resultVO;
    }

    @Override
    public ResultVO findDepartmentInfo(SessionVO sessionVO, TeamDepartment department)
    {
        return null;
    }

    @Override
    public ResultVO insertDepartmentMember(SessionVO sessionVO, DepartmentMemberVO memberVO)
    {
        memberVO.setUserId(IDGenerator.generator());
        memberVO.setUserStatus(Constant.USERST_1);
        memberVO.setRoleId(Constant.ROLE_TEAM_PERSONAL);

        Integer result = dao.insertDepartmentMember(memberVO);
        if (result < 1)
            throw new RuntimeException(Constant.STR_ADD_FAILED);

        ResultVO resultVO = new ResultVO(result, sessionVO.getToken());

        return resultVO;
    }

    @Override
    public ResultVO findCompanyList(SessionVO sessionVO)
    {
        List<MyTeam> result = dao.findCompanyList(sessionVO.getMyTeamId());

        ResultVO resultVO = new ResultVO(result.size() < 1 ? 0 : 1, sessionVO.getToken(), result);

        return resultVO;
    }

    @Override
    public ResultVO findTeamsByKeyword(SessionVO sessionVO, SearchVO searchVO)
    {
        List<SearchVO> result = dao.findTeamsByKeyword(searchVO.getKeyword());

        ResultVO resultVO = new ResultVO(result.size() < 1 ? 0 : 1, sessionVO.getToken(), result);

        return resultVO;
    }

    @Override
    public ResultVO findCompanyInfo(SessionVO sessionVO, MyTeamVO team)
    {
        MyTeamVO result = dao.findCompanyInfo(team.getMyTeamId());
        MyTeamVO principal = dao.findCompanyPrincipal(team.getMyTeamId(), Constant.DEPARTMENT_MANAGER, Constant.ROLE_TEAM_PERSONAL);

        if (principal != null)
        {
            result.setUserName(principal.getUserName());
            result.setUserPhone(principal.getUserPhone());
            result.setUserId(principal.getUserId());
        }

        ResultVO resultVO = new ResultVO(result == null ? 0 : 1, sessionVO.getToken(), result);

        return resultVO;
    }

    @Override
    public ResultVO updatePrincipal(SessionVO sessionVO, DepartmentMemberVO memberVO)
    {
        Integer result = 1;
        int i = 0;
        int count = 2;

        while (result > 0)
        {
            switch (i)
            {
                case 0:
                    result = dao.updateRoleByDepartment(memberVO.getTeamDepartmentId(), Constant.ROLE_TEAM_PERSONAL);
                    break;
                case 1:
                    result = dao.updateRoleByUser(memberVO.getUserId(), memberVO.getRoleId());
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

        ResultVO resultVO = new ResultVO(result, sessionVO.getToken());

        return resultVO;
    }

    @Override
    public ResultVO findCCDepartmentList(SessionVO sessionVO, MyTeam team)
    {
        List<TeamDepartment> result = dao.findCCDepartmentList(team.getMyTeamId() == null ? sessionVO.getMyTeamId() : team.getMyTeamId(), Constant.STR_CORPORATION_MANAGER);

        ResultVO resultVO = new ResultVO(result.size() < 1 ? 0 : 1, sessionVO.getToken(), result);

        return resultVO;
    }

    @Override
    public ResultVO findDepartmentMember(SessionVO sessionVO, DepartmentMemberVO department)
    {
        List<DepartmentMemberVO> result = dao.findDepartmentMember(department);

        ResultVO resultVO = new ResultVO(result.size() < 1 ? 0 : 1, sessionVO.getToken(), result);

        return resultVO;
    }

    @Override
    public ResultVO findDepartmentMemberInfo(SessionVO sessionVO, DepartmentMemberVO memberVO)
    {
        DepartmentMemberVO result = dao.findDepartmentMemberInfo(memberVO.getUserId());

        ResultVO resultVO = new ResultVO(result == null ? 0 : 1, sessionVO.getToken(), result);

        return resultVO;
    }

    @Override
    public ResultVO findCDepartmentList(SessionVO sessionVO, MyTeamVO teamVO)
    {
        List<TeamDepartmentVO> result = dao.findCDepartmentList(teamVO.getMyTeamId(), Constant.ROLE_TEAM_PERSONAL);

        ResultVO resultVO = new ResultVO(result.size() < 1 ? 0 : 1, sessionVO.getToken(), result);

        return resultVO;
    }

    @Override
    public ResultVO updateDepartment(SessionVO sessionVO, DepartmentMemberVO memberVO)
    {
        memberVO.setRoleId(Constant.ROLE_TEAM_PERSONAL);
        Integer result = dao.updateDepartment(memberVO);

        ResultVO resultVO = new ResultVO(result, sessionVO.getToken());

        return resultVO;
    }

    @Override
    public ResultVO findCorporationTree(SessionVO sessionVO)
    {
        MyTeamVO teamVO = dao.findCompanyInfo(sessionVO.getMyTeamId());
        TreeVO result = new TreeVO(teamVO.getMyTeamId(), teamVO.getMyTeamName());

        if (result != null)
        {
            result.setChildren(findCompanyTree(sessionVO.getMyTeamId()));
            result.getChildren().addAll(dao.findDepartmentTree(sessionVO.getMyTeamId()));
        }
        ResultVO resultVO = new ResultVO(result == null ? 0 : 1, sessionVO.getToken(), result);

        return resultVO;
    }

    private List<TreeVO> findCompanyTree(String teamId)
    {
        List<TreeVO> tree = dao.findChildTeamTree(teamId);

        if (tree.size() > 0)
            for (TreeVO t : tree)
            {
                t.setChildren(dao.findDepartmentTree(t.getId()));
                t.getChildren().addAll(findCompanyTree(t.getId()));
            }
        return tree;
    }


}
