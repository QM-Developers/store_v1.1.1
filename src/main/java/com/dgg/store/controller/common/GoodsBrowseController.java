package com.dgg.store.controller.common;

import com.dgg.store.service.common.GoodsBrowseService;
import com.dgg.store.util.core.constant.Constant;
import com.dgg.store.util.core.constant.RequestConstant;
import com.dgg.store.util.vo.core.PageVO;
import com.dgg.store.util.vo.core.ResultVO;
import com.dgg.store.util.vo.core.SessionVO;
import com.dgg.store.util.vo.goods.GoodsDetailVO;
import com.dgg.store.util.vo.goods.GoodsTypeVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

/**
 * 商品浏览控制器
 */
@Controller
public class GoodsBrowseController
{
    private final GoodsBrowseService service;

    public GoodsBrowseController(GoodsBrowseService service)
    {
        this.service = service;
    }

    /**
     * 查找商品分类
     *
     * @param request     用户参数
     * @param goodsTypeVO 查找条件
     * @return 分类信息
     */
    @RequestMapping(value = "user_findGoodsType", method = RequestMethod.POST, produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String findGoodsType(HttpServletRequest request, GoodsTypeVO goodsTypeVO)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.findGoodsType(sessionVO, goodsTypeVO);
    }

    /**
     * 查找分类下的商品
     *
     * @param request     用户参数
     * @param goodsTypeVO 商品类型
     * @param pageVO      分页参数
     * @return 商品信息
     */
    @RequestMapping(value = "user_findGoodsList", method = RequestMethod.POST, produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String findGoodsList(HttpServletRequest request, GoodsTypeVO goodsTypeVO, PageVO pageVO)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.findGoodsList(sessionVO, goodsTypeVO, pageVO);
    }

    /**
     * 查看商品详情
     *
     * @param request       用户参数
     * @param goodsDetailVO 商品Id
     * @return 商品详细信息
     */
    @RequestMapping(value = "user_findGoodsDetail", method = RequestMethod.POST, produces = {RequestConstant.CONTENT_TYPE})
    @ResponseBody
    public String findGoodsDetail(HttpServletRequest request, GoodsDetailVO goodsDetailVO)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.findGoodsDetail(sessionVO, goodsDetailVO);
    }

    /**
     * 搜索商品
     *
     * @param request     用户参数
     * @param goodsTypeVO 搜索关键字
     * @param pageVO      分页参数
     * @return 商品信息
     */
    @RequestMapping(value = "user_findGoodsByKeyword", method = RequestMethod.POST, produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String findGoodsByKeyword(HttpServletRequest request, GoodsTypeVO goodsTypeVO, PageVO pageVO)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.findGoodsList(sessionVO, goodsTypeVO, pageVO);
    }
}
