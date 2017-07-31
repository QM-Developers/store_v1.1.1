package com.dgg.store.controller.store;

import com.dgg.store.service.store.BranchService;
import com.dgg.store.util.core.constant.Constant;
import com.dgg.store.util.vo.branch.BranchVO;
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

    @RequestMapping(value = "/s/addBranch",method = RequestMethod.POST)
    @ResponseBody
    public ResultVO addBranch(HttpServletRequest request, BranchVO branchVO)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.insertBranch(sessionVO,branchVO);
    }
}
