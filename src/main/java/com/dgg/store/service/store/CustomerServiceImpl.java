package com.dgg.store.service.store;

import com.dgg.store.dao.store.CustomerDao;
import com.dgg.store.util.core.constant.Constant;
import com.dgg.store.util.core.generator.IDGenerator;
import com.dgg.store.util.pojo.MyTeam;
import com.dgg.store.util.vo.CustomerGroupVO;
import com.dgg.store.util.vo.CustomerVO;
import com.dgg.store.util.vo.core.ResultVO;
import com.dgg.store.util.vo.core.SessionVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CustomerServiceImpl implements CustomerService
{
    @Autowired
    private CustomerDao dao;

    @Override
    public ResultVO findCustomerByGroup(SessionVO sessionVO, CustomerVO customerVO)
    {
        List<CustomerVO> result = dao.findCustomerByGroup(customerVO.getCustomerGroupId(), sessionVO.getUserId());

        ResultVO resultVO = new ResultVO(1, sessionVO.getToken(), result);

        return resultVO;
    }

    @Override
    public ResultVO findCustomerInfo(SessionVO sessionVO, CustomerVO customerVO)
    {
        CustomerVO result = dao.findCustomerInfo(customerVO.getCustomerId());

        ResultVO resultVO = new ResultVO(result == null ? 0 : 1, sessionVO.getToken(), result);

        return resultVO;
    }

    @Override
    public ResultVO insertCooperation(SessionVO sessionVO, MyTeam myTeam)
    {
        myTeam.setMyTeamUid(sessionVO.getUserId());

        Integer result = dao.insertCooperation(myTeam);

        ResultVO resultVO = new ResultVO(result, sessionVO.getToken());

        return resultVO;
    }

    @Override
    public ResultVO findCooperation(SessionVO sessionVO)
    {
        List<MyTeam> result = dao.findCooperation(sessionVO.getUserId());

        ResultVO resultVO = new ResultVO(result.size() < 1 ? 0 : 1, sessionVO.getToken(), result);

        return resultVO;
    }

    @Override
    public ResultVO findPartner(SessionVO sessionVO, String cooperId)
    {
        List<CustomerVO> result = dao.findPartner(Integer.parseInt(cooperId));

        ResultVO resultVO = new ResultVO(result.size() < 1 ? 0 : 1, sessionVO.getToken(), result);

        return resultVO;
    }

    @Override
    public ResultVO insertCustomerToCooper(SessionVO sessionVO, CustomerVO customerVO)
    {
        customerVO.setUserId(IDGenerator.generator());
        Integer result = dao.insertStoreUser(customerVO);

        ResultVO resultVO = new ResultVO(result, sessionVO.getToken());

        return resultVO;
    }

    @Override
    public ResultVO updateCustomer(SessionVO sessionVO, CustomerVO customerVO)
    {
        Integer result = 1;
        int i = 0;
        int count = 3;

        while (result > 0)
        {
            switch (i)
            {
                case 0:
                    result = dao.insertCustomerHistory(customerVO.getCustomerId());
                    break;
                case 1:
                    result = dao.updateCustomerRecord(customerVO);
                    if (result == 0)
                        result = dao.updateCustomerUser(customerVO);
                    break;
                case 2:
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

        ResultVO resultVO = new ResultVO(result, sessionVO.getToken());

        return resultVO;
    }

    @Override
    public ResultVO findCustomerGroup(SessionVO sessionVO)
    {
        List<CustomerGroupVO> result = dao.findCustomerGroup();

        ResultVO resultVO = new ResultVO(result.size() < 1 ? 0 : 1, sessionVO.getToken(), result);

        return resultVO;
    }

    @Override
    public ResultVO insertCustomerRecord(CustomerVO customerVO, SessionVO sessionVO)
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
                    customerVO.setRoleId(Integer.parseInt(Constant.ROLE_DEFAULT_USER));
                    customerVO.setMyTeamId(Constant.EMPTY);
                    result = dao.insertCustomerRecord(customerVO);
                    break;
                case 1:
                    customerVO.setCustomerId(IDGenerator.generator());
                    customerVO.setPromoterId(sessionVO.getUserId());
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

        ResultVO resultVO = new ResultVO(result, sessionVO.getToken());

        return resultVO;
    }

    @Override
    public ResultVO findCustomerUpdateCount(SessionVO sessionVO,CustomerVO customerVO)
    {
        int result = dao.findCustomerUpdateCount(customerVO.getCustomerId());

        ResultVO resultVO = new ResultVO(1,sessionVO.getToken(),result);

        return resultVO;
    }
}
