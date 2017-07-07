package com.dgg.store.service.store;

import com.dgg.store.dao.store.StoreDao;
import com.dgg.store.util.core.constant.Constant;
import com.dgg.store.util.core.generator.IDGenerator;
import com.dgg.store.util.core.shiro.CryptographyUtil;
import com.dgg.store.util.pojo.Role;
import com.dgg.store.util.pojo.User;
import com.dgg.store.util.vo.core.RelationVO;
import com.dgg.store.util.vo.core.SessionVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class StoreServiceImpl implements StoreService
{
    @Autowired
    private StoreDao dao;

    @Override
    public Integer insertStore(User store)
    {
        store.setUserId(IDGenerator.generator());
//        store.setRoleId(Integer.parseInt(Constant.ROLE_TEAM_PERSONAL));
        store.setUserPassword(CryptographyUtil.md5(store.getUserPassword(), Constant.SALT));

        return dao.insertStore(store);
    }

    @Override
    public Integer updateStore(User store)
    {
        return dao.updateStore(store);
    }

    @Override
    public List<User> findStores()
    {
        List<User> result = dao.findStores();

        return result;
    }

    @Override
    public List<Role> findRolesByStore(SessionVO sessionVO)
    {
        return dao.findRolesByStore(sessionVO);
    }

    @Override
    public Integer updateRoleToStore(RelationVO relationVO)
    {
        String[] storeIdArray = relationVO.getMultiId().split(",");
        String roleId = relationVO.getSingleId();
        User user = new User();
        int result = 1;

        for (String storeId : storeIdArray)
        {
            user.setUserId(storeId);
            user.setRoleId(Integer.parseInt(roleId));
            if ((result = dao.updateStore(user)) == 0)
                throw new RuntimeException();
        }

        return result;
    }

    @Override
    public Integer deleteStore(User store)
    {
        return dao.deleteStore(store);
    }
}
