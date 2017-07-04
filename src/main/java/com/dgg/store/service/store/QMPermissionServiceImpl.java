package com.dgg.store.service.store;

import com.dgg.store.dao.store.QMPermissionDao;
import com.dgg.store.util.core.constant.Constant;
import com.dgg.store.util.core.generator.IDGenerator;
import com.dgg.store.util.core.zTree.TreeUtil;
import com.dgg.store.util.vo.core.ResultVO;
import com.dgg.store.util.vo.core.SessionVO;
import com.dgg.store.util.vo.core.TreeVO;
import com.dgg.store.util.vo.permission.QMPermissionVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class QMPermissionServiceImpl implements QMPermissionService
{
    @Autowired
    private QMPermissionDao dao;

    @Override
    public ResultVO insertQMPermission(SessionVO sessionVO, QMPermissionVO permission)
    {
        Integer result = 1;
        int i = 0;
        int count = 2;

        while (result > 0)
        {
            switch (i)
            {
                case 0:
                    permission.setPermissionId(IDGenerator.generator());
                    result = dao.insertQMPermission(permission);
                    break;
                case 1:
                    String relation = permission.getPermissionRe();
                    String[] ids;
                    if (relation != null && !"".equals(relation))
                    {
                        ids = relation.split(",");
                        result = dao.insertQMPermissionRe(permission.getPermissionId(), ids);
                    }else
                        result = 1;
                    break;
                default:
                    result = 0;
                    break;
            }
            i++;
        }

        if (i - 1 < count)
            throw new RuntimeException(Constant.STR_ADD_FAILED);
        else
            result = 1;

        ResultVO resultVO = new ResultVO(result, sessionVO.getToken());

        return resultVO;
    }

    @Override
    public ResultVO findQMPermissionTree(SessionVO sessionVO)
    {
        List<TreeVO> result = TreeUtil.addChild(dao.findQMPermissionTree(), "0");

        ResultVO resultVO = new ResultVO(1, sessionVO.getToken(), result);

        return resultVO;
    }

    @Override
    public ResultVO updateQMPermission(SessionVO sessionVO, QMPermissionVO permission)
    {
        Integer result = 1;
        int i = 0;
        int count = 2;

        while (result > 0)
        {
            switch (i)
            {
                case 0:
                    result = dao.updateQMPermission(permission);
                    break;
                case 1:
                    dao.cleanQMPermissionRe(permission.getPermissionId());
                    String relation = permission.getPermissionRe();
                    String[] ids;
                    if (relation != null && !"".equals(relation))
                    {
                        ids = relation.split(",");
                        result = dao.insertQMPermissionRe(permission.getPermissionId(), ids);
                    }else
                        result = 1;
                    break;
                default:
                    result = 0;
                    break;
            }
            i++;
        }

        if (i - 1 < count)
            throw new RuntimeException(Constant.STR_ADD_FAILED);
        else
            result = 1;

        ResultVO resultVO = new ResultVO(result, sessionVO.getToken());

        return resultVO;
    }
}
