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

@Controller
public class MyOrderController
{
    @Autowired
    private MyOrderService service;

    @RequestMapping(value = "user_saveMyOrder", method = RequestMethod.POST, produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String saveMyOrder(HttpServletRequest request, MyOrder myOrder)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.insertMyOrder(sessionVO, myOrder);
    }

    @RequestMapping(value = "user_listMyOrder", method = RequestMethod.POST, produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String listMyOrder(HttpServletRequest request, PageVO pageVO)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.listMyOrder(sessionVO, pageVO);
    }

    @RequestMapping(value = "user_listMyOrderSelective", method = RequestMethod.POST, produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String listMyOrderSelective(HttpServletRequest request, MyOrder myOrder, PageVO pageVO)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.listMyOrderSelective(sessionVO, myOrder, pageVO);
    }

    @RequestMapping(value = "user_getMyOrder", method = RequestMethod.POST, produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String getMyOrder(HttpServletRequest request, MyOrder myOrder)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.getMyOrder(sessionVO, myOrder);
    }

    @RequestMapping(value = "user_updateFinancePassA", method = RequestMethod.POST, produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String updateOrder(HttpServletRequest request, MyOrder myOrder)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.updateFinancePassA(sessionVO, myOrder);
    }

    @RequestMapping(value = "user_updateFinanceFailA", method = RequestMethod.POST, produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String updateFinanceFailA(HttpServletRequest request, MyOrder myOrder)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.updateFinanceFailA(sessionVO, myOrder);
    }

    @RequestMapping(value = "user_updateSalesmanPass", method = RequestMethod.POST, produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String updateSalesmanPass(HttpServletRequest request, MyOrder myOrder)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.updateSalesmanPass(sessionVO, myOrder);
    }

    @RequestMapping(value = "user_updateDelivered", method = RequestMethod.POST, produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String updateDelivered(HttpServletRequest request, MyOrder myOrder)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.updateDelivered(sessionVO, myOrder);
    }

    @RequestMapping(value = "user_updateSign", method = RequestMethod.POST, produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String updateSign(HttpServletRequest request, MyOrder myOrder)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.updateSign(sessionVO, myOrder);
    }

    @RequestMapping(value = "user_updateFinancePassB", method = RequestMethod.POST, produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String updateFinancePassB(HttpServletRequest request, MyOrder myOrder)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.updateFinancePassB(sessionVO, myOrder);
    }

    @RequestMapping(value = "user_updateFinanceFailB", method = RequestMethod.POST, produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String updateFinanceFailB(HttpServletRequest request, MyOrder myOrder)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.updateFinanceFailB(sessionVO, myOrder);
    }

    @RequestMapping(value = "user_updateRefund", method = RequestMethod.POST, produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String updateRefund(HttpServletRequest request, MyOrder myOrder)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.updateRefund(sessionVO, myOrder);
    }

    @RequestMapping(value = "user_updateRefundCancel", method = RequestMethod.POST, produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String updateRefundCancel(HttpServletRequest request, MyOrder myOrder)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.updateRefundCancel(sessionVO, myOrder);
    }

    @RequestMapping(value = "user_updateRefundPass", method = RequestMethod.POST, produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String updateRefundPass(HttpServletRequest request, MyOrder myOrder)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.updateRefundPass(sessionVO, myOrder);
    }

    @RequestMapping(value = "user_updateRefundGoods", method = RequestMethod.POST, produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String updateRefundGoods(HttpServletRequest request, MyOrder myOrder)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.updateRefundGoods(sessionVO, myOrder);
    }

    @RequestMapping(value = "user_updateRefundReceive", method = RequestMethod.POST, produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String updateRefundReceive(HttpServletRequest request, MyOrder myOrder)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.updateRefundReceive(sessionVO, myOrder);
    }

    @RequestMapping(value = "user_updateRefundMoney", method = RequestMethod.POST, produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String updateRefundMoney(HttpServletRequest request, MyOrder myOrder)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.updateRefundMoney(sessionVO, myOrder);
    }
}