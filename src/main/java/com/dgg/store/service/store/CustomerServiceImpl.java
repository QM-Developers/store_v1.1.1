package com.dgg.store.service.store;

import com.alibaba.fastjson.JSONObject;
import com.dgg.store.dao.store.CustomerDao;
import com.dgg.store.mapper.PushMessageMapper;
import com.dgg.store.util.core.constant.*;
import com.dgg.store.util.core.generator.IDGenerator;
import com.dgg.store.util.core.page.PagingUtil;
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
import java.util.Date;
import java.util.List;

@Service
public class CustomerServiceImpl implements CustomerService
{
    @Autowired
    private CustomerDao dao;

    @Autowired
    private PushMessageMapper mapper;

    @Override
    public String insertCustomerRecord(CustomerVO customerVO, SessionVO sessionVO)
    {
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
        else
            result = 1;

        JSONObject json = (JSONObject) JSONObject.toJSON(new ResultVO(result == 1 ? 1 : 0, sessionVO.getToken(), customerVO.getCustomerId()));

        return json.toJSONString();
    }

    @Override
    public String listCustomer(SessionVO sessionVO, PageVO pageVO, CustomerVO customerVO)
    {
        int start = PagingUtil.getStart(pageVO.getPageNum(), pageVO.getPageSize());
        int end = pageVO.getPageSize();

        customerVO.setMyTeamId(sessionVO.getMyTeamId());
        customerVO.setUserId(sessionVO.getUserId());

        int pageCount = dao.countCustomer(customerVO);
        pageCount = PagingUtil.getCount(pageCount, pageVO.getPageSize());
        List<CustomerVO> result = dao.listCustomer(customerVO, start, end);

        JSONObject json = (JSONObject) JSONObject.toJSON(new ResultVO(1, sessionVO.getToken(), result));
        json.put(KeyConstant.PAGE_COUNT, pageCount);

        return json.toJSONString();
    }

    @Override
    public String updateCustomer(SessionVO sessionVO, CustomerVO customerVO)
    {
        Integer result = 1;
        int i = 0;
        int count = 2;

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

        JSONObject json = (JSONObject) JSONObject.toJSON(new ResultVO(result == 1 ? 1 : 0, sessionVO.getToken()));

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

        return JSONObject.toJSONString(new ResultVO(result == null ? Constant.REQUEST_FAILED : Constant.REQUEST_SUCCESS, sessionVO.getToken(), result));
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
            return JSONObject.toJSONString(new ResultVO(Constant.REQUEST_FAILED, sessionVO.getToken()));

        result = dao.insertRepertoryLevel(repertory);

        return JSONObject.toJSONString(new ResultVO(result < 0 ? Constant.REQUEST_FAILED : Constant.REQUEST_SUCCESS, sessionVO.getToken()));
    }

    @Override
    public String listAccountChecker(SessionVO sessionVO)
    {
        List<CustomerVO> result = dao.listAccountChecker(sessionVO.getMyTeamId(), QMPermissionConstant.ACCOUNT_CHECK);

        return JSONObject.toJSONString(new ResultVO(Constant.REQUEST_SUCCESS, sessionVO.getToken(), result));
    }

    @Override
    public String insertCustomerAccount(SessionVO sessionVO, CustomerAccountRequest accountRequest)
    {
        accountRequest.setProposerId(sessionVO.getUserId());
        accountRequest.setRequestId(IDGenerator.generator());
        accountRequest.setRequestStatus(CustomerConstant.ACCOUNT_STATUS_REQUEST);
        accountRequest.setCreateDate(new Date());
        accountRequest.setRequestReason(StringUtil.isEmpty(accountRequest.getRequestReason()) ? Constant.LOGININFO : accountRequest.getRequestReason());

        if (ReflectUtil.hadNull(accountRequest))
            JSONObject.toJSONString(new ResultVO(Constant.REQUEST_FAILED, sessionVO.getToken()));

        int result = dao.insertCustomerAccount(accountRequest);

        UMengUtil.sendUnicast(dao.getDeviceToken(accountRequest.getMerchandiserId()), PushMessageFactory.getInstance(mapper).get(PushMessageConstant.CUSTOMER_NEW));

        return JSONObject.toJSONString(new ResultVO(result < 1 ? Constant.REQUEST_FAILED : Constant.REQUEST_SUCCESS, sessionVO.getToken(), accountRequest.getRequestId()));
    }

    @Override
    public String updateCustomerAccountAccept(SessionVO sessionVO, CustomerAccountRequest accountRequest)
    {
        int result = 1;
        int index = 0;

        accountRequest = dao.getCustomerAccount(accountRequest.getRequestId());
        if (!accountRequest.getRequestStatus().equals(CustomerConstant.ACCOUNT_STATUS_REQUEST))
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
                    result = dao.updateCustomer(condition);
                default:
                    result = 0;
                    break;
            }
            index++;
        }

        if (index < 4)
            throw new RuntimeException(Constant.STR_ADD_FAILED);

        UMengUtil.sendUnicast(dao.getDeviceToken(accountRequest.getProposerId()), PushMessageFactory.getInstance(mapper).get(PushMessageConstant.CUSTOMER_PASS));

        return JSONObject.toJSONString(new ResultVO(result, sessionVO.getToken()));
    }

    @Override
    public String getCustomerAccount(SessionVO sessionVO, CustomerAccountRequest accountRequest)
    {
        CustomerAccountRequest result = dao.getCustomerAccount(accountRequest.getRequestId());

        return JSONObject.toJSONString(new ResultVO(result == null ? Constant.REQUEST_FAILED : Constant.REQUEST_SUCCESS, sessionVO.getToken(), result));
    }

    @Override
    public String updateCustomerAccountRefuse(SessionVO sessionVO, CustomerAccountRequest accountRequest)
    {
        accountRequest = dao.getCustomerAccount(accountRequest.getRequestId());

        if (!accountRequest.getRequestStatus().equals(CustomerConstant.ACCOUNT_STATUS_REQUEST))
            return JSONObject.toJSONString(new ResultVO(Constant.REQUEST_FAILED, sessionVO.getToken()));

        accountRequest.setRequestStatus(CustomerConstant.ACCOUNT_STATUS_REFUSE);
        int result = dao.updateCustomerAccountById(accountRequest);

        UMengUtil.sendUnicast(dao.getDeviceToken(accountRequest.getProposerId()), PushMessageFactory.getInstance(mapper).get(PushMessageConstant.CUSTOMER_REFUSE));

        return JSONObject.toJSONString(new ResultVO(result < 1 ? Constant.REQUEST_FAILED : Constant.REQUEST_SUCCESS, sessionVO.getToken()));
    }

    @Override
    public String listCustomerAccountByProposer(SessionVO sessionVO, CustomerAccountRequest accountRequest)
    {
        accountRequest.setProposerId(sessionVO.getUserId());
        List<CustomerAccountRequest> result = dao.listCustomerAccount(accountRequest);

        return JSONObject.toJSONString(new ResultVO(Constant.REQUEST_SUCCESS, sessionVO.getToken(), result));
    }

    @Override
    public String listCustomerAccountByChecker(SessionVO sessionVO, CustomerAccountRequest accountRequest)
    {
        List<CustomerAccountRequest> result = dao.listCustomerAccount(accountRequest);

        return JSONObject.toJSONString(new ResultVO(Constant.REQUEST_SUCCESS, sessionVO.getToken(), result));
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

}
