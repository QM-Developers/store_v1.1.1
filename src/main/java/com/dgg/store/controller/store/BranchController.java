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

@Controller
public class BranchController
{
    @Autowired
    private BranchService service;

    @RequestMapping(value = "/s/addBranch", method = RequestMethod.POST)
    @ResponseBody
    public ResultVO addBranch(HttpServletRequest request, BranchVO branchVO)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.insertBranch(sessionVO, branchVO);
    }

    @RequestMapping(value = "/s/listBranch", method = RequestMethod.POST, produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String listBranch(HttpServletRequest request, BranchVO branchVO, PageVO pageVO)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.listBranch(sessionVO, branchVO, pageVO);
    }

    @RequestMapping(value = "/s/removeBranch", method = RequestMethod.POST)
    @ResponseBody
    public ResultVO removeBranch(HttpServletRequest request, BranchVO branchVO)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.deleteBranch(sessionVO, branchVO);
    }

    @RequestMapping(value = "/s/getBranch", method = RequestMethod.POST)
    @ResponseBody
    public ResultVO getBranch(HttpServletRequest request, BranchVO branchVO)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.getBranch(sessionVO, branchVO);
    }

    @RequestMapping(value = "/s/updateBranch", method = RequestMethod.POST)
    @ResponseBody
    public ResultVO updateBranch(HttpServletRequest request, BranchVO branchVO)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.updateBranch(sessionVO, branchVO);
    }

    @RequestMapping(value = "/s/listGoods", method = RequestMethod.POST, produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String listGoods(HttpServletRequest request, BranchVO branchVO, PageVO pageVO)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.listGoods(sessionVO, branchVO, pageVO);
    }

    @RequestMapping(value = "/s/updateBranchGoods", method = RequestMethod.POST)
    @ResponseBody
    public ResultVO updateBranchGoods(HttpServletRequest request, BranchGoodsVO branchGoodsVO)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.updateBranchGoods(sessionVO, branchGoodsVO);
    }

    @RequestMapping(value = "/s/listBranchGoods", method = RequestMethod.POST, produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String listBranchGoods(HttpServletRequest request, BranchVO branchVO, PageVO pageVO)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.listBranchGoods(sessionVO, branchVO, pageVO);
    }
}
