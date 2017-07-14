package com.dgg.store.controller.common;

import com.dgg.store.service.common.ExperienceService;
import com.dgg.store.util.vo.core.ResultVO;
import com.dgg.store.util.vo.experience.ExperienceVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

@Controller
public class ExperienceController
{
    @Autowired
    private ExperienceService service;

    @RequestMapping(value = "experienceRequest",method = RequestMethod.POST)
    @ResponseBody
    public ResultVO experienceRequest(HttpServletRequest request, ExperienceVO experienceVO)
    {
        return service.insertExperience(experienceVO);
    }

}
