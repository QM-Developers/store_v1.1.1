package com.dgg.store.controller.store;

import com.dgg.store.service.store.FarmerService;
import com.dgg.store.util.core.constant.Constant;
import com.dgg.store.util.pojo.Farmer;
import com.dgg.store.util.vo.core.PageVO;
import com.dgg.store.util.vo.core.SessionVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

/**
 * 农户信息控制器
 */
@Controller
public class FarmerController
{
    @Autowired
    private FarmerService service;

    /**
     * 添加农户
     *
     * @param request 用户参数
     * @param farmer  农户信息
     * @return 农户Id
     */
    @RequestMapping(value = "/s/saveFarmer", method = RequestMethod.POST, produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String saveFarmer(HttpServletRequest request, Farmer farmer)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.insertFarmer(sessionVO, farmer);
    }

    /**
     * 获取农户列表
     *
     * @param request 用户参数
     * @param farmer  客户Id
     * @param pageVO  分页参数
     * @return 农户列表
     */
    @RequestMapping(value = "/s/listFarmer", method = RequestMethod.POST, produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String listFarmer(HttpServletRequest request, Farmer farmer, PageVO pageVO)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.listFarmer(sessionVO, farmer, pageVO);
    }

    /**
     * 修改农户
     *
     * @param request 用户参数
     * @param farmer  农户信息
     * @return 操作的结果
     */
    @RequestMapping(value = "/s/updateFarmer", method = RequestMethod.POST, produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String updateFarmer(HttpServletRequest request, Farmer farmer)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.updateFarmer(sessionVO, farmer);
    }

    /**
     * 删除农户
     *
     * @param request 用户参数
     * @param farmer  农户Id
     * @return 操作的结果
     */
    @RequestMapping(value = "/s/removeFarmer", method = RequestMethod.POST, produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String removeFarmer(HttpServletRequest request, Farmer farmer)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.deleteFarmer(sessionVO, farmer);
    }
}
