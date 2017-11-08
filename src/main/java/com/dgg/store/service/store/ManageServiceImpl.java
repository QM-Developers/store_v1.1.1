package com.dgg.store.service.store;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.dgg.store.dao.store.ManageDao;
import com.dgg.store.util.core.FilePathUtil;
import com.dgg.store.util.core.constant.*;
import com.dgg.store.util.core.generator.IDGenerator;
import com.dgg.store.util.core.page.PagingUtil;
import com.dgg.store.util.core.parameter.ParameterUtil;
import com.dgg.store.util.core.shiro.CryptographyUtil;
import com.dgg.store.util.core.string.StringUtil;
import com.dgg.store.util.core.upload.UploadFileUtil;
import com.dgg.store.util.vo.core.LoginVO;
import com.dgg.store.util.vo.core.PageVO;
import com.dgg.store.util.vo.core.ResultVO;
import com.dgg.store.util.vo.core.SessionVO;
import com.dgg.store.util.vo.manage.*;
import com.dgg.store.util.vo.permission.QMPermissionVO;
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

        return new ResultVO(result, sessionVO.getToken(), result);
    }

    @Override
    public String findTeamAndMemberCount(SessionVO sessionVO)
    {
        List<ManageMenuVO> result = new ArrayList<>();
        result.add(dao.findTeamAndMemberCount(sessionVO.getMyTeamId()));
        result.addAll(dao.findDepartmentAndMemberCount(sessionVO.getMyTeamId()));

        return JSONObject.toJSONString(new ResultVO(Constant.REQUEST_SUCCESS, sessionVO.getToken(), result));
    }

    @Override
    public String findMemberList(SessionVO sessionVO, MemberVO memberVO, PageVO pageVO)
    {
        if (ParameterUtil.objectIsNull(pageVO))
            return JSONObject.toJSONString(new ResultVO(Constant.REQUEST_FAILED, sessionVO.getToken()));

        memberVO.setPageNum(PagingUtil.getStart(pageVO.getPageNum(), pageVO.getPageSize()));
        memberVO.setPageSize(pageVO.getPageSize());
        memberVO.setMyTeamId(sessionVO.getMyTeamId());

        int pageCount = PagingUtil.getCount(dao.countMember(memberVO), pageVO.getPageSize());
        List<MemberVO> result = dao.findMemberList(memberVO);
        JSONObject json = (JSONObject) JSONObject.toJSON(new ResultVO(Constant.REQUEST_SUCCESS, sessionVO.getToken(), result));
        json.put(KeyConstant.PAGE_COUNT, pageCount);

        return json.toJSONString();
    }

    @Override
    public String insertDepartment(SessionVO sessionVO, DepartmentVO department)
    {
        Integer result = 1;
        int i = 0;
        int count = 2;

        JSONArray jPosition;
        JSONObject jObj;
        PositionVO positionVO;

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
                    jPosition = JSONArray.parseArray(department.getPosition());
                    for (Object obj : jPosition)
                    {
                        jObj = JSONObject.parseObject(obj.toString());
                        positionVO = new PositionVO(IDGenerator.generator(), jObj.getString(KeyConstant.POSITION_NAME), department.getDepartmentId());
                        result = dao.insertPosition(positionVO);
                        if (result < 1)
                            throw new RuntimeException(Constant.STR_ADD_FAILED);
                        else
                            insertPositionPermission(positionVO.getPositionId(), jObj.getString(KeyConstant.PERMISSION), jObj.getString(KeyConstant.DEPARTMENT));
                    }
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

        return JSONObject.toJSONString(new ResultVO(result, sessionVO.getToken()));
    }

    @Override
    public String findDepartmentInfo(SessionVO sessionVO, DepartmentVO department)
    {
        DepartmentVO result = dao.findDepartmentInfo(department.getDepartmentId());

        return JSONObject.toJSONString(new ResultVO(Constant.REQUEST_SUCCESS, sessionVO.getToken(), result));
    }

    @Override
    public ResultVO updateDepartment(SessionVO sessionVO, DepartmentVO department)
    {
        Integer result = 1;
        int index = 0;
        int count = 3;

        JSONArray jPosition;
        JSONObject jObj;
        PositionVO positionVO = new PositionVO();
        String positionId;

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
                    jPosition = JSONArray.parseArray(department.getPosition());
                    for (Object position : jPosition)
                    {
                        jObj = JSONObject.parseObject(position.toString());
                        positionId = jObj.getString(KeyConstant.POSITION_ID);
                        positionVO.setPositionId(StringUtil.isEmpty(positionId) ? IDGenerator.generator() : positionId);
                        positionVO.setPositionName(jObj.getString(KeyConstant.POSITION_NAME));
                        positionVO.setTeamDepartmentId(department.getDepartmentId());
                        result = dao.insertPosition(positionVO);
                        if (result < 1)
                            throw new RuntimeException(Constant.STR_ADD_FAILED);
                        else
                            insertPositionPermission(positionVO.getPositionId(), jObj.getString(KeyConstant.PERMISSION), jObj.getString(KeyConstant.DEPARTMENT));
                    }
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

        return new ResultVO(result, sessionVO.getToken());
    }

    private void insertPositionPermission(String positionId, String jsonString, String departmentId)
    {
        JSONArray jPermission;
        JSONObject jObj;
        String permissionId;
        int result;
        if (jsonString == null)
            return;
        jPermission = JSONArray.parseArray(jsonString);
        for (Object permission : jPermission)
        {
            jObj = (JSONObject) permission;
            permissionId = jObj.getString(KeyConstant.PERMISSION_ID);
            result = dao.insertPerPosRe(new PerPosReVO(permissionId, positionId));
            if (result < 1)
                throw new RuntimeException(Constant.STR_ADD_FAILED);
            if (permissionId.equals(QMPermissionConstant.CUSTOMER_VISIT))
                insertCustomerVisit(positionId, departmentId);
        }
    }

    @Override
    public ResultVO deleteDepartment(SessionVO sessionVO, DepartmentVO department)
    {
        Integer result = 1;
        int i = 0;
        int count = 2;

        Integer memberCount = dao.findDepartmentMemberCount(department.getDepartmentId());
        if (memberCount > 0)
            return new ResultVO(Constant.REQUEST_FAILED, sessionVO.getToken());

        while (result > 0)
        {
            switch (i)
            {
                case 0:
                    dao.cleanCustomerVisit(department.getDepartmentId());
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

        return new ResultVO(result, sessionVO.getToken());
    }

    @Override
    public String findDepartmentList(SessionVO sessionVO, DepartmentVO department)
    {
        List<DepartmentVO> result = dao.findDepartmentList(sessionVO.getMyTeamId());

        return JSONObject.toJSONString(new ResultVO(Constant.REQUEST_SUCCESS, sessionVO.getToken(), result));
    }

    @Override
    public ResultVO findPositionList(SessionVO sessionVO, DepartmentVO department)
    {
        List<MemberVO> result = dao.findPositionList(department.getDepartmentId());

        return new ResultVO(Constant.REQUEST_SUCCESS, sessionVO.getToken(), result);
    }

    @Override
    public ResultVO insertCardFront(SessionVO sessionVO, MultipartFile file, String realPath)
    {
        String fileName = saveImage(file, realPath);
        int result = Constant.STR_ADD_FAILED.equals(fileName) ? 0 : 1;

        return new ResultVO(result, sessionVO.getToken(), fileName);
    }

    @Override
    public ResultVO insertCardBack(SessionVO sessionVO, MultipartFile file, String realPath)
    {
        String fileName = saveImage(file, realPath);
        int result = Constant.STR_ADD_FAILED.equals(fileName) ? 0 : 1;

        return new ResultVO(result, sessionVO.getToken(), fileName);
    }

    @Override
    public ResultVO insertMember(SessionVO sessionVO, MemberVO member)
    {
        Integer result = 1;
        int index = 0;
        int count = 2;
        List<PerUserReVO> perUserReList = new ArrayList<>();
        JSONArray jArray;
        JSONObject jObject;
        String permissionId;

        while (result > 0)
        {
            switch (index)
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
                    insertMemberPermission(member.getUserId(), member.getPermission(), member.getDepartment());
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

        return new ResultVO(result, sessionVO.getToken());
    }

    private void insertCustomerVisit(String userId, String jsonString)
    {
        int result;
        JSONArray jArray;
        JSONObject jObject;
        jArray = JSONArray.parseArray(jsonString);
        dao.cleanCustomerVisit(userId);
        if (jsonString == null)
            return;
        for (Object aJArray : jArray)
        {
            jObject = (JSONObject) aJArray;
            result = dao.insertCustomerVisit(userId, jObject.getString(KeyConstant.DEPARTMENT_ID));
            if (result < 1)
                throw new RuntimeException(Constant.STR_ADD_FAILED);
        }
    }

    @Override
    public ResultVO countPositionMember(SessionVO sessionVO, PositionVO position)
    {
        Integer result = dao.countPositionMember(position.getPositionId());

        return new ResultVO(Constant.REQUEST_SUCCESS, sessionVO.getToken(), result);
    }

    @Override
    public String findMemberInfo(SessionVO sessionVO, MemberVO member)
    {
        MemberVO result = dao.findMemberInfo(member.getMemberId());

        return JSONObject.toJSONString(new ResultVO(result == null ? 0 : 1, sessionVO.getToken(), result));
    }

    @Override
    public String updateMember(SessionVO sessionVO, MemberVO member)
    {
        if (isSuper(member.getMemberId()))
            return JSONObject.toJSONString(new ResultVO(Constant.REQUEST_FAILED, sessionVO.getToken()));

        Integer result = 1;
        int i = 0;
        int count = 2;

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
                    insertMemberPermission(member.getMemberId(), member.getPermission(), member.getDepartment());
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

        return JSONObject.toJSONString(new ResultVO(result, sessionVO.getToken(), result));
    }

    private void insertMemberPermission(String memberId, String jsonString, String jsonDepartment)
    {
        JSONArray jArray;
        JSONObject jObj;
        String permissionId;
        List<PerUserReVO> perUserReList = new ArrayList<>();
        jArray = JSONArray.parseArray(jsonString);

        if (jArray.size() < 1)
            return;

        int result;
        for (Object permission : jArray)
        {
            jObj = (JSONObject) permission;
            permissionId = jObj.getString(KeyConstant.PERMISSION_ID);
            perUserReList.add(new PerUserReVO(memberId, permissionId));
            if (permissionId.equals(QMPermissionConstant.CUSTOMER_VISIT))
                insertCustomerVisit(memberId, jsonDepartment);
        }
        result = dao.insertPerUserRe(perUserReList);
        if (result < 1)
            throw new RuntimeException(Constant.STR_ADD_FAILED);
    }

    @Override
    public String deleteMember(SessionVO sessionVO, MemberVO member)
    {
        if (isSuper(member.getMemberId()))
            return JSONObject.toJSONString(new ResultVO(Constant.REQUEST_FAILED, sessionVO.getToken()));

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
                    dao.cleanCustomerVisit(member.getMemberId());
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

        return JSONObject.toJSONString(new ResultVO(result, sessionVO.getToken(), result));
    }

    private boolean isSuper(String memberId)
    {
        MemberVO m = dao.findMemberInfo(memberId);
        return RoleConstant.MANAGER.equals(m.getRoleId());
    }

    @Override
    public String listQmPermission(SessionVO sessionVO)
    {
        List<QMPermissionVO> result = dao.listQmPermission();

        return JSONObject.toJSONString(new ResultVO(Constant.REQUEST_SUCCESS, sessionVO.getToken(), result));
    }

    @Override
    public String updateMemberFreeze(SessionVO sessionVO, MemberVO member)
    {
        if (isSuper(member.getMemberId()))
            return JSONObject.toJSONString(new ResultVO(Constant.REQUEST_FAILED, sessionVO.getToken()));

        MemberVO condition = new MemberVO();
        condition.setMemberId(member.getMemberId());
        condition.setUserStatus(Constant.USER_STATE_3);

        if (dao.updateMember(condition) < 1)
            throw new RuntimeException(Constant.STR_ADD_FAILED);

        return JSONObject.toJSONString(new ResultVO(Constant.REQUEST_SUCCESS, sessionVO.getToken()));
    }

    @Override
    public String updateMemberUnfreeze(SessionVO sessionVO, MemberVO member)
    {
        MemberVO condition = new MemberVO();
        condition.setMemberId(member.getMemberId());
        condition.setUserStatus(Constant.USER_STATE_2);

        if (dao.updateMember(condition) < 1)
            throw new RuntimeException(Constant.STR_ADD_FAILED);

        return JSONObject.toJSONString(new ResultVO(Constant.REQUEST_SUCCESS, sessionVO.getToken()));
    }

    @Override
    public String listMemberByKeyword(SessionVO sessionVO, MemberVO memberVO, String keyword, PageVO pageVO)
    {
        if (ParameterUtil.objectIsNull(pageVO))
            return JSONObject.toJSONString(new ResultVO(Constant.REQUEST_FAILED, sessionVO.getToken()));

        memberVO.setPageNum(PagingUtil.getStart(pageVO.getPageNum(), pageVO.getPageSize()));
        memberVO.setPageSize(pageVO.getPageSize());
        memberVO.setMyTeamId(sessionVO.getMyTeamId());
        memberVO.setUserName(keyword);

        int pageCount = PagingUtil.getCount(dao.countMember(memberVO), pageVO.getPageSize());
        List<MemberVO> result = dao.findMemberList(memberVO);
        JSONObject json = (JSONObject) JSONObject.toJSON(new ResultVO(Constant.REQUEST_SUCCESS, sessionVO.getToken(), result));
        json.put(KeyConstant.PAGE_COUNT, pageCount);

        return json.toJSONString();
    }

    private String saveImage(MultipartFile file, String realPath)
    {
        StringBuffer path = new StringBuffer();
        String fileName = null;

        try
        {
            path.append(PathConstant.USER_ID_CARD_PATH);
            realPath = FilePathUtil.getPrevPath(realPath, Constant.PATH_LEVEL);
            fileName = UploadFileUtil.doUpload(file, path.toString(), realPath, IDGenerator.generator());
        } catch (IOException e)
        {
            e.printStackTrace();
            fileName = Constant.STR_ADD_FAILED;
        }

        return fileName;
    }
}
