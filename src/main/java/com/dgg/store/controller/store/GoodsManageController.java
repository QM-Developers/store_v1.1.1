package com.dgg.store.controller.store;

import com.dgg.store.service.store.GoodsManageService;
import com.dgg.store.util.core.constant.Constant;
import com.dgg.store.util.core.constant.RequestConstant;
import com.dgg.store.util.pojo.GoodsTypeinfo;
import com.dgg.store.util.vo.core.PageVO;
import com.dgg.store.util.vo.core.ResultVO;
import com.dgg.store.util.vo.core.SessionVO;
import com.dgg.store.util.vo.goods.GoodsInfoVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;

/**
 * 商品管理控制器
 */
@Controller
public class GoodsManageController
{
    @Autowired
    private GoodsManageService service;

    /**
     * 查找商品所属类目
     *
     * @param request  用户参数
     * @param typeinfo 类目Id
     * @return 商品类目
     */
    @RequestMapping(value = "/s/findTypeAndParents", method = RequestMethod.POST, produces = RequestConstant.CONTENT_TYPE)
    @ResponseBody
    public String findTypeAndParents(HttpServletRequest request, GoodsTypeinfo typeinfo)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.findTypeAndParents(sessionVO, typeinfo);
    }

    @RequestMapping(value = "/s/findGoodsTypeByPid", method = RequestMethod.POST, produces = RequestConstant.CONTENT_TYPE)
    @ResponseBody
    public String findGoodsTypeByPid(HttpServletRequest request, GoodsTypeinfo typeinfo)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.findGoodsTypeByPid(sessionVO, typeinfo);
    }

//    @RequestMapping(value = "/s/findTypeAttr")
//    @ResponseBody
//    public ResultVO findTypeAttr(HttpServletRequest request, GoodsTypeAttr typeAttr)
//    {
//        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);
//
//        return service.findTypeAttr(sessionVO, typeAttr);
//    }

    /**
     * 添加图片到图片空间
     *
     * @param file    图片文件
     * @param request 用户参数
     * @return 图片Id
     */
    @RequestMapping(value = "/s/uploadToImgSpace", method = RequestMethod.POST)
    @ResponseBody
    public ResultVO uploadToImgSpace(@RequestParam(value = "img", required = false) MultipartFile file, HttpServletRequest request)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.insertImgToSpace(sessionVO, file);
    }

    /**
     * 添加商品
     *
     * @param request   用户参数
     * @param goodsinfo 商品信息
     * @return 操作的结果
     */
    @RequestMapping(value = "/s/goodsRelease", method = RequestMethod.POST,produces = RequestConstant.CONTENT_TYPE)
    @ResponseBody
    public String goodsRelease(HttpServletRequest request, GoodsInfoVO goodsinfo)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.insertGoodsinfo(sessionVO, goodsinfo);
    }

    /**
     * 修改商品
     *
     * @param request   用户参数
     * @param goodsInfo 商品信息
     * @return 操作的结果
     */
    @RequestMapping(value = "/s/updateGoods", method = RequestMethod.POST)
    @ResponseBody
    public String updateGoods(HttpServletRequest request, GoodsInfoVO goodsInfo)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.updateGoods(sessionVO, goodsInfo);
    }

    /**
     * 删除商品
     *
     * @param request   用户参数
     * @param goodsInfo 商品Id
     * @return 操作的结果
     */
    @RequestMapping(value = "/s/deleteGoods", method = RequestMethod.POST)
    @ResponseBody
    public ResultVO deleteGoods(HttpServletRequest request, GoodsInfoVO goodsInfo)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.deleteGoods(sessionVO, goodsInfo);
    }

//    @RequestMapping(value = "/s/saveGoodsDraft", method = RequestMethod.POST)
//    @ResponseBody
//    public ResultVO saveGoodsDraft(HttpServletRequest request, GoodsInfoVO goodsinfo)
//    {
//        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);
//
//        return service.insertGoodsinfo(sessionVO, goodsinfo);
//    }

    /**
     * 获取图片空间图片
     *
     * @param request 用户参数
     * @return 图片列表
     */
    @RequestMapping(value = "/s/findImages", method = RequestMethod.POST,produces = RequestConstant.CONTENT_TYPE)
    @ResponseBody
    public String findImages(HttpServletRequest request)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.findImages(sessionVO);
    }

    /**
     * 获取商品列表
     *
     * @param request 用户参数
     * @param pageVO  分页参数
     * @return 商品列表
     */
    @RequestMapping(value = "/s/findGoodsList", method = RequestMethod.POST, produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String findGoodsList(HttpServletRequest request, PageVO pageVO)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.findGoodsList(sessionVO, pageVO);
    }

    /**
     * 搜索商品
     *
     * @param request   用户参数
     * @param goodsInfo 关键字
     * @param pageVO    分页参数
     * @return 商品列表
     */
    @RequestMapping(value = "/s/findGoodsListByKeyword", method = RequestMethod.POST, produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String findGoodsListByKeyword(HttpServletRequest request, GoodsInfoVO goodsInfo, PageVO pageVO)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.findGoodsListByKeyword(sessionVO, goodsInfo, pageVO);
    }

    /**
     * 获取商品详情
     *
     * @param request 用户参数
     * @param infoVO  商品Id
     * @return 商品详情
     */
    @RequestMapping(value = "/s/findGoodsInfo", method = RequestMethod.POST, produces = RequestConstant.CONTENT_TYPE)
    @ResponseBody
    public String findGoodsInfo(HttpServletRequest request, GoodsInfoVO infoVO)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.findGoodsInfo(sessionVO, infoVO);
    }

    /**
     * 获取商品描述
     *
     * @param request 用户参数
     * @param infoVO  商品描述图片Id
     * @return 图片列表
     */
    @RequestMapping(value = "/s/findGoodsDescribe", method = RequestMethod.POST, produces = RequestConstant.CONTENT_TYPE)
    @ResponseBody
    public String findGoodsDescribe(HttpServletRequest request, GoodsInfoVO infoVO)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.findGoodsDescribe(sessionVO, infoVO);
    }
}
