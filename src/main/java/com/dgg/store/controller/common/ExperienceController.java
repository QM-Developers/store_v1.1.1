package com.dgg.store.controller.common;

import com.dgg.store.util.vo.core.ResultVO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

@Controller
public class ExperienceController
{
    @RequestMapping(value = "experienceRequest",method = RequestMethod.POST)
    @ResponseBody
    public ResultVO experienceRequest(HttpServletRequest request)
    {
        return null;
    }

}
