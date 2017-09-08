package com.dgg.store.service.store;

import com.alibaba.fastjson.JSONObject;
import com.dgg.store.dao.store.CustomerVisitDao;
import com.dgg.store.util.core.constant.Constant;
import com.dgg.store.util.core.constant.KeyConstant;
import com.dgg.store.util.core.constant.PlaceConstant;
import com.dgg.store.util.core.page.PagingUtil;
import com.dgg.store.util.pojo.PlaceImage;
import com.dgg.store.util.pojo.UserPlace;
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
        place.setPageNum(PagingUtil.getStart(pageVO.getPageNum(),pageVO.getPageSize()));
        place.setPageSize(pageVO.getPageSize());
        int pageCount = PagingUtil.getCount(dao.countVisitUserPlace(place),pageVO.getPageSize());
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
        json.put(KeyConstant.PAGE_COUNT,pageCount);

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

        return JSONObject.toJSONString(new ResultVO(Constant.REQUEST_SUCCESS,sessionVO.getToken(),result));
    }
}
