package com.dgg.store.service.common;

import com.dgg.store.dao.common.ExperienceDao;
import com.dgg.store.util.vo.core.ResultVO;
import com.dgg.store.util.vo.experience.ExperienceVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ExperienceServiceImpl implements ExperienceService
{
    @Autowired
    private ExperienceDao dao;

    @Override
    public ResultVO insertExperience(ExperienceVO experienceVO)
    {
        int result = dao.insertExperience(experienceVO);

        ResultVO resultVO = new ResultVO(result == 1 ? 1 : 2);

        return resultVO;
    }
}
