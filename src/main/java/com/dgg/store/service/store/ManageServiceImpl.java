package com.dgg.store.service.store;

import com.dgg.store.dao.store.ManageDao;
import com.dgg.store.util.core.constant.Constant;
import com.dgg.store.util.core.constant.PathConstant;
import com.dgg.store.util.core.constant.RoleConstant;
import com.dgg.store.util.core.constant.SymbolConstant;
import com.dgg.store.util.core.generator.IDGenerator;
import com.dgg.store.util.core.shiro.CryptographyUtil;
import com.dgg.store.util.core.string.StringUtil;
import com.dgg.store.util.core.upload.UploadFileUtil;
import com.dgg.store.util.vo.core.LoginVO;
import com.dgg.store.util.vo.core.ResultVO;
import com.dgg.store.util.vo.core.SessionVO;
import com.dgg.store.util.vo.manage.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
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

        ResultVO resultVO = new ResultVO(result, sessionVO.getToken(), result);

        return resultVO;
    }

    @Override
    public ResultVO findTeamAndMemberCount(SessionVO sessionVO)
    {
        List<ManageMenuVO> result = new ArrayList<>();
        result.add(dao.findTeamAndMemberCount(sessionVO.getMyTeamId()));
        result.addAll(dao.findDepartmentAndMemberCount(sessionVO.getMyTeamId()));

        ResultVO resultVO = new ResultVO(1, sessionVO.getToken(), result);

        return resultVO;
    }

    @Override
    public ResultVO findMemberList(SessionVO sessionVO, MemberVO memberVO)
    {
        List<MemberVO> result = dao.findMemberList(memberVO);

        ResultVO resultVO = new ResultVO(1, sessionVO.getToken(), result);

        return resultVO;
    }

    @Override
    public ResultVO insertDepartment(SessionVO sessionVO, DepartmentVO department)
    {
        Integer result = 1;
        int i = 0;
        int count = 3;

        List<PositionVO> positionList = new ArrayList<>();
        List<PerPosReVO> perPosReList = new ArrayList<>();

        while (result > 0)
        {
            switch (i)
            {
                case 0:
                    department.setMyTeamId(sessionVO.getMyTeamId());
                    department.setDepartmentId(IDGenerator.generator());
                    result = dao.insertDepartment(department);
                    break;
                case 1:
                    String[] positionNames = department.getPosition().split(SymbolConstant.COMMA);
                    for (String name : positionNames)
                        positionList.add(new PositionVO(IDGenerator.generator(), name, department.getDepartmentId()));
                    result = dao.insertPosition(positionList);
                    break;
                case 2:
                    String[] permission = department.getPermission().split(SymbolConstant.SUBTRACT);
                    for (int j = 0; j < positionList.size() && j < permission.length; j++)
                    {
                        String[] ps = permission[j].split(SymbolConstant.COMMA);
                        for (String per : ps)
                            perPosReList.add(new PerPosReVO(per, positionList.get(j).getPositionId()));
                    }
                    result = perPosReList.size() > 1 ? dao.insertPerPosRe(perPosReList) : 1;
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
    public ResultVO findDepartmentInfo(SessionVO sessionVO, DepartmentVO department)
    {
        DepartmentVO result = dao.findDepartmentInfo(department.getDepartmentId());

        ResultVO resultVO = new ResultVO(1, sessionVO.getToken(), result);

        return resultVO;
    }

    @Override
    public ResultVO updateDepartment(SessionVO sessionVO, DepartmentVO department)
    {
        Integer result = 1;
        int index = 0;
        int count = 4;

        List<PositionVO> positionList = new ArrayList<>();
        List<PerPosReVO> perPosReList = new ArrayList<>();

        while (result > 0)
        {
            switch (index)
            {
                case 0:
                    result = dao.updateDepartment(department);
                    break;
                case 1:
                    dao.cleanPerPosRe(department.getDepartmentId());
                    result = dao.cleanPosition(department.getDepartmentId());
                    break;
                case 2:
                    String[] positionIds = department.getPositionId().split(SymbolConstant.COMMA);
                    String[] positionNames = department.getPosition().split(SymbolConstant.COMMA);
                    for (int i = 0; i < positionNames.length; i++)
                    {
                        String id = StringUtil.isEmpty(positionIds[i]) ? IDGenerator.generator() : positionIds[i];
                        positionList.add(new PositionVO(id, positionNames[i], department.getDepartmentId()));
                    }
                    result = dao.insertPosition(positionList);
                    break;
                case 3:
                    String[] permission = department.getPermission().split(SymbolConstant.SUBTRACT);
                    for (int j = 0; j < positionList.size() && j < permission.length; j++)
                    {
                        String[] ps = permission[j].split(SymbolConstant.COMMA);
                        for (String per : ps)
                            perPosReList.add(new PerPosReVO(per, positionList.get(j).getPositionId()));
                    }
                    result = dao.insertPerPosRe(perPosReList);
                    break;
                default:
                    result = 0;
                    break;
            }
            index++;
        }

        if (index - 1 < count)
            throw new RuntimeException(Constant.STR_ADD_FAILED);
        else
            result = 1;

        ResultVO resultVO = new ResultVO(result, sessionVO.getToken());

        return resultVO;
    }

    @Override
    public ResultVO deleteDepartment(SessionVO sessionVO, DepartmentVO department)
    {
        Integer result = 1;
        int i = 0;
        int count = 2;

        Integer memberCount = dao.findDepartmentMemberCount(department.getDepartmentId());
        if (memberCount > 0)
            return new ResultVO(2, sessionVO.getToken());

        while (result > 0)
        {
            switch (i)
            {
                case 0:
                    dao.cleanPerPosRe(department.getDepartmentId());
                    result = dao.cleanPosition(department.getDepartmentId());
                    break;
                case 1:
                    result = dao.deleteDepartment(department.getDepartmentId());
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
    public ResultVO findDepartmentList(SessionVO sessionVO, DepartmentVO department)
    {
        List<DepartmentVO> result = dao.findDepartmentList(sessionVO.getMyTeamId());

        ResultVO resultVO = new ResultVO(1, sessionVO.getToken(), result);

        return resultVO;
    }

    @Override
    public ResultVO findPositionList(SessionVO sessionVO, DepartmentVO department)
    {
        List<MemberVO> result = dao.findPositionList(department.getDepartmentId());

        ResultVO resultVO = new ResultVO(1, sessionVO.getToken(), result);

        return resultVO;
    }

    @Override
    public ResultVO insertCardFront(SessionVO sessionVO, MultipartFile file, String realPath)
    {
        String fileName = saveImage(file, realPath);
        int result = Constant.STR_ADD_FAILED.equals(fileName) ? 0 : 1;

        ResultVO resultVO = new ResultVO(result, sessionVO.getToken(), fileName);

        return resultVO;
    }

    @Override
    public ResultVO insertCardBack(SessionVO sessionVO, MultipartFile file, String realPath)
    {
        String fileName = saveImage(file, realPath);
        int result = Constant.STR_ADD_FAILED.equals(fileName) ? 0 : 1;

        ResultVO resultVO = new ResultVO(result, sessionVO.getToken(), fileName);

        return resultVO;
    }

    @Override
    public ResultVO insertMember(SessionVO sessionVO, MemberVO member)
    {
        Integer result = 1;
        int i = 0;
        int count = 2;
        List<PerUserReVO> perUserReList = new ArrayList<>();

        while (result > 0)
        {
            switch (i)
            {
                case 0:
                    member.setUserId(IDGenerator.generator());
                    member.setRoleId(RoleConstant.BUSINESS);
                    member.setUserStatus(Constant.USER_STATE_1);
                    member.setMyTeamId(sessionVO.getMyTeamId());
                    member.setUserCardFront(member.getUserCardFront() == null ? Constant.EMPTY : member.getUserCardFront());
                    member.setUserCardBack(member.getUserCardBack() == null ? Constant.EMPTY : member.getUserCardBack());
                    result = dao.insertMember(member);
                    break;
                case 1:
                    String[] ps = member.getPermission().split(SymbolConstant.COMMA);
                    for (String p : ps)
                        perUserReList.add(new PerUserReVO(member.getUserId(), p));
                    result = dao.insertPerUserRe(perUserReList);
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
    public ResultVO countPositionMember(SessionVO sessionVO, PositionVO position)
    {
        Integer result = dao.countPositionMember(position.getPositionId());

        ResultVO resultVO = new ResultVO(1, sessionVO.getToken(), result);

        return resultVO;
    }

    @Override
    public ResultVO findMemberInfo(SessionVO sessionVO, MemberVO member)
    {
        MemberVO result = dao.findMemberInfo(member.getMemberId());

        ResultVO resultVO = new ResultVO(result == null ? 0 : 1, sessionVO.getToken(), result);

        return resultVO;
    }

    @Override
    public ResultVO updateMember(SessionVO sessionVO, MemberVO member)
    {
        Integer result = 1;
        int i = 0;
        int count = 2;
        List<PerUserReVO> perUserReList = new ArrayList<>();

        while (result > 0)
        {
            switch (i)
            {
                case 0:
                    result = dao.updateMember(member);
                    break;
                case 1:
                    dao.cleanPerUserRe(member.getMemberId());
                    if (member.getPermission() == null)
                        break;
                    String[] ps = member.getPermission().split(SymbolConstant.COMMA);
                    for (String p : ps)
                        perUserReList.add(new PerUserReVO(member.getMemberId(), p));
                    result = dao.insertPerUserRe(perUserReList);
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

        ResultVO resultVO = new ResultVO(result, sessionVO.getToken(), result);

        return resultVO;
    }

    @Override
    public ResultVO deleteMember(SessionVO sessionVO, MemberVO member)
    {
        Integer result = 1;
        int i = 0;
        int count = 1;

        while (result > 0)
        {
            switch (i)
            {
                case 0:
                    MemberVO condition = new MemberVO();
                    condition.setUserId(member.getMemberId());
                    dao.cleanPerUserRe(member.getMemberId());
                    result = dao.deleteMember(condition);
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

        ResultVO resultVO = new ResultVO(result, sessionVO.getToken(), result);

        return resultVO;
    }

    private String saveImage(MultipartFile file, String realPath)
    {
        StringBuffer path = new StringBuffer();
        String fileName = null;

        try
        {
            path.append(PathConstant.USER_ID_CARD_PATH);
            fileName = UploadFileUtil.doUpload(file, path.toString(), realPath, IDGenerator.generator());
        } catch (IOException e)
        {
            e.printStackTrace();
            fileName = Constant.STR_ADD_FAILED;
        }

        return fileName;
    }
}
