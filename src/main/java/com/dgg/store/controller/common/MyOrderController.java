package com.dgg.store.controller.common;

import com.dgg.store.service.common.MyOrderService;
import com.dgg.store.util.core.constant.Constant;
import com.dgg.store.util.pojo.MyOrder;
import com.dgg.store.util.vo.core.PageVO;
import com.dgg.store.util.vo.core.SessionVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

/**
 * 我的订单控制器
 */
@Controller
public class MyOrderController
{
    @Autowired
    private MyOrderService service;

    /**
     * 生成订单
     *
     * @param request 用户参数
     * @param myOrder 订单信息
     * @return 添加结果
     */
    @RequestMapping(value = "user_saveMyOrder", method = RequestMethod.POST, produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String saveMyOrder(HttpServletRequest request, MyOrder myOrder)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.insertMyOrder(sessionVO, myOrder);
    }

    /**
     * 获取订单列表
     *
     * @param request 用户参数
     * @param pageVO  分页参数
     * @return 订单列表
     */
    @RequestMapping(value = "user_listMyOrder", method = RequestMethod.POST, produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String listMyOrder(HttpServletRequest request, PageVO pageVO)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.listMyOrder(sessionVO, pageVO);
    }

    /**
     * 筛选订单
     *
     * @param request 用户参数
     * @param myOrder 筛选参数
     * @param pageVO  分页参数
     * @return 订单列表
     */
    @RequestMapping(value = "user_listMyOrderSelective", method = RequestMethod.POST, produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String listMyOrderSelective(HttpServletRequest request, MyOrder myOrder, PageVO pageVO)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.listMyOrderSelective(sessionVO, myOrder, pageVO);
    }

    /**
     * 获取订单详情
     *
     * @param request 用户参数
     * @param myOrder 订单的Id
     * @return 订单详细信息
     */
    @RequestMapping(value = "user_getMyOrder", method = RequestMethod.POST, produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String getMyOrder(HttpServletRequest request, MyOrder myOrder)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.getMyOrder(sessionVO, myOrder);
    }

    /**
     * 确认签收
     *
     * @param request 用户参数
     * @param myOrder 订单的Id
     * @return 操作的结果
     */
    @RequestMapping(value = "user_updateSign", method = RequestMethod.POST, produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String updateSign(HttpServletRequest request, MyOrder myOrder)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.updateSign(sessionVO, myOrder);
    }

    /**
     * 申请退款
     *
     * @param request 用户参数
     * @param myOrder 退款参数
     * @return 申请结果
     */
    @RequestMapping(value = "user_updateRefund", method = RequestMethod.POST, produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String updateRefund(HttpServletRequest request, MyOrder myOrder)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.updateRefund(sessionVO, myOrder);
    }

    /**
     * 取消退款
     *
     * @param request 用户参数
     * @param myOrder 订单的Id
     * @return 操作的结果
     */
    @RequestMapping(value = "user_updateRefundCancel", method = RequestMethod.POST, produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String updateRefundCancel(HttpServletRequest request, MyOrder myOrder)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.updateRefundCancel(sessionVO, myOrder);
    }

    /**
     * 退还商品
     *
     * @param request 用户参数
     * @param myOrder 订单的Id
     * @return 操作的结果
     */
    @RequestMapping(value = "user_updateRefundGoods", method = RequestMethod.POST, produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String updateRefundGoods(HttpServletRequest request, MyOrder myOrder)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.updateRefundGoods(sessionVO, myOrder);
    }

    /**
     * 获取运费模板列表
     *
     * @param request 用户参数
     * @return 运费模板列表
     */
    @RequestMapping(value = "user_listFreightTemp", method = RequestMethod.POST, produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String listFreightTemp(HttpServletRequest request)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.listFreightTemp(sessionVO);
    }
}
