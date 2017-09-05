package com.dgg.store.controller.sys;

import com.dgg.store.service.sys.PushMessageService;
import com.dgg.store.util.core.constant.Constant;
import com.dgg.store.util.pojo.PushMessage;
import com.dgg.store.util.vo.core.SessionVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

import static org.springframework.web.bind.annotation.RequestMethod.POST;

@Controller
public class PushMessageController
{
    @Autowired
    private PushMessageService service;

//    @RequestMapping(value = "/s/savePushMessage", method = POST, produces = {"application/json;charset=UTF-8"})
//    @ResponseBody
//    public String savePushMessage(HttpServletRequest request, PushMessage message)
//    {
//        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);
//
//        return service.insertPushMessage(sessionVO,message);
//    }

    @RequestMapping(value = "/s/listPushMessage", method = POST, produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String listPushMessage(HttpServletRequest request, PushMessage message)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.listPushMessage(sessionVO,message);
    }

    @RequestMapping(value = "/s/updatePushMessage", method = POST, produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String updatePushMessage(HttpServletRequest request, PushMessage message)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.updatePushMessage(sessionVO,message);
    }

//    @RequestMapping(value = "/s/removePushMessage", method = POST, produces = {"application/json;charset=UTF-8"})
//    @ResponseBody
//    public String removePushMessage(HttpServletRequest request, PushMessage message)
//    {
//        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);
//
//        return service.deletePushMessage(sessionVO,message);
//    }

}
