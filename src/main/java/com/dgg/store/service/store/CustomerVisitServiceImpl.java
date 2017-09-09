package com.dgg.store.service.store;

import com.alibaba.fastjson.JSONObject;
import com.dgg.store.dao.store.CustomerFollowDao;
import com.dgg.store.dao.store.CustomerVisitDao;
import com.dgg.store.util.core.constant.Constant;
import com.dgg.store.util.core.constant.KeyConstant;
import com.dgg.store.util.core.constant.PlaceConstant;
import com.dgg.store.util.core.page.PagingUtil;
import com.dgg.store.util.pojo.*;
import com.dgg.store.util.vo.core.PageVO;
import com.dgg.store.util.vo.core.ResultVO;
import com.dgg.store.util.vo.core.SessionVO;
import com.dgg.store.util.vo.customer.CustomerVO;
import com.dgg.store.util.vo.manage.DepartmentVO;
import com.dgg.store.util.vo.manage.MemberVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class CustomerVisitServiceImpl implements CustomerVisitService
{
    @Autowired
    private CustomerVisitDao dao;

    @Autowired
    private CustomerFollowDao followDao;

    @Override
    public String listVisitDepartment(SessionVO sessionVO)
    {
        List<DepartmentVO> result = dao.listVisitDepartment(sessionVO.getUserId());

        return JSONObject.toJSONString(new ResultVO(Constant.REQUEST_SUCCESS, sessionVO.getToken(), result));
    }

    @Override
    public String listVisitMember(SessionVO sessionVO, MemberVO memberVO)
    {
        List<MemberVO> result = dao.listVisitMember(memberVO.getDepartmentId());

        return JSONObject.toJSONString(new ResultVO(Constant.REQUEST_SUCCESS, sessionVO.getToken(), result));
    }

    @Override
    public String listVisitCustomer(SessionVO sessionVO, CustomerVO customerVO, PageVO pageVO)
    {
        customerVO.setPageNum(PagingUtil.getStart(pageVO.getPageNum(), pageVO.getPageSize()));
        customerVO.setPageSize(pageVO.getPageSize());
        customerVO.setMyTeamId(sessionVO.getMyTeamId());

        int pageCount = dao.countVisitCustomer(customerVO);
        pageCount = PagingUtil.getCount(pageCount, pageVO.getPageSize());

        List<CustomerVO> result = dao.listVisitCustomer(customerVO);

        JSONObject json = (JSONObject) JSONObject.toJSON(new ResultVO(Constant.REQUEST_SUCCESS, sessionVO.getToken(), result));
        json.put(KeyConstant.PAGE_COUNT, pageCount);

        return json.toJSONString();
    }

    @Override
    public String getVisitCustomer(SessionVO sessionVO, CustomerVO customerVO)
    {
        CustomerVO result = dao.getVisitCustomer(customerVO);

        return JSONObject.toJSONString(new ResultVO(Constant.REQUEST_SUCCESS, sessionVO.getToken(), result));
    }

    @Override
    public String listVisitUserPlace(SessionVO sessionVO, UserPlace place, PageVO pageVO)
    {
        place.setPageNum(PagingUtil.getStart(pageVO.getPageNum(), pageVO.getPageSize()));
        place.setPageSize(pageVO.getPageSize());
        int pageCount = PagingUtil.getCount(dao.countVisitUserPlace(place), pageVO.getPageSize());
        List<UserPlace> result = dao.listVisitUserPlace(place);

        for (UserPlace up : result)
        {
            List<PlaceImage> certificateList = new ArrayList<>();
            List<PlaceImage> environmentList = new ArrayList<>();
            List<PlaceImage> imageList = up.getImageList();
            for (PlaceImage pi : imageList)
            {
                if (pi.getImgType().equals(PlaceConstant.ENVIRONMENT))
                    environmentList.add(pi);
                else
                    certificateList.add(pi);
            }
            up.setCertificateList(certificateList);
            up.setEnvironmentList(environmentList);
            up.setImageList(null);
        }

        JSONObject json = (JSONObject) JSONObject.toJSON(new ResultVO(1, sessionVO.getToken(), result));
        json.put(KeyConstant.PAGE_COUNT, pageCount);

        return json.toJSONString();
    }

    @Override
    public String getVisitUserPlace(SessionVO sessionVO, UserPlace place)
    {
        UserPlace result = dao.getUserPlaceById(place.getUserPlaceId());

        List<PlaceImage> certificateList = new ArrayList<>();
        List<PlaceImage> environmentList = new ArrayList<>();
        List<PlaceImage> imageList = result.getImageList();

        for (PlaceImage pi : imageList)
        {
            if (pi.getImgType().equals(PlaceConstant.ENVIRONMENT))
                environmentList.add(pi);
            else
                certificateList.add(pi);
        }

        result.setCertificateList(certificateList);
        result.setEnvironmentList(environmentList);
        result.setImageList(null);

        return JSONObject.toJSONString(new ResultVO(Constant.REQUEST_SUCCESS, sessionVO.getToken(), result));
    }

    @Override
    public String listVisitUserBreed(SessionVO sessionVO, UserPlace place, PageVO pageVO)
    {
        place.setPageNum(PagingUtil.getStart(pageVO.getPageNum(), pageVO.getPageSize()));
        place.setPageSize(pageVO.getPageSize());
        int pageCount = PagingUtil.getCount(dao.countVisitUserBreed(place), pageVO.getPageSize());

        List<UserBreed> result = dao.listVisitUserBreed(place);

        JSONObject json = (JSONObject) JSONObject.toJSON(new ResultVO(Constant.REQUEST_SUCCESS, sessionVO.getToken(), result));
        json.put(KeyConstant.PAGE_COUNT, pageCount);

        return json.toJSONString();
    }

    @Override
    public String listVisitFarmer(SessionVO sessionVO, Farmer farmer, PageVO pageVO)
    {
        farmer.setPageNum(PagingUtil.getStart(pageVO.getPageNum(), pageVO.getPageSize()));
        farmer.setPageSize(pageVO.getPageSize());
        int pageCount = PagingUtil.getCount(dao.countVisitFarmer(farmer), pageVO.getPageSize());

        List<Farmer> result = dao.listVisitFarmer(farmer);

        JSONObject json = (JSONObject) JSONObject.toJSON(new ResultVO(Constant.REQUEST_SUCCESS, sessionVO.getToken(), result));
        json.put(KeyConstant.PAGE_COUNT, pageCount);

        return json.toJSONString();
    }

    @Override
    public String listVisitManageUnit(SessionVO sessionVO, ManageUnit unit, PageVO pageVO)
    {
        unit.setPageNum(PagingUtil.getStart(pageVO.getPageNum(), pageVO.getPageSize()));
        unit.setPageSize(pageVO.getPageSize());
        int pageCount = PagingUtil.getCount(dao.countVisitManageUnit(unit), pageVO.getPageSize());

        List<Farmer> result = dao.listVisitManageUnit(unit);

        JSONObject json = (JSONObject) JSONObject.toJSON(new ResultVO(Constant.REQUEST_SUCCESS, sessionVO.getToken(), result));
        json.put(KeyConstant.PAGE_COUNT, pageCount);

        return json.toJSONString();
    }

    @Override
    public String listVisitCustomerFollow(SessionVO sessionVO, CustomerFollow follow, PageVO pageVO)
    {
        CustomerFollowExample example = new CustomerFollowExample();
        example.setPageNum(PagingUtil.getStart(pageVO.getPageNum(), pageVO.getPageSize()));
        example.setPageSize(pageVO.getPageSize());

        CustomerFollowExample.Criteria criteria = example.createCriteria();

        criteria.andCustomerIdEqualTo(follow.getCustomerId());

        int pageCount = PagingUtil.getCount((int) followDao.countByExample(example), pageVO.getPageSize());
        List<CustomerFollow> result = followDao.selectByExample(example);

        JSONObject json = (JSONObject) JSONObject.toJSON(new ResultVO(Constant.REQUEST_SUCCESS, sessionVO.getToken(), result));
        json.put(KeyConstant.PAGE_COUNT, pageCount);

        return json.toJSONString();
    }

    @Override
    public String getVisitCustomerFollow(SessionVO sessionVO, CustomerFollow follow)
    {
        CustomerFollow result = followDao.selectByPrimaryKey(follow.getFollowId());

        return JSONObject.toJSONString(new ResultVO(result == null ? Constant.REQUEST_FAILED : Constant.REQUEST_SUCCESS, sessionVO.getToken(), result));
    }
}
