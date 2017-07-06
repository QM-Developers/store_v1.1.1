package com.dgg.store.dao.store;

import com.dgg.store.mapper.ManageMapper;
import com.dgg.store.util.vo.LoginVO;
import com.dgg.store.util.vo.manage.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class ManageDaoImpl implements ManageDao
{
    @Autowired
    private ManageMapper mapper;

    @Override
    public int findLoginUser(LoginVO loginVO)
    {
        return mapper.findLoginUser(loginVO);
    }

    @Override
    public ManageMenuVO findTeamAndMemberCount(String myTeamId)
    {
        return mapper.findTeamAndMemberCount(myTeamId);
    }

    @Override
    public List<ManageMenuVO> findDepartmentAndMemberCount(String myTeamId)
    {
        return mapper.findDepartmentAndMemberCount(myTeamId);
    }

    @Override
    public Integer insertDepartment(DepartmentVO department)
    {
        return mapper.insertDepartment(department);
    }

    @Override
    public Integer insertPosition(List<PositionVO> positionList)
    {
        return mapper.insertPosition(positionList);
    }

    @Override
    public Integer insertPerPosRe(List<PerPosRe> perPosReList)
    {
        return mapper.insertPerPosRe(perPosReList);
    }

    @Override
    public DepartmentVO findDepartmentInfo(String departmentId)
    {
        return mapper.findDepartmentInfo(departmentId);
    }

    @Override
    public Integer updateDepartment(DepartmentVO department)
    {
        return mapper.updateDepartment(department);
    }

    @Override
    public Integer cleanPosition(String departmentId)
    {
        return mapper.cleanPosition(departmentId);
    }

    @Override
    public Integer cleanPerPosRe(String departmentId)
    {
        return mapper.cleanPerPosRe(departmentId);
    }

    @Override
    public Integer deleteDepartment(String departmentId)
    {
        return mapper.deleteDepartment(departmentId);
    }

    @Override
    public Integer findDepartmentMemberCount(String departmentId)
    {
        return mapper.findDepartmentMemberCount(departmentId);
    }

    @Override
    public List<DepartmentVO> findDepartmentList(String myTeamId)
    {
        return mapper.findDepartmentList(myTeamId);
    }

    @Override
    public List<MemberVO> findPositionList(String departmentId)
    {
        return mapper.findPositionList(departmentId);
    }
}
