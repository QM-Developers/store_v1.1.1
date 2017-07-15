package com.dgg.store.dao.common;


import com.dgg.store.mapper.ExperienceMapper;
import com.dgg.store.util.vo.experience.ExperienceVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ExperienceDaoImpl implements ExperienceDao
{
    @Autowired
    private ExperienceMapper mapper;

    @Override
    public int insertExperience(ExperienceVO experienceVO)
    {
        return mapper.insertExperience(experienceVO);
    }
}
