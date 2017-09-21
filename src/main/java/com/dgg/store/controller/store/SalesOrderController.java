package com.dgg.store.controller.store;

import com.dgg.store.service.store.SalesOrderService;
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
 * 业务和财务订单控制器
 */
@Controller
public class SalesOrderController
{
    @Autowired
    private SalesOrderService service;

    /**
     * 跟单确认收到退货
     *
     * @param request 用户参数
     * @param myOrder 订单Id
     * @return 操作的结果
     */
    @RequestMapping(value = "/s/updateRefundReceive", method = RequestMethod.POST, produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String updateRefundReceive(HttpServletRequest request, MyOrder myOrder)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.updateRefundReceive(sessionVO, myOrder);
    }

    /**
     * 财务退款
     *
     * @param request 用户参数
     * @param myOrder 订单Id
     * @return 操作的结果
     */
    @RequestMapping(value = "/s/updateRefundMoney", method = RequestMethod.POST, produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String updateRefundMoney(HttpServletRequest request, MyOrder myOrder)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.updateRefundMoney(sessionVO, myOrder);
    }

    /**
     * 跟单同意退款
     *
     * @param request 用户参数
     * @param myOrder 订单Id
     * @return 操作的结果
     */
    @RequestMapping(value = "/s/updateRefundPass", method = RequestMethod.POST, produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String updateRefundPass(HttpServletRequest request, MyOrder myOrder)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.updateRefundPass(sessionVO, myOrder);
    }

    /**
     * 财务B轮审核通过
     *
     * @param request 用户参数
     * @param myOrder 订单Id
     * @return 操作的结果
     */
    @RequestMapping(value = "/s/updateFinancePassB", method = RequestMethod.POST, produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String updateFinancePassB(HttpServletRequest request, MyOrder myOrder)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.updateFinancePassB(sessionVO, myOrder);
    }

    /**
     * 财务B轮审核不通过
     *
     * @param request 用户参数
     * @param myOrder 订单Id
     * @return 操作的结果
     */
    @RequestMapping(value = "/s/updateFinanceFailB", method = RequestMethod.POST, produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String updateFinanceFailB(HttpServletRequest request, MyOrder myOrder)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.updateFinanceFailB(sessionVO, myOrder);
    }

    /**
     * 财务A轮审核通过
     *
     * @param request 用户参数
     * @param myOrder 订单Id
     * @return 操作的结果
     */
    @RequestMapping(value = "/s/updateFinancePassA", method = RequestMethod.POST, produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String updateOrder(HttpServletRequest request, MyOrder myOrder)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.updateFinancePassA(sessionVO, myOrder);
    }

    /**
     * 财务A轮审核不通过
     *
     * @param request 用户参数
     * @param myOrder 订单Id
     * @return 操作的结果
     */
    @RequestMapping(value = "/s/updateFinanceFailA", method = RequestMethod.POST, produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String updateFinanceFailA(HttpServletRequest request, MyOrder myOrder)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.updateFinanceFailA(sessionVO, myOrder);
    }

    /**
     * 跟单审核通过
     *
     * @param request 用户参数
     * @param myOrder 订单Id
     * @return 操作的结果
     */
    @RequestMapping(value = "/s/updateSalesmanPass", method = RequestMethod.POST, produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String updateSalesmanPass(HttpServletRequest request, MyOrder myOrder)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.updateSalesmanPass(sessionVO, myOrder);
    }

    /**
     * 确认发货
     *
     * @param request 用户参数
     * @param myOrder 订单Id
     * @return 操作的结果
     */
    @RequestMapping(value = "/s/updateDelivered", method = RequestMethod.POST, produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String updateDelivered(HttpServletRequest request, MyOrder myOrder)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.updateDelivered(sessionVO, myOrder);
    }

    /**
     * 跟单筛选订单
     *
     * @param request 用户参数
     * @param myOrder 筛选条件
     * @param pageVO  分页参数
     * @return 订单列表
     */
    @RequestMapping(value = "/s/listSalesOrderSelective", method = RequestMethod.POST, produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String listSalesOrderSelective(HttpServletRequest request, MyOrder myOrder, PageVO pageVO)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.listSalesOrderSelective(sessionVO, myOrder, pageVO);
    }

    /**
     * 财务筛选订单
     *
     * @param request 用户参数
     * @param myOrder 筛选条件
     * @param pageVO  分页参数
     * @return 订单列表
     */
    @RequestMapping(value = "/s/listFinanceOrderSelective", method = RequestMethod.POST, produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String listFinanceOrderSelective(HttpServletRequest request, MyOrder myOrder, PageVO pageVO)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.listFinanceOrderSelective(sessionVO, myOrder, pageVO);
    }

    /**
     * 根据订单号获取订单列表
     *
     * @param request 用户参数
     * @param myOrder 订单号
     * @return 订单列表
     */
    @RequestMapping(value = "/s/listSalesOrderByOrderNumber", method = RequestMethod.POST, produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String listSalesOrderByOrderNumber(HttpServletRequest request, MyOrder myOrder)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.listSalesOrderByOrderNumber(sessionVO, myOrder);
    }

    /**
     * 根据订单号获取订单列表
     *
     * @param request 用户参数
     * @param myOrder 订单号
     * @return 订单列表
     */
    @RequestMapping(value = "/s/listFinanceOrderByOrderNumber", method = RequestMethod.POST, produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String listFinanceOrderByOrderNumber(HttpServletRequest request, MyOrder myOrder)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.listSalesOrderByOrderNumber(sessionVO, myOrder);
    }
}
