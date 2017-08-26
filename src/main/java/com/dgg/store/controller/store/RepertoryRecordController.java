package com.dgg.store.controller.store;

import com.dgg.store.service.store.RepertoryRecordService;
import com.dgg.store.util.core.constant.Constant;
import com.dgg.store.util.pojo.RepertoryRecord;
import com.dgg.store.util.vo.core.PageVO;
import com.dgg.store.util.vo.core.SessionVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

@Controller
public class RepertoryRecordController
{
    @Autowired
    private RepertoryRecordService service;

    @RequestMapping(value = "/s/updateRepertoryAddFirst", method = RequestMethod.POST, produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String updateRepertoryAddFirst(HttpServletRequest request, RepertoryRecord repertoryRecord)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.updateRepertoryAddFirst(sessionVO,repertoryRecord);
    }

    @RequestMapping(value = "/s/updateRepertorySubFirst", method = RequestMethod.POST, produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String updateRepertorySubFirst(HttpServletRequest request, RepertoryRecord repertoryRecord)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.updateRepertorySubFirst(sessionVO,repertoryRecord);
    }

    @RequestMapping(value = "/s/updateRepertoryAddSecond", method = RequestMethod.POST, produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String updateRepertoryAddSecond(HttpServletRequest request, RepertoryRecord repertoryRecord)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.updateRepertoryAddSecond(sessionVO,repertoryRecord);
    }

    @RequestMapping(value = "/s/updateRepertorySubSecond", method = RequestMethod.POST, produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String updateRepertorySubSecond(HttpServletRequest request, RepertoryRecord repertoryRecord)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.updateRepertorySubSecond(sessionVO,repertoryRecord);
    }

    @RequestMapping(value = "/s/listRepertoryRecord", method = RequestMethod.POST, produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String listRepertoryRecord(HttpServletRequest request, RepertoryRecord repertoryRecord, PageVO pageVO)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.listRepertoryRecord(sessionVO,repertoryRecord,pageVO);
    }
}
