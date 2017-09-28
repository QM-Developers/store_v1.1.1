package com.dgg.store.controller.store;

import com.dgg.store.service.store.FinanceOrderService;
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
 * 财务订单控制器
 */
@Controller
public class FinanceOrderController
{
    private final FinanceOrderService service;

    @Autowired
    public FinanceOrderController(FinanceOrderService service)
    {
        this.service = service;
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
}
