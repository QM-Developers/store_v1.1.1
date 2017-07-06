package com.dgg.store.dao.store;

import com.dgg.store.mapper.MyTeamMapper;
import com.dgg.store.util.pojo.MyTeam;
import com.dgg.store.util.pojo.TeamDepartment;
import com.dgg.store.util.vo.core.SearchVO;
import com.dgg.store.util.vo.core.TreeVO;
import com.dgg.store.util.vo.team.DepartmentMemberVO;
import com.dgg.store.util.vo.team.MyTeamVO;
import com.dgg.store.util.vo.team.TeamDepartmentVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class MyTeamDaoImpl implements MyTeamDao
{
    @Autowired
    private MyTeamMapper mapper;

    @Override
    public Integer insertMyTeam(MyTeamVO teamVO)
    {
        return mapper.insertMyTeam(teamVO);
    }

    @Override
    public Integer insertDepartment(TeamDepartment department)
    {
        return mapper.insertDepartment(department);
    }

    @Override
    public List<TeamDepartment> findDepartmentList(String myTeamId)
    {
        return mapper.findDepartmentList(myTeamId);
    }

    @Override
    public Integer insertDepartmentMember(DepartmentMemberVO memberVO)
    {
        return mapper.insertDepartmentMember(memberVO);
    }

    @Override
    public List<MyTeam> findCompanyList(String myTeamId)
    {
        return mapper.findCompanyList(myTeamId);
    }

    @Override
    public List<SearchVO> findTeamsByKeyword(String keyword)
    {
        return mapper.findTeamsByKeyword(keyword);
    }

    @Override
    public MyTeamVO findCompanyInfo(String myTeamId)
    {
        return mapper.findCompanyInfo(myTeamId);
    }

    @Override
    public Integer updateRoleByDepartment(String teamDepartmentId, String roleTeamPersonal)
    {
        return mapper.updateRoleByDepartment(teamDepartmentId,roleTeamPersonal);
    }

    @Override
    public Integer updateRoleByUser(String userId, String roleId)
    {
        return mapper.updateRoleByUser(userId,roleId);
    }

    @Override
    public List<TeamDepartment> findCCDepartmentList(String s, String departmentName)
    {
        return mapper.findCCDepartmentList(s,departmentName);
    }

    @Override
    public List<DepartmentMemberVO> findDepartmentMember(DepartmentMemberVO department)
    {
        return mapper.findDepartmentMember(department);
    }

    @Override
    public DepartmentMemberVO findDepartmentMemberInfo(String userId)
    {
        return mapper.findDepartmentMemberInfo(userId);
    }

    @Override
    public List<TeamDepartmentVO> findCDepartmentList(String myTeamId,String roleId)
    {
        return mapper.findCDepartmentList(myTeamId,roleId);
    }

    @Override
    public Integer updateDepartment(DepartmentMemberVO memberVO)
    {
        return mapper.updateDepartment(memberVO);
    }

    @Override
    public Integer findDepartmentMemberCount(String teamDepartmentId)
    {
        return mapper.findDepartmentMemberCount(teamDepartmentId);
    }

    @Override
    public MyTeamVO findCompanyPrincipal(String myTeamId, String departmentType,String roleId)
    {
        return mapper.findCompanyPrincipal(myTeamId,departmentType,roleId);
    }

    @Override
    public List<TreeVO> findChildTeamTree(String teamId)
    {
        return mapper.findChildTeamTree(teamId);
    }

    @Override
    public List<TreeVO> findDepartmentTree(String teamId)
    {
        return mapper.findDepartmentTree(teamId);
    }
}
