package com.dgg.store.service.sys;

import com.alibaba.fastjson.JSONObject;
import com.dgg.store.dao.sys.PushMessageDao;
import com.dgg.store.util.core.constant.Constant;
import com.dgg.store.util.pojo.PushMessage;
import com.dgg.store.util.pojo.PushMessageExample;
import com.dgg.store.util.vo.core.ResultVO;
import com.dgg.store.util.vo.core.SessionVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PushMessageServiceImpl implements PushMessageService
{
    @Autowired
    private PushMessageDao dao;

    @Override
    public String insertPushMessage(SessionVO sessionVO, PushMessage message)
    {
        int result = dao.insert(message);

        return JSONObject.toJSONString(new ResultVO(result < 1 ? Constant.REQUEST_FAILED : Constant.REQUEST_SUCCESS, sessionVO.getToken(), result));
    }

    @Override
    public String deletePushMessage(SessionVO sessionVO, PushMessage message)
    {
        int result = dao.deleteByPrimaryKey(message.getMsgId());

        return JSONObject.toJSONString(new ResultVO(result < 1 ? Constant.REQUEST_FAILED : Constant.REQUEST_SUCCESS, sessionVO.getToken(), result));
    }

    @Override
    public String updatePushMessage(SessionVO sessionVO, PushMessage message)
    {
        int result = dao.updateByPrimaryKeySelective(message);

        return JSONObject.toJSONString(new ResultVO(result < 1 ? Constant.REQUEST_FAILED : Constant.REQUEST_SUCCESS, sessionVO.getToken(), result));
    }

    @Override
    public String listPushMessage(SessionVO sessionVO, PushMessage message)
    {
        PushMessageExample example = new PushMessageExample();
        PushMessageExample.Criteria criteria = example.createCriteria();

        List<PushMessage> result = dao.selectByExample(example);

        return JSONObject.toJSONString(new ResultVO(Constant.REQUEST_SUCCESS,sessionVO.getToken(),result));
    }
}
