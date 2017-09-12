package com.dgg.store.controller.store;

import com.dgg.store.service.store.ManageUnitService;
import com.dgg.store.util.core.constant.Constant;
import com.dgg.store.util.pojo.ManageUnit;
import com.dgg.store.util.vo.core.PageVO;
import com.dgg.store.util.vo.core.SessionVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

/**
 * 经营单位控制器
 */
@Controller
public class ManageUnitController
{
    @Autowired
    private ManageUnitService service;

    /**
     * 添加经营单位
     *
     * @param request 用户参数
     * @param unit    经营单位参数
     * @return 经营单位Id
     */
    @RequestMapping(value = "/s/saveManageUnit", method = RequestMethod.POST, produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String saveUserBreed(HttpServletRequest request, ManageUnit unit)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.insertManageUnit(sessionVO, unit);
    }

    /**
     * 获取经营单位列表
     *
     * @param request 用户参数
     * @param unit    客户Id
     * @param pageVO  分页参数
     * @return 营单位列表
     */
    @RequestMapping(value = "/s/listManageUnit", method = RequestMethod.POST, produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String listManageUnit(HttpServletRequest request, ManageUnit unit, PageVO pageVO)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.listManageUnit(sessionVO, unit, pageVO);
    }

    /**
     * 修改经营单位
     *
     * @param request 用户参数
     * @param unit    经营单位参数
     * @return 操作的结果
     */
    @RequestMapping(value = "/s/updateManageUnit", method = RequestMethod.POST, produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String updateManageUnit(HttpServletRequest request, ManageUnit unit)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.updateManageUnit(sessionVO, unit);
    }

    /**
     * 删除经营单位
     *
     * @param request 用户参数
     * @param unit    经营单位Id
     * @return
     */
    @RequestMapping(value = "/s/removeManageUnit", method = RequestMethod.POST, produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String removeManageUnit(HttpServletRequest request, ManageUnit unit)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.deleteManageUnit(sessionVO, unit);
    }
}
