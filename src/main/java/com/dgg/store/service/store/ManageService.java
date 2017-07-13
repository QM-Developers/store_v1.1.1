package com.dgg.store.service.store;

import com.dgg.store.util.vo.core.LoginVO;
import com.dgg.store.util.vo.core.ResultVO;
import com.dgg.store.util.vo.core.SessionVO;
import com.dgg.store.util.vo.manage.DepartmentVO;
import com.dgg.store.util.vo.manage.MemberVO;
import com.dgg.store.util.vo.manage.PositionVO;
import org.springframework.web.multipart.MultipartFile;

public interface ManageService
{
    ResultVO findLoginUser(SessionVO sessionVO, LoginVO loginVO);

    ResultVO findTeamAndMemberCount(SessionVO sessionVO);

    ResultVO findMemberList(SessionVO sessionVO, MemberVO memberVO);

    ResultVO insertDepartment(SessionVO sessionVO, DepartmentVO department);

    ResultVO findDepartmentInfo(SessionVO sessionVO, DepartmentVO department);

    ResultVO updateDepartment(SessionVO sessionVO, DepartmentVO department);

    ResultVO deleteDepartment(SessionVO sessionVO, DepartmentVO department);

    ResultVO findDepartmentList(SessionVO sessionVO, DepartmentVO department);

    ResultVO findPositionList(SessionVO sessionVO, DepartmentVO department);

    ResultVO insertCardFront(SessionVO sessionVO, MultipartFile file, String realPath);

    ResultVO insertCardBack(SessionVO sessionVO, MultipartFile file, String realPath);

    ResultVO insertMember(SessionVO sessionVO, MemberVO member);

    ResultVO countPositionMember(SessionVO sessionVO, PositionVO position);

    ResultVO findMemberInfo(SessionVO sessionVO, MemberVO member);

    ResultVO updateMember(SessionVO sessionVO, MemberVO member);
}
