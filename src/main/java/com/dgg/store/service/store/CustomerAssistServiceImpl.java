package com.dgg.store.service.store;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.dgg.store.dao.store.CustomerAssistCustomerDao;
import com.dgg.store.dao.store.CustomerAssistDao;
import com.dgg.store.dao.store.CustomerAssistImageDao;
import com.dgg.store.dao.store.CustomerAssistUserDao;
import com.dgg.store.util.core.constant.Constant;
import com.dgg.store.util.core.constant.KeyConstant;
import com.dgg.store.util.core.constant.PathConstant;
import com.dgg.store.util.core.constant.SymbolConstant;
import com.dgg.store.util.core.generator.IDGenerator;
import com.dgg.store.util.core.page.PagingUtil;
import com.dgg.store.util.core.parameter.ParameterUtil;
import com.dgg.store.util.core.string.StringUtil;
import com.dgg.store.util.core.upload.UploadFileUtil;
import com.dgg.store.util.pojo.*;
import com.dgg.store.util.vo.core.PageVO;
import com.dgg.store.util.vo.core.ResultVO;
import com.dgg.store.util.vo.core.SessionVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.Date;
import java.util.List;

@Service
public class CustomerAssistServiceImpl implements CustomerAssistService
{
    private final CustomerAssistDao assistDao;
    private final CustomerAssistCustomerDao customerDao;
    private final CustomerAssistUserDao userDao;
    private final CustomerAssistImageDao imageDao;

    @Autowired
    public CustomerAssistServiceImpl(CustomerAssistDao assistDao, CustomerAssistCustomerDao customerDao, CustomerAssistUserDao userDao, CustomerAssistImageDao imageDao)
    {
        this.assistDao = assistDao;
        this.customerDao = customerDao;
        this.userDao = userDao;
        this.imageDao = imageDao;
    }

    @Override
    public String insertCustomerAssist(SessionVO sessionVO, CustomerAssist assist)
    {
        int result = 1;
        int index = 0;
        int count = 3;

        JSONArray jArr;

        while (result > 0)
        {
            switch (index)
            {
                case 0:
                    assist.setAssistId(IDGenerator.generator());
                    assist.setCreateDate(new Date());
                    assist.setUserId(sessionVO.getUserId());
                    assist.setUserName(assistDao.getUserName(sessionVO.getUserId()));
                    assist.setAssistTitle(Constant.EMPTY);
                    result = assistDao.insert(assist);
                    break;
                case 1:
                    jArr = JSONArray.parseArray(assist.getCustomer());
                    CustomerAssistCustomer customer;
                    for (Object obj : jArr)
                    {
                        customer = JSONObject.parseObject(obj.toString(), CustomerAssistCustomer.class);
                        customer.setAssistId(assist.getAssistId());
                        result = customerDao.insert(customer);
                        if (result < 1)
                            break;
                    }
                    break;
                case 2:
                    jArr = JSONArray.parseArray(assist.getUser());
                    CustomerAssistUser user;
                    for (Object obj : jArr)
                    {
                        user = JSONObject.parseObject(obj.toString(), CustomerAssistUser.class);
                        user.setAssistId(assist.getAssistId());
                        user.setAssistResult(Constant.EMPTY);
                        result = userDao.insert(user);
                        if (result < 1)
                            break;
                    }
                    break;
                case 3:
                    if (assist.getImage() == null)
                        break;
                    jArr = JSONArray.parseArray(assist.getImage());
                    CustomerAssistImage image;
                    for (Object obj : jArr)
                    {
                        image = JSONObject.parseObject(obj.toString(), CustomerAssistImage.class);
                        image.setAssistId(assist.getAssistId());
                        result = imageDao.updateByPrimaryKeySelective(image);
                        if (result < 1)
                            break;
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

        return JSONObject.toJSONString(new ResultVO(Constant.REQUEST_SUCCESS, sessionVO.getToken(), assist.getAssistId()));
    }

    @Override
    public String insertAssistImage(SessionVO sessionVO, MultipartFile file, String realPath, CustomerAssist assist)
    {
        int result = 0;
        StringBuilder path = new StringBuilder();
        String fileName;
        String imageId = IDGenerator.generator();

        try
        {
            path.append(PathConstant.USER_ASSIST_PATH).append(sessionVO.getUserId()).append(SymbolConstant.FORWARD_SLASH);
            fileName = UploadFileUtil.doUpload(file, path.toString(), realPath, imageId);
            CustomerAssistImage image = new CustomerAssistImage();
            image.setImageId(imageId);
            image.setImagePath(fileName);
            if (assist != null)
                image.setAssistId(StringUtil.isEmpty(assist.getAssistId()) ? Constant.EMPTY : assist.getAssistId());
            else
                image.setAssistId(Constant.EMPTY);
            result = imageDao.insertSelective(image);
        } catch (IOException e)
        {
            e.printStackTrace();
        }

        return JSONObject.toJSONString(new ResultVO(result, sessionVO.getToken(), imageId));
    }

    @Override
    public String listCustomerAssistByProposer(SessionVO sessionVO, PageVO pageVO)
    {
        CustomerAssistExample example = new CustomerAssistExample();
        CustomerAssistExample.Criteria criteria = example.createCriteria();

        example.setPageNum(PagingUtil.getStart(pageVO.getPageNum(), pageVO.getPageSize()));
        example.setPageSize(pageVO.getPageSize());

        criteria.andUserIdEqualTo(sessionVO.getUserId());

        int pageCount = PagingUtil.getCount((int) assistDao.countByExample(example), pageVO.getPageSize());
        List<CustomerAssist> result = assistDao.selectByExample(example);

        JSONObject json = (JSONObject) JSONObject.toJSON(new ResultVO(Constant.REQUEST_SUCCESS, sessionVO.getToken(), result));
        json.put(KeyConstant.PAGE_COUNT, pageCount);

        return json.toJSONString();
    }

    @Override
    public String listCustomerAssistByHelper(SessionVO sessionVO, CustomerAssist assist, PageVO pageVO)
    {
        int pageNum = PagingUtil.getStart(pageVO.getPageNum(), pageVO.getPageSize());
        int pageSize = pageVO.getPageSize();

        int pageCount = assistDao.countCustomerAssistByHelper(sessionVO.getUserId(), assist.getStatus());
        List<CustomerAssist> result = assistDao.listCustomerAssistByHelper(sessionVO.getUserId(), assist.getStatus(), pageNum, pageSize);

        for (CustomerAssist a : result)
            a.setStatus(ParameterUtil.getDefault(assist.getStatus(), 0));

        JSONObject json = (JSONObject) JSONObject.toJSON(new ResultVO(Constant.REQUEST_SUCCESS, sessionVO.getToken(), result));
        json.put(KeyConstant.PAGE_COUNT, pageCount);

        return json.toJSONString();
    }

    @Override
    public String getCustomerAssist(SessionVO sessionVO, CustomerAssist assist)
    {
        CustomerAssist result = assistDao.selectByPrimaryKey(assist.getAssistId());

        if (result == null)
            return JSONObject.toJSONString(new ResultVO(Constant.REQUEST_FAILED, sessionVO.getToken()));

        CustomerAssistImageExample imageExample = new CustomerAssistImageExample();
        CustomerAssistImageExample.Criteria imageCriteria = imageExample.createCriteria();
        CustomerAssistUserExample userExample = new CustomerAssistUserExample();
        CustomerAssistUserExample.Criteria userCriteria = userExample.createCriteria();
        CustomerAssistCustomerExample customerExample = new CustomerAssistCustomerExample();
        CustomerAssistCustomerExample.Criteria customerCriteria = customerExample.createCriteria();

        imageCriteria.andAssistIdEqualTo(assist.getAssistId());
        userCriteria.andAssistIdEqualTo(assist.getAssistId());
        customerCriteria.andAssistIdEqualTo(assist.getAssistId());

        result.setImageList(imageDao.selectByExample(imageExample));

        List<CustomerAssistUser> userList = userDao.selectByExample(userExample);
        for (CustomerAssistUser u : userList)
            if (StringUtil.isEmpty(u.getAssistResult()))
                u.setStatus((byte) 0);
            else
                u.setStatus((byte) 1);
        result.setUserList(userList);

        result.setCustomerList(customerDao.selectByExample(customerExample));

        return JSONObject.toJSONString(new ResultVO(Constant.REQUEST_SUCCESS, sessionVO.getToken(), result));
    }

    @Override
    public String updateCustomerAssistResult(SessionVO sessionVO, CustomerAssistUser assistUser)
    {
        CustomerAssistUserExample example = new CustomerAssistUserExample();
        CustomerAssistUserExample.Criteria criteria = example.createCriteria();

        criteria.andAssistIdEqualTo(assistUser.getAssistId());
        criteria.andUserIdEqualTo(sessionVO.getUserId());

        CustomerAssistUser newAssistUser = new CustomerAssistUser();
        newAssistUser.setAssistResult(assistUser.getAssistResult());

        int result = userDao.updateByExampleSelective(newAssistUser, example);

        return JSONObject.toJSONString(new ResultVO(result < 1 ? Constant.REQUEST_FAILED : Constant.REQUEST_SUCCESS, sessionVO.getToken()));
    }
}
