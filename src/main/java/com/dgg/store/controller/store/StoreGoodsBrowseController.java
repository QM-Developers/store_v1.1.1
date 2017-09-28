package com.dgg.store.controller.store;

import com.dgg.store.service.store.StoreGoodsBrowseService;
import com.dgg.store.util.core.constant.Constant;
import com.dgg.store.util.vo.core.PageVO;
import com.dgg.store.util.vo.core.SessionVO;
import com.dgg.store.util.vo.goods.GoodsDetailVO;
import com.dgg.store.util.vo.goods.GoodsTypeVO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

/**
 * 商家浏览商品控制器
 */
@Controller
public class StoreGoodsBrowseController
{
    private final StoreGoodsBrowseService service;

    public StoreGoodsBrowseController(StoreGoodsBrowseService service)
    {
        this.service = service;
    }

    /**
     * 查找分类下的商品
     *
     * @param request     用户参数
     * @param goodsTypeVO 商品类型
     * @param pageVO      分页参数
     * @return 商品信息
     */
    @RequestMapping(value = "/s/goods/browse/listByType", method = RequestMethod.POST, produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String listByType(HttpServletRequest request, GoodsTypeVO goodsTypeVO, PageVO pageVO)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.listByType(sessionVO, goodsTypeVO, pageVO);
    }

    /**
     * 查看商品详情
     *
     * @param request     用户参数
     * @param goodsDetailVO 商品Id
     * @return 商品详情
     */
    @RequestMapping(value = "/s/goods/browse/get", method = RequestMethod.POST, produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String get(HttpServletRequest request, GoodsDetailVO goodsDetailVO)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.get(sessionVO, goodsDetailVO);
    }

    /**
     * 搜索商品
     *
     * @param request     用户参数
     * @param goodsTypeVO 搜索关键字
     * @param pageVO      分页参数
     * @return 商品信息
     */
    @RequestMapping(value = "/s/goods/browse/search", method = RequestMethod.POST, produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String search(HttpServletRequest request, GoodsTypeVO goodsTypeVO, PageVO pageVO)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.listByType(sessionVO, goodsTypeVO, pageVO);
    }

}
