package com.dgg.store.controller.store;

import com.dgg.store.service.store.SalesOrderService;
import com.dgg.store.util.core.constant.Constant;
import com.dgg.store.util.pojo.MyOrder;
import com.dgg.store.util.vo.core.PageVO;
import com.dgg.store.util.vo.core.SessionVO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

/**
 * 业务订单控制器
 */
@Controller
public class SalesOrderController
{
    private final SalesOrderService service;

    public SalesOrderController(SalesOrderService service)
    {
        this.service = service;
    }

    /**
     * 业务筛选订单
     *
     * @param request 用户参数
     * @param myOrder 筛选条件
     * @param pageVO  分页参数
     * @return 订单列表
     */
    @RequestMapping(value = "/s/sales/listOrderSelective", method = RequestMethod.POST, produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String listOrderSelective(HttpServletRequest request, MyOrder myOrder, PageVO pageVO)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.listOrderSelective(sessionVO, myOrder, pageVO);
    }

    /**
     * 获取业务员列表
     *
     * @param request 用户参数
     * @return 业务员列表
     */
    @RequestMapping(value = "/s/sales/listSales", method = RequestMethod.POST, produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String listSales(HttpServletRequest request)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.listSales(sessionVO);
    }

    /**
     * 业务管理员筛选订单
     *
     * @param request 用户参数
     * @param myOrder 筛选条件
     * @param pageVO  分页参数
     * @return 订单列表
     */
    @RequestMapping(value = "/s/sales/listOrderSelectiveByManager", method = RequestMethod.POST, produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String listOrderSelectiveByManager(HttpServletRequest request, MyOrder myOrder, PageVO pageVO)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.listOrderSelectiveByManager(sessionVO, myOrder, pageVO);
    }
}
