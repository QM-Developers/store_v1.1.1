package com.dgg.store.service.store;

import com.alibaba.fastjson.JSONObject;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.dgg.store.dao.store.CustomerDao;
import com.dgg.store.mapper.PushMessageMapper;
import com.dgg.store.util.core.FilePathUtil;
import com.dgg.store.util.core.constant.*;
import com.dgg.store.util.core.date.DateUtil;
import com.dgg.store.util.core.generator.IDGenerator;
import com.dgg.store.util.core.page.PagingUtil;
import com.dgg.store.util.core.parameter.ParameterUtil;
import com.dgg.store.util.core.reflect.ReflectUtil;
import com.dgg.store.util.core.string.StringUtil;
import com.dgg.store.util.core.umeng.push.PushMessageFactory;
import com.dgg.store.util.core.umeng.push.UMengUtil;
import com.dgg.store.util.core.upload.UploadFileUtil;
import com.dgg.store.util.pojo.CustomerAccountRequest;
import com.dgg.store.util.vo.core.PageVO;
import com.dgg.store.util.vo.core.ResultVO;
import com.dgg.store.util.vo.core.SessionVO;
import com.dgg.store.util.vo.customer.CustomerRepertoryVO;
import com.dgg.store.util.vo.customer.CustomerVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Service
public class CustomerServiceImpl implements CustomerService
{
    private final CustomerDao dao;

    private final PushMessageMapper pushMapper;

    @Autowired
    public CustomerServiceImpl(CustomerDao dao, PushMessageMapper pushMapper)
    {
        this.dao = dao;
        this.pushMapper = pushMapper;
    }

    @Override
    public String insertCustomerRecord(CustomerVO customerVO, SessionVO sessionVO)
    {
        if (dao.getCustomerExist(customerVO.getUserPhone(), sessionVO.getMyTeamId(), sessionVO.getUserId()) > 0)
            return JSONObject.toJSONString(new ResultVO(3, sessionVO.getToken()));

        Integer result = 1;
        int i = 0;
        int count = 2;

        while (result > 0)
        {
            switch (i)
            {
                case 0:
                    customerVO.setUserId(IDGenerator.generator());
                    customerVO.setUserStatus(Constant.USER_STATE_0);
                    customerVO.setRoleId(Integer.parseInt(RoleConstant.USER));
                    customerVO.setMyTeamId(sessionVO.getMyTeamId());
                    customerVO.setUserCardFront(Constant.EMPTY);
                    customerVO.setUserCardBack(Constant.EMPTY);
                    customerVO.setUserCardHand(Constant.EMPTY);
                    customerVO.setUserCreateDate(new Date());
                    customerVO.setUserAddress(customerVO.getUserAddress() == null ? Constant.EMPTY : customerVO.getUserAddress());
                    customerVO.setUserSex(ParameterUtil.getDefault(customerVO.getUserSex(), Constant.EMPTY));
                    customerVO.setCreditRating(ParameterUtil.getDefault(customerVO.getCreditRating(), 0));
                    if (!StringUtil.isEmpty(customerVO.getUserBirthday()))
                        customerVO.setUserBirthday2(DateUtil.strToDate(customerVO.getUserBirthday()));
                    result = dao.insertCustomerRecord(customerVO);
                    break;
                case 1:
                    customerVO.setPromoterId(sessionVO.getUserId());
                    customerVO.setCustomerId(IDGenerator.generator());
                    customerVO.setBusinessAddress(StringUtil.isEmpty(customerVO.getBusinessAddress()) ? "" : customerVO.getBusinessAddress());
                    customerVO.setStation(StringUtil.isEmpty(customerVO.getStation()) ? "" : customerVO.getStation());
                    result = dao.insertCustomer(customerVO);
                    break;
                default:
                    result = 0;
                    break;
            }
            i++;
        }

        if (i - 1 < count)
            throw new RuntimeException(Constant.STR_ADD_FAILED);

        JSONObject json = (JSONObject) JSONObject.toJSON(new ResultVO(Constant.REQUEST_SUCCESS, sessionVO.getToken(), customerVO.getCustomerId()));

        return json.toJSONString();
    }

    @Override
    public String listCustomer(SessionVO sessionVO, PageVO pageVO, CustomerVO customerVO)
    {
        if (ParameterUtil.objectIsNull(pageVO))
            return JSONObject.toJSONString(new ResultVO(Constant.REQUEST_FAILED, sessionVO.getToken()));

        int start = PagingUtil.getStart(pageVO.getPageNum(), pageVO.getPageSize());
        int end = pageVO.getPageSize();

        customerVO.setMyTeamId(sessionVO.getMyTeamId());
        customerVO.setUserId(sessionVO.getUserId());

        int pageCount = dao.countCustomer(customerVO);
        pageCount = PagingUtil.getCount(pageCount, pageVO.getPageSize());
        List<CustomerVO> result = dao.listCustomer(customerVO, start, end);

        JSONObject json = (JSONObject) JSONObject.toJSON(new ResultVO(Constant.REQUEST_SUCCESS, sessionVO.getToken(), result));
        json.put(KeyConstant.PAGE_COUNT, pageCount);

        return json.toJSONString();
    }

    @Override
    public String updateCustomer(SessionVO sessionVO, CustomerVO customerVO)
    {
        Integer result = 1;
        int i = 0;
        int count = 2;

        if (!StringUtil.isEmpty(customerVO.getUserBirthday()))
            customerVO.setUserBirthday2(DateUtil.strToDate(customerVO.getUserBirthday()));

        while (result > 0)
        {
            switch (i)
            {
                case 0:
                    result = dao.updateCustomerUser(customerVO);
                    if (result < 1)
                        result = dao.updateCustomerUserRecord(customerVO);
                    break;
                case 1:
                    result = dao.updateCustomer(customerVO);
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

        customerVO = dao.getCustomer(customerVO);
        JSONObject json = (JSONObject) JSONObject.toJSON(new ResultVO(Constant.REQUEST_SUCCESS, sessionVO.getToken(), customerVO));

        return json.toJSONString();
    }

    @Override
    public String insertFrontImage(SessionVO sessionVO, MultipartFile file, String realPath, CustomerVO customerVO)
    {
        int result = 0;
        StringBuilder path = new StringBuilder();
        String fileName = null;

        try
        {
            path.append(PathConstant.USER_ID_CARD_PATH).append(sessionVO.getUserId()).append(SymbolConstant.FORWARD_SLASH);
            realPath = FilePathUtil.getPrevPath(realPath, Constant.PATH_LEVEL);
            fileName = UploadFileUtil.doUpload(file, path.toString(), realPath, IDGenerator.generator());
            customerVO = dao.getCustomer(customerVO);
            if (customerVO.getHadAccount().equals(CustomerConstant.HAD_ACCOUNT))
                result = dao.insertFrontImage(fileName, customerVO.getCustomerId());
            else
                result = dao.insertFrontImageRecord(fileName, customerVO.getCustomerId());
        } catch (IOException e)
        {
            e.printStackTrace();
        }

        return JSONObject.toJSONString(new ResultVO(result, sessionVO.getToken(), fileName));
    }

    @Override
    public String insertHandImage(SessionVO sessionVO, MultipartFile file, String realPath, CustomerVO customerVO)
    {
        int result = 0;
        StringBuilder path = new StringBuilder();
        String fileName = null;

        try
        {
            path.append(PathConstant.USER_ID_CARD_PATH).append(sessionVO.getUserId()).append(SymbolConstant.FORWARD_SLASH);
            realPath = FilePathUtil.getPrevPath(realPath, Constant.PATH_LEVEL);
            fileName = UploadFileUtil.doUpload(file, path.toString(), realPath, IDGenerator.generator());
            customerVO = dao.getCustomer(customerVO);
            if (customerVO.getHadAccount().equals(CustomerConstant.HAD_ACCOUNT))
                result = dao.insertHandImage(fileName, customerVO.getCustomerId());
            else
                result = dao.insertHandImageRecord(fileName, customerVO.getCustomerId());
        } catch (IOException e)
        {
            e.printStackTrace();
        }

        return JSONObject.toJSONString(new ResultVO(result, sessionVO.getToken(), fileName));
    }

    @Override
    public String getCustomer(SessionVO sessionVO, CustomerVO customerVO)
    {
        CustomerVO result = dao.getCustomer(customerVO);
        result.setMerchandiserName(dao.getUserName(result.getMerchandiserId()));

        return JSONObject.toJSONString(new ResultVO(Constant.REQUEST_SUCCESS, sessionVO.getToken(), result));
    }

    @Override
    public String insertBackImage(SessionVO sessionVO, MultipartFile file, String realPath, CustomerVO customerVO)
    {
        int result = 0;
        StringBuilder path = new StringBuilder();
        String fileName = null;

        try
        {
            path.append(PathConstant.USER_ID_CARD_PATH).append(sessionVO.getUserId()).append(SymbolConstant.FORWARD_SLASH);
            realPath = FilePathUtil.getPrevPath(realPath, Constant.PATH_LEVEL);
            fileName = UploadFileUtil.doUpload(file, path.toString(), realPath, IDGenerator.generator());
            customerVO = dao.getCustomer(customerVO);
            if (customerVO.getHadAccount().equals(CustomerConstant.HAD_ACCOUNT))
                result = dao.insertBackImage(fileName, customerVO.getCustomerId());
            else
                result = dao.insertBackImageRecord(fileName, customerVO.getCustomerId());
        } catch (IOException e)
        {
            e.printStackTrace();
        }

        return JSONObject.toJSONString(new ResultVO(result, sessionVO.getToken(), fileName));
    }

    @Override
    public String listMerchandiser(SessionVO sessionVO, CustomerVO customerVO)
    {
        customerVO.setMyTeamId(sessionVO.getMyTeamId());
        customerVO.setPromoterId(QMPermissionConstant.ORDER_FOLLOW);
        int repertoryLevel = dao.getRepertoryLevel(customerVO.getCustomerType(), sessionVO.getMyTeamId());
        List<CustomerVO> result;

        if (repertoryLevel < 2)
            result = dao.listMerchandiserFirst(customerVO);
        else
            result = dao.listMerchandiserSecond(customerVO);

        return JSONObject.toJSONString(new ResultVO(Constant.REQUEST_SUCCESS, sessionVO.getToken(), result));
    }

    @Override
    public String insertRepertoryLevel(SessionVO sessionVO, CustomerRepertoryVO repertory)
    {
        repertory.setMyTeamId(sessionVO.getMyTeamId());
        int result = dao.countRepertoryLevel(repertory);
        if (result > 0)
            return JSONObject.toJSONString(new ResultVO(3, sessionVO.getToken()));

        result = dao.insertRepertoryLevel(repertory);

        return JSONObject.toJSONString(new ResultVO(result < 0 ? Constant.REQUEST_FAILED : Constant.REQUEST_SUCCESS, sessionVO.getToken()));
    }

    @Override
    public String listAccountChecker(SessionVO sessionVO, String departmentId)
    {
        List<CustomerVO> result = dao.listAccountChecker(sessionVO.getMyTeamId(), departmentId, QMPermissionConstant.ACCOUNT_CHECK);

        return JSONObject.toJSONString(new ResultVO(Constant.REQUEST_SUCCESS, sessionVO.getToken(), result));
    }

    @Override
    public String insertCustomerAccount(SessionVO sessionVO, CustomerAccountRequest accountRequest)
    {
        if (dao.countHadCustomerAccount(accountRequest.getCustomerId(), sessionVO.getMyTeamId()) > 0)
            return JSONObject.toJSONString(new ResultVO(3, sessionVO.getToken()));

        accountRequest.setProposerId(sessionVO.getUserId());
        accountRequest.setRequestId(IDGenerator.generator());
        accountRequest.setRequestStatus(CustomerConstant.ACCOUNT_STATUS_REQUEST);
        accountRequest.setCreateDate(new Date());

        if (ReflectUtil.hadNull(accountRequest))
            JSONObject.toJSONString(new ResultVO(Constant.REQUEST_FAILED, sessionVO.getToken()));

        int result = dao.insertCustomerAccount(accountRequest);

        UMengUtil.sendUnicast(dao.getDeviceToken(accountRequest.getMerchandiserId()), PushMessageFactory.getInstance(pushMapper).get(PushMessageConstant.CUSTOMER_NEW));

        return JSONObject.toJSONString(new ResultVO(result < 1 ? Constant.REQUEST_FAILED : Constant.REQUEST_SUCCESS, sessionVO.getToken(), accountRequest.getRequestId()));
    }

    @Override
    public String updateCustomerAccountAccept(SessionVO sessionVO, CustomerAccountRequest accountRequest)
    {
        int result = 1;
        int index = 0;

        accountRequest = dao.getCustomerAccount(accountRequest.getRequestId());
        if (accountRequest == null || !accountRequest.getRequestStatus().equals(CustomerConstant.ACCOUNT_STATUS_REQUEST))
            return JSONObject.toJSONString(new ResultVO(Constant.REQUEST_FAILED, sessionVO.getToken()));

        while (result > 0)
        {
            switch (index)
            {
                case 0:
                    accountRequest.setRequestStatus(CustomerConstant.ACCOUNT_STATUS_ACCEPT);
                    result = dao.updateCustomerAccountById(accountRequest);
                    break;
                case 1:
                    result = dao.updateRecordToAccount(accountRequest.getCustomerId());
                    break;
                case 2:
                    result = dao.deleteRecord(accountRequest.getCustomerId());
                    break;
                case 3:
                    CustomerVO condition = new CustomerVO();
                    condition.setCustomerId(accountRequest.getCustomerId());
                    condition.setHadAccount(CustomerConstant.HAD_ACCOUNT);
                    condition.setMerchandiserId(accountRequest.getMerchandiserId());
                    result = dao.updateCustomer(condition);
                default:
                    result = 0;
                    break;
            }
            index++;
        }

        if (index < 4)
            throw new RuntimeException(Constant.STR_ADD_FAILED);
        else
            result = 1;

        UMengUtil.sendUnicast(dao.getDeviceToken(accountRequest.getProposerId()), PushMessageFactory.getInstance(pushMapper).get(PushMessageConstant.CUSTOMER_PASS));

        return JSONObject.toJSONString(new ResultVO(result, sessionVO.getToken()));
    }

    @Override
    public String getCustomerAccount(SessionVO sessionVO, CustomerAccountRequest accountRequest)
    {
        CustomerAccountRequest result = dao.getCustomerAccount(accountRequest.getRequestId());
        result.setUserImage(dao.getUserImage(result.getProposerId()));
        result.setCheckerDepartment(dao.getDepartmentName(result.getCheckerId()));
        result.setMerchandiserDepartment(dao.getDepartmentName(result.getMerchandiserId()));

        return JSONObject.toJSONString(new ResultVO(Constant.REQUEST_SUCCESS, sessionVO.getToken(), result), SerializerFeature.WriteNullStringAsEmpty);
    }

    @Override
    public String updateCustomerAccountRefuse(SessionVO sessionVO, CustomerAccountRequest accountRequest)
    {
        accountRequest = dao.getCustomerAccount(accountRequest.getRequestId());

        if (accountRequest == null || !accountRequest.getRequestStatus().equals(CustomerConstant.ACCOUNT_STATUS_REQUEST))
            return JSONObject.toJSONString(new ResultVO(Constant.REQUEST_FAILED, sessionVO.getToken()));

        accountRequest.setRequestStatus(CustomerConstant.ACCOUNT_STATUS_REFUSE);
        int result = dao.updateCustomerAccountById(accountRequest);

        UMengUtil.sendUnicast(dao.getDeviceToken(accountRequest.getProposerId()), PushMessageFactory.getInstance(pushMapper).get(PushMessageConstant.CUSTOMER_REFUSE));

        return JSONObject.toJSONString(new ResultVO(result < 1 ? Constant.REQUEST_FAILED : Constant.REQUEST_SUCCESS, sessionVO.getToken()));
    }

    @Override
    public String listCustomerAccountByProposer(SessionVO sessionVO, CustomerAccountRequest accountRequest, PageVO pageVO)
    {
        if (ParameterUtil.objectIsNull(pageVO))
            return JSONObject.toJSONString(new ResultVO(Constant.REQUEST_FAILED, sessionVO.getToken()));

        int pageNum = PagingUtil.getStart(pageVO.getPageNum(), pageVO.getPageSize());
        int pageSize = pageVO.getPageSize();

        accountRequest.setProposerId(sessionVO.getUserId());
        accountRequest.setStatusList(getStatus(accountRequest.getRequestStatus()));
        List<CustomerAccountRequest> result = dao.listCustomerAccount(accountRequest, pageNum, pageSize);

        int pageCount = PagingUtil.getCount(dao.countCustomerAccount(accountRequest), pageSize);

        result = getResultParams(result);

        return JSONObject.toJSONString(new ResultVO(Constant.REQUEST_SUCCESS, sessionVO.getToken(), result, pageCount));
    }

    private List<CustomerAccountRequest> getResultParams(List<CustomerAccountRequest> result)
    {
        for (CustomerAccountRequest re : result)
            re.setUserImage(dao.getUserImage(re.getProposerId()));

        return result;
    }

    private List<Byte> getStatus(Byte requestStatus)
    {
        List<Byte> statusList = new ArrayList<>();

        if (requestStatus == null)
            return statusList;

        switch (requestStatus)
        {
            case CustomerConstant.ACCOUNT_PROCESSED:
                statusList.add(CustomerConstant.ACCOUNT_STATUS_REFUSE);
                statusList.add(CustomerConstant.ACCOUNT_STATUS_ACCEPT);
                break;
            default:
                statusList.add(requestStatus);
                break;
        }

        return statusList;
    }

    @Override
    public String listCustomerAccountByChecker(SessionVO sessionVO, CustomerAccountRequest accountRequest, PageVO pageVO)
    {
        if (ParameterUtil.objectIsNull(pageVO))
            return JSONObject.toJSONString(new ResultVO(Constant.REQUEST_FAILED, sessionVO.getToken()));

        int pageNum = PagingUtil.getStart(pageVO.getPageNum(), pageVO.getPageSize());
        int pageSize = pageVO.getPageSize();

        accountRequest.setCheckerId(sessionVO.getUserId());
        accountRequest.setStatusList(getStatus(accountRequest.getRequestStatus()));
        List<CustomerAccountRequest> result = dao.listCustomerAccount(accountRequest, pageNum, pageSize);

        result = getResultParams(result);
        int pageCount = PagingUtil.getCount(dao.countCustomerAccount(accountRequest), pageSize);

        return JSONObject.toJSONString(new ResultVO(Constant.REQUEST_SUCCESS, sessionVO.getToken(), result, pageCount));
    }

    @Override
    public String updateCustomerToPromoter(SessionVO sessionVO, CustomerVO customerVO)
    {
        CustomerVO condition = new CustomerVO();

        condition.setCustomerId(customerVO.getCustomerId());
        condition.setPromoterId(customerVO.getPromoterId());

        int result = dao.updateCustomer(customerVO);
        if (result != 1)
            throw new RuntimeException(Constant.STR_ADD_FAILED);

        return JSONObject.toJSONString(new ResultVO(Constant.REQUEST_SUCCESS, sessionVO.getToken()));
    }

    @Override
    public String updateCustomerToMerchandiser(SessionVO sessionVO, CustomerVO customerVO)
    {
        CustomerVO condition = new CustomerVO();

        condition.setCustomerId(customerVO.getCustomerId());
        condition.setMerchandiserId(customerVO.getMerchandiserId());

        int result = dao.updateCustomer(customerVO);
        if (result != 1)
            throw new RuntimeException(Constant.STR_ADD_FAILED);

        return JSONObject.toJSONString(new ResultVO(Constant.REQUEST_SUCCESS, sessionVO.getToken()));
    }

    @Override
    public String updateCustomerFreeze(SessionVO sessionVO, CustomerVO customerVO)
    {
        CustomerVO condition = new CustomerVO();
        condition.setCustomerId(customerVO.getCustomerId());
        condition = dao.getCustomer(condition);
        if (condition == null)
            return JSONObject.toJSONString(new ResultVO(Constant.REQUEST_FAILED, sessionVO.getToken()));

        int result = 1;
        int index = 0;

        if (CustomerConstant.HAD_ACCOUNT != condition.getHadAccount())
            return JSONObject.toJSONString(new ResultVO(Constant.REQUEST_FAILED, sessionVO.getToken(), result));

        while (result > 0)
        {
            switch (index)
            {
                case 0:
                    condition.setHadAccount(CustomerConstant.HAD_ACCOUNT_FREEZE);
                    result = dao.updateCustomer(condition);
                    break;
                case 1:
                    result = dao.insertRecordByUser(customerVO.getCustomerId());
                    break;
                case 2:
                    result = dao.deleteUser(customerVO.getCustomerId());
                    break;
                default:
                    result = 0;
                    break;
            }
            index++;
        }

        if (index < 3)
            throw new RuntimeException(Constant.STR_ADD_FAILED);

        return JSONObject.toJSONString(new ResultVO(Constant.REQUEST_SUCCESS, sessionVO.getToken()));
    }

    @Override
    public String updateCustomerUnfreeze(SessionVO sessionVO, CustomerVO customerVO)
    {
        CustomerVO condition = new CustomerVO();
        condition.setCustomerId(customerVO.getCustomerId());
        condition = dao.getCustomer(condition);
        int result = 1;
        int index = 0;

        if (CustomerConstant.HAD_ACCOUNT_FREEZE != condition.getHadAccount())
            return JSONObject.toJSONString(new ResultVO(Constant.REQUEST_FAILED, sessionVO.getToken(), result));

        while (result > 0)
        {
            switch (index)
            {
                case 0:
                    condition.setHadAccount(CustomerConstant.HAD_ACCOUNT);
                    result = dao.updateCustomer(condition);
                    break;
                case 1:
                    result = dao.updateRecordToAccount(customerVO.getCustomerId());
                    break;
                case 2:
                    result = dao.deleteRecord(customerVO.getCustomerId());
                    break;
                default:
                    result = 0;
                    break;
            }
            index++;
        }

        if (index < 3)
            throw new RuntimeException(Constant.STR_ADD_FAILED);

        return JSONObject.toJSONString(new ResultVO(Constant.REQUEST_SUCCESS, sessionVO.getToken()));
    }

    @Override
    public String listPromoter(SessionVO sessionVO, CustomerVO customerVO)
    {
        customerVO.setMyTeamId(sessionVO.getMyTeamId());
        List<CustomerVO> result = dao.listPromoter(customerVO, QMPermissionConstant.CREATE_RECORD);

        return JSONObject.toJSONString(new ResultVO(Constant.REQUEST_SUCCESS, sessionVO.getToken(), result));
    }

    @Override
    public String listRepertoryLevel(SessionVO sessionVO)
    {
        List<CustomerRepertoryVO> result = dao.listRepertoryLevel(sessionVO.getMyTeamId());

        return JSONObject.toJSONString(new ResultVO(Constant.REQUEST_SUCCESS, sessionVO.getToken(), result));
    }

    @Override
    public String listCustomerByKeyword(SessionVO sessionVO, String keyword, PageVO pageVO)
    {
        if (ParameterUtil.objectIsNull(pageVO))
            return JSONObject.toJSONString(new ResultVO(Constant.REQUEST_FAILED, sessionVO.getToken()));

        int start = PagingUtil.getStart(pageVO.getPageNum(), pageVO.getPageSize());
        int end = pageVO.getPageSize();

        CustomerVO customerVO = new CustomerVO();
        customerVO.setMyTeamId(sessionVO.getMyTeamId());
        customerVO.setUserId(sessionVO.getUserId());
        customerVO.setUserName(keyword);

        int pageCount = dao.countCustomer(customerVO);
        pageCount = PagingUtil.getCount(pageCount, pageVO.getPageSize());
        List<CustomerVO> result = dao.listCustomer(customerVO, start, end);

        JSONObject json = (JSONObject) JSONObject.toJSON(new ResultVO(Constant.REQUEST_SUCCESS, sessionVO.getToken(), result));
        json.put(KeyConstant.PAGE_COUNT, pageCount);

        return json.toJSONString();
    }

    @Override
    public String listMerchandiserCustomer(SessionVO sessionVO, CustomerVO customerVO, PageVO pageVO)
    {
        if (ParameterUtil.objectIsNull(pageVO))
            return JSONObject.toJSONString(new ResultVO(Constant.REQUEST_FAILED, sessionVO.getToken()));

        int start = PagingUtil.getStart(pageVO.getPageNum(), pageVO.getPageSize());
        int end = pageVO.getPageSize();

        customerVO.setUserId(null);
        customerVO.setMyTeamId(sessionVO.getMyTeamId());
        customerVO.setMerchandiserId(sessionVO.getUserId());

        int pageCount = dao.countCustomer(customerVO);
        pageCount = PagingUtil.getCount(pageCount, pageVO.getPageSize());
        List<CustomerVO> result = dao.listCustomer(customerVO, start, end);

        JSONObject json = (JSONObject) JSONObject.toJSON(new ResultVO(Constant.REQUEST_SUCCESS, sessionVO.getToken(), result));
        json.put(KeyConstant.PAGE_COUNT, pageCount);

        return json.toJSONString();
    }

    @Override
    public String listMerchandiserCustomerByKeyword(SessionVO sessionVO, String keyword, PageVO pageVO)
    {
        if (ParameterUtil.objectIsNull(pageVO))
            return JSONObject.toJSONString(new ResultVO(Constant.REQUEST_FAILED, sessionVO.getToken()));

        int start = PagingUtil.getStart(pageVO.getPageNum(), pageVO.getPageSize());
        int end = pageVO.getPageSize();

        CustomerVO customerVO = new CustomerVO();
        customerVO.setMyTeamId(sessionVO.getMyTeamId());
        customerVO.setMerchandiserId(sessionVO.getUserId());
        customerVO.setUserName(keyword);

        int pageCount = dao.countCustomer(customerVO);
        pageCount = PagingUtil.getCount(pageCount, pageVO.getPageSize());
        List<CustomerVO> result = dao.listCustomer(customerVO, start, end);

        JSONObject json = (JSONObject) JSONObject.toJSON(new ResultVO(Constant.REQUEST_SUCCESS, sessionVO.getToken(), result));
        json.put(KeyConstant.PAGE_COUNT, pageCount);

        return json.toJSONString();
    }

}
