package com.dgg.store.controller.store;

import com.dgg.store.service.store.GoodsTypeService;
import com.dgg.store.util.core.constant.Constant;
import com.dgg.store.util.pojo.GoodsTypeAttr;
import com.dgg.store.util.pojo.GoodsTypeinfo;
import com.dgg.store.util.vo.goods.GoodsTypeVO;
import com.dgg.store.util.vo.core.ResultVO;
import com.dgg.store.util.vo.core.SessionVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
public class GoodsTypeController
{
    @Autowired
    private GoodsTypeService service;

    @RequestMapping(value = "/s/findGoodsTypeByPid",method = RequestMethod.POST)
    @ResponseBody
    public ResultVO findGoodsTypeByPid(HttpServletRequest request, GoodsTypeinfo typeinfo)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.findGoodsTypeByPid(sessionVO,typeinfo);
    }

    @RequestMapping(value = "/s/findGoodsTypeTree",method = RequestMethod.POST)
    @ResponseBody
    public Object findGoodsTypeTree()
    {
        return service.findTypeTree();
    }

    @RequestMapping(value = "/s/addGoodsType",method = RequestMethod.POST)
    @ResponseBody
    public Integer addGoodsType(GoodsTypeinfo typeinfo)
    {
        return service.insertGoodsType(typeinfo);
    }

    @RequestMapping(value = "/s/deleteGoodsType")
    @ResponseBody
    public ResultVO deleteGoodsType(HttpServletRequest request, GoodsTypeVO typeVO)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.deleteGoodsType(sessionVO,typeVO);
    }

    @RequestMapping(value = "/s/findGoodsTypeAttr",method = RequestMethod.POST)
    @ResponseBody
    public List<GoodsTypeAttr> findGoodsTypeAttr(GoodsTypeAttr typeAttr)
    {
        return service.findGoodsTypeAttr(typeAttr);
    }

    @RequestMapping(value = "/s/addGoodsTypeAttr",method = RequestMethod.POST)
    @ResponseBody
    public Integer addGoodsTypeAttr(GoodsTypeAttr typeAttr)
    {
        return service.insertGoodsTypeAttr(typeAttr);
    }

}
