package com.dgg.store.service.common;

import com.dgg.store.dao.common.AreaDao;
import com.dgg.store.util.core.zTree.TreeUtil;
import com.dgg.store.util.factory.ChinaFactory;
import com.dgg.store.util.vo.ChinaVO;
import com.dgg.store.util.vo.core.ResultVO;
import com.dgg.store.util.vo.core.SessionVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AreaServiceImpl implements AreaService
{
    @Autowired
    private AreaDao dao;

    @Override
    public ResultVO findAreaByPid(SessionVO sessionVO, String pid)
    {
        List<ChinaVO> result = dao.findAreaByPid(pid);

        ResultVO resultVO = new ResultVO(result.size() < 1 ? 0 : 1, sessionVO.getToken(), result);

        return resultVO;
    }

    @Override
    public ResultVO findAllArea(SessionVO sessionVO)
    {
        List<ChinaVO> result = ChinaFactory.getInstance();
        if(result.size() < 1)
        {
            List<ChinaVO> allArea = dao.findAllArea();

            try
            {
                allArea = new TreeUtil<ChinaVO>().addChild(allArea,"0","getPid","setChild","getId");
            } catch (Exception e)
            {
                e.printStackTrace();
            }

            result.addAll(allArea);
        }
        ResultVO resultVO = new ResultVO(result == null ? 0 : 1, sessionVO.getToken(), result);

        return resultVO;
    }
}
