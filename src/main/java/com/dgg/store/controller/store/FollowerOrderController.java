package com.dgg.store.controller.store;

import com.dgg.store.service.store.FollowerOrderService;
import com.dgg.store.util.core.constant.Constant;
import com.dgg.store.util.pojo.MyOrder;
import com.dgg.store.util.vo.core.PageVO;
import com.dgg.store.util.vo.core.SessionVO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

@Controller
public class FollowerOrderController
{
    private final FollowerOrderService service;

    public FollowerOrderController(FollowerOrderService service)
    {
        this.service = service;
    }

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

        return service.listFollowerOrderSelective(sessionVO, myOrder, pageVO);
    }

    /**
     * 跟单搜索订单
     *
     * @param request 用户参数
     * @param keyword 关键字
     * @param pageVO  分页参数
     * @return 订单列表
     */
    @RequestMapping(value = "/s/listSalesOrderByKeyword", method = RequestMethod.POST, produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String listSalesOrderByKeyword(HttpServletRequest request, String keyword, PageVO pageVO)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.listSalesOrderByKeyword(sessionVO, keyword, pageVO);
    }

    /**
     * 获取订单详情
     *
     * @param request 用户参数
     * @param myOrder 订单Id+客户Id
     * @return 订单详情
     */
    @RequestMapping(value = "/s/getSalesOrder", method = RequestMethod.POST, produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String getSalesOrder(HttpServletRequest request, MyOrder myOrder)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.getSalesOrder(sessionVO, myOrder);
    }
}
