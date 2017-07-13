package com.dgg.store.service.common;

import com.dgg.store.dao.common.MenuDao;
import com.dgg.store.util.core.zTree.TreeUtil;
import com.dgg.store.util.vo.core.MenuVO;
import com.dgg.store.util.vo.core.ResultVO;
import com.dgg.store.util.vo.core.SessionVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MenuServiceImpl implements MenuService
{
    @Autowired
    private MenuDao dao;

    @Override
    public ResultVO findMenus(SessionVO sessionVO)
    {
        List<MenuVO> result = dao.findMenus();
        try
        {
            result = new TreeUtil<MenuVO>().addChild(result,"0","getParentId","setChildMenus","getId");
        } catch (Exception e)
        {
            e.printStackTrace();
        }

        ResultVO resultVO = new ResultVO(result.size()>0?1:0,sessionVO.getToken(),result);

        return resultVO;
    }
}
