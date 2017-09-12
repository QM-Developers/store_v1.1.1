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

/**
 * 申请体验控制器
 */
@Controller
public class ExperienceController
{
    @Autowired
    private ExperienceService service;

    /**
     * 添加申请体验记录
     *
     * @param experienceVO 体验信息
     * @return 操作结果
     */
    @RequestMapping(value = "registerExperience", method = RequestMethod.POST)
    @ResponseBody
    public ResultVO experienceRequest(ExperienceVO experienceVO)
    {
        return service.insertExperience(experienceVO);
    }

}
