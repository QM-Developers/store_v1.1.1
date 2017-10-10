package com.dgg.store.controller.store;

import com.dgg.store.service.store.BranchService;
import com.dgg.store.util.core.constant.Constant;
import com.dgg.store.util.vo.branch.BranchGoodsVO;
import com.dgg.store.util.vo.branch.BranchVO;
import com.dgg.store.util.vo.core.PageVO;
import com.dgg.store.util.vo.core.ResultVO;
import com.dgg.store.util.vo.core.SessionVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

/**
 * 销售点控制器
 */
@Controller
public class BranchController
{
    @Autowired
    private BranchService service;

    /**
     * 添加销售点
     *
     * @param request  用户参数
     * @param branchVO 销售点参数
     * @return 操作的结果
     */
    @RequestMapping(value = "/s/addBranch", method = RequestMethod.POST)
    @ResponseBody
    public ResultVO addBranch(HttpServletRequest request, BranchVO branchVO)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.insertBranch(sessionVO, branchVO);
    }

    /**
     * 获取销售点列表
     *
     * @param request  用户参数
     * @param branchVO (暂时没用到)
     * @param pageVO   分页参数
     * @return 销售点列表
     */
    @RequestMapping(value = "/s/listBranch", method = RequestMethod.POST, produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String listBranch(HttpServletRequest request, BranchVO branchVO, PageVO pageVO)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.listBranch(sessionVO, branchVO, pageVO);
    }

    /**
     * 删除销售点
     *
     * @param request  用户参数
     * @param branchVO 销售点Id
     * @return 操作的结果
     */
    @RequestMapping(value = "/s/removeBranch", method = RequestMethod.POST)
    @ResponseBody
    public ResultVO removeBranch(HttpServletRequest request, BranchVO branchVO)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.deleteBranch(sessionVO, branchVO);
    }

    /**
     * 获取销售点详情
     *
     * @param request  用户参数
     * @param branchVO 销售点Id
     * @return 销售点详情
     */
    @RequestMapping(value = "/s/getBranch", method = RequestMethod.POST)
    @ResponseBody
    public ResultVO getBranch(HttpServletRequest request, BranchVO branchVO)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.getBranch(sessionVO, branchVO);
    }

    /**
     * 编辑销售点
     *
     * @param request  用户参数
     * @param branchVO 销售点参数
     * @return 操作的结果
     */
    @RequestMapping(value = "/s/updateBranch", method = RequestMethod.POST)
    @ResponseBody
    public ResultVO updateBranch(HttpServletRequest request, BranchVO branchVO)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.updateBranch(sessionVO, branchVO);
    }

    /**
     * 获取所有商品列表
     *
     * @param request  用户参数
     * @param branchVO 销售点Id
     * @param pageVO   分页参数
     * @return 商品列表
     */
    @RequestMapping(value = "/s/listGoods", method = RequestMethod.POST, produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String listGoods(HttpServletRequest request, BranchVO branchVO, PageVO pageVO)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.listGoods(sessionVO, branchVO, pageVO);
    }

    /**
     * 分配销售点商品
     *
     * @param request       用户参数
     * @param branchGoodsVO 商品参数
     * @return 操作的结果
     */
    @RequestMapping(value = "/s/updateBranchGoods", method = RequestMethod.POST)
    @ResponseBody
    public ResultVO updateBranchGoods(HttpServletRequest request, BranchGoodsVO branchGoodsVO)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.updateBranchGoods(sessionVO, branchGoodsVO);
    }

    /**
     * 获取销售点商品列表
     *
     * @param request  用户参数
     * @param branchVO 销售点Id
     * @param pageVO   分页参数
     * @return 商品列表
     */
    @RequestMapping(value = "/s/listBranchGoods", method = RequestMethod.POST, produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String listBranchGoods(HttpServletRequest request, BranchVO branchVO, PageVO pageVO)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.listBranchGoods(sessionVO, branchVO, pageVO);
    }

    /**
     * 查看当前销售点库存
     *
     * @param request  用户参数
     * @param branchVO 销售点Id
     * @param pageVO   分页参数
     * @return 商品列表
     */
    @RequestMapping(value = "/s/getRepertory", method = RequestMethod.POST, produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String getRepertory(HttpServletRequest request, BranchVO branchVO, PageVO pageVO)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.getRepertory(sessionVO, branchVO, pageVO);
    }

    /**
     * 查看当前销售点库存
     *
     * @param request  用户参数
     * @param branchVO 销售点Id
     * @param pageVO   分页参数
     * @return 商品列表
     */
    @RequestMapping(value = "/s/getFirstRepertory", method = RequestMethod.POST, produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String getFirstRepertory(HttpServletRequest request, BranchVO branchVO, PageVO pageVO)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.getFirstRepertory(sessionVO, branchVO, pageVO);
    }

}
