package com.dgg.store.dao.store;

import com.dgg.store.mapper.ManageMapper;
import com.dgg.store.util.vo.core.LoginVO;
import com.dgg.store.util.vo.manage.*;
import com.dgg.store.util.vo.permission.QMPermissionVO;
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

    @Override
    public Integer insertMember(MemberVO member)
    {
        return mapper.insertMember(member);
    }

    @Override
    public Integer insertPerUserRe(List<PerUserReVO> perUserReList)
    {
        return mapper.insertPerUserRe(perUserReList);
    }

    @Override
    public List<MemberVO> findMemberList(MemberVO memberVO)
    {
        return mapper.findMemberList(memberVO);
    }

    @Override
    public Integer countPositionMember(String positionId)
    {
        return mapper.countPositionMember(positionId);
    }

    @Override
    public MemberVO findMemberInfo(String memberId)
    {
        return mapper.findMemberInfo(memberId);
    }

    @Override
    public Integer updateMember(MemberVO member)
    {
        return mapper.updateMember(member);
    }

    @Override
    public Integer cleanPerUserRe(String memberId)
    {
        return mapper.cleanPerUserRe(memberId);
    }

    @Override
    public Integer deleteMember(MemberVO condition)
    {
        return mapper.deleteMember(condition);
    }

    @Override
    public Integer insertCustomerVisit(String userId, String departmentId)
    {
        return mapper.insertCustomerVisit(userId,departmentId);
    }

    @Override
    public int cleanCustomerVisit(String userId)
    {
        return mapper.cleanCustomerVisit(userId);
    }

    @Override
    public Integer insertPosition(PositionVO positionVO)
    {
        return mapper.insertPosition(positionVO);
    }

    @Override
    public Integer insertPerPosRe(PerPosReVO perPosReVO)
    {
        return mapper.insertPerPosRe(perPosReVO);
    }

    @Override
    public List<QMPermissionVO> listQmPermission()
    {
        return mapper.listQmPermission();
    }

    @Override
    public int countMember(MemberVO memberVO)
    {
        return mapper.countMember(memberVO);
    }

}
