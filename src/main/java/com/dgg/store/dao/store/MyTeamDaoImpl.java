package com.dgg.store.dao.store;

import com.dgg.store.mapper.MyTeamMapper;
import com.dgg.store.util.vo.manage.DepartmentVO;
import com.dgg.store.util.vo.team.MemberVO;
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
    public TeamDepartmentVO findDepartmentDetail(TeamDepartmentVO department)
    {
        return mapper.findDepartmentDetail(department);
    }

    @Override
    public List<MemberVO> findDepartmentMember(MemberVO member)
    {
        return mapper.findDepartmentMember(member);
    }

    @Override
    public List<MemberVO> findMemberByNameOrPhone(MemberVO member)
    {
        return mapper.findMemberByNameOrPhone(member);
    }

    @Override
    public List<DepartmentVO> listTeamDepartment(String myTeamId)
    {
        return mapper.listTeamDepartment(myTeamId);
    }
}
