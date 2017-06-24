package com.dgg.store.service.common;

import com.alibaba.fastjson.JSONObject;
import com.dgg.store.dao.common.FriendsDao;
import com.dgg.store.socket.NettyClient;
import com.dgg.store.socket.NettyClientFactory;
import com.dgg.store.util.core.constant.Constant;
import com.dgg.store.util.core.generator.IDGenerator;
import com.dgg.store.util.core.netty.NettyUtil;
import com.dgg.store.util.pojo.ChatHistory;
import com.dgg.store.util.pojo.FriendRequest;
import com.dgg.store.util.vo.friend.FriendVO;
import com.dgg.store.util.vo.core.ResultVO;
import com.dgg.store.util.vo.core.SessionVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class FriendsServiceImpl implements FriendsService
{
    @Autowired
    private FriendsDao dao;

    @Override
    public ResultVO findUserByPhoneOrName(SessionVO sessionVO, FriendVO friendsVO)
    {
        List<FriendVO> result = dao.findUserByPhoneOrName(friendsVO.getUserId());

        ResultVO resultVO = new ResultVO(result.size() < 1 ? 0 : 1, sessionVO.getToken(), result);

        return resultVO;
    }

    @Override
    public ResultVO insertFriendRequest(SessionVO sessionVO, FriendRequest request)
    {
        request.setRequestId(IDGenerator.generator());
        request.setUserId(sessionVO.getUserId());
        request.setRequestState(FriendRequest.REQUEST);
        Integer result = dao.findFriendExists(request);
        ResultVO resultVO = new ResultVO(result, sessionVO.getToken(), result);
        if(result > 0)
        {
            resultVO.setState(2);
            return resultVO;
        }

        result = dao.insertFriendRequest(request);
        resultVO.setState(result);

        sendRequest(sessionVO,request);

        return resultVO;
    }

    @Override
    public ResultVO findFriendRequest(SessionVO sessionVO)
    {
        FriendRequest condition = new FriendRequest();
        condition.setUserId(sessionVO.getUserId());
        List<FriendRequest> result = dao.findFriendRequest(condition);

        ResultVO resultVO = new ResultVO(1, sessionVO.getToken(), result);

        return resultVO;
    }

    @Override
    public ResultVO findFriendRequestById(SessionVO sessionVO, FriendRequest request)
    {
        FriendRequest condition = new FriendRequest();
        condition.setFriendId(request.getFriendId());
        List<FriendRequest> result = dao.findFriendRequest(condition);

        ResultVO resultVO = new ResultVO(1, sessionVO.getToken(), result.size() > 0 ? result.get(0) : result);

        return resultVO;
    }

    @Override
    public ResultVO findFriendRequestCount(SessionVO sessionVO)
    {
        FriendRequest request = new FriendRequest();
        request.setFriendId(sessionVO.getUserId());
        request.setIsRead(FriendRequest.isNotReadState);
        Integer result = dao.findCountBy(request);

        ResultVO resultVO = new ResultVO(result < 1 ? 0 : 1, sessionVO.getToken(), result);

        return resultVO;
    }

    @Override
    public ResultVO updateRequestIsRead(SessionVO sessionVO)
    {
        FriendRequest request = new FriendRequest();
        request.setFriendId(sessionVO.getUserId());
        request.setIsRead(FriendRequest.isReadState);
        Integer result = dao.updateFriendRequest(request);

        ResultVO resultVO = new ResultVO(result, sessionVO.getToken(), result);

        return resultVO;
    }

    public ResultVO insertAgreeRequest(SessionVO sessionVO, FriendRequest request)
    {
        FriendVO friendVO = new FriendVO();
        friendVO.setFriendOrigin(request.getFriendOrigin());
        Integer result = 1;
        int i = 0;
        int count = 4;

        while (result > 0)
        {
            switch (i)
            {
                case 0:
                    FriendRequest condition = new FriendRequest();
                    condition.setRequestState(FriendRequest.AGREE);
                    condition.setRequestId(request.getRequestId());
                    result = dao.updateFriendRequest(condition);
                    break;
                case 1:
                    friendVO.setFriendId(IDGenerator.generator());
                    friendVO.setUserId(sessionVO.getUserId());
                    friendVO.setFriendUserId(request.getFriendId());
                    result = dao.insertFriend(friendVO);
                    break;
                case 2:
                    friendVO.setFriendId(IDGenerator.generator());
                    friendVO.setUserId(request.getFriendId());
                    friendVO.setFriendUserId(sessionVO.getUserId());
                    result = dao.insertFriend(friendVO);
                    break;
                case 3:
                    request.setRequestId(IDGenerator.generator());
                    request.setUserId(sessionVO.getUserId());
                    request.setRequestInfo("");
                    request.setRequestState(FriendRequest.AGREE);
                    result = dao.insertFriendRequest(request);
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

        sendRequest(sessionVO,request);

        ResultVO resultVO = new ResultVO(result, sessionVO.getToken());

        return resultVO;
    }

    private void sendRequest(SessionVO sessionVO, FriendRequest request)
    {
        ChatHistory history = new ChatHistory();
        history.setMyTeamId(sessionVO.getMyTeamId());
        history.setUserId(sessionVO.getUserId());
        history.setSendUserId(sessionVO.getUserId());
        history.setReceiveUserId(request.getFriendId());
        history.setSendData(request.getRequestId());
        history.setDataType(ChatHistory.REQUEST);

        NettyUtil.writeAndFlushString(NettyClient.context, JSONObject.toJSONString(history) + Constant.delimiterStr);
    }

    @Override
    public ResultVO insertNegativeRequest(SessionVO sessionVO, FriendRequest request)
    {
        Integer result = 1;
        int i = 0;
        int count = 2;

        while (result > 0)
        {
            switch (i)
            {
                case 0:
                    FriendRequest condition = new FriendRequest();
                    condition.setRequestState(FriendRequest.NEGATIVE);
                    condition.setRequestId(request.getRequestId());
                    result = dao.updateFriendRequest(condition);
                    break;
                case 1:
                    request.setRequestId(IDGenerator.generator());
                    request.setUserId(sessionVO.getUserId());
                    request.setRequestInfo("");
                    request.setRequestState(FriendRequest.NEGATIVE);
                    result = dao.insertFriendRequest(request);
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

        sendRequest(sessionVO,request);

        ResultVO resultVO = new ResultVO(result, sessionVO.getToken());

        return resultVO;
    }

    @Override
    public ResultVO findFriendList(SessionVO sessionVO)
    {
        List<FriendVO> result = dao.findFriendList(sessionVO.getUserId());

        ResultVO resultVO = new ResultVO(1, sessionVO.getToken(), result);

        return resultVO;
    }

    @Override
    public ResultVO findFriendData(SessionVO sessionVO, FriendVO friendVO)
    {
        FriendVO result = dao.findFriendData(friendVO.getFriendId());

        ResultVO resultVO = new ResultVO(result == null ? 0 : 1, sessionVO.getToken(), result);

        return resultVO;
    }

    @Override
    public ResultVO findFriendDataById(SessionVO sessionVO, FriendVO friendVO)
    {
        FriendVO result = dao.findFriendDataById(friendVO.getUserId(), friendVO.getFriendUserId());

        ResultVO resultVO = new ResultVO(result == null ? 0 : 1, sessionVO.getToken(), result);

        return resultVO;
    }

    @Override
    public ResultVO updateFriendRemark(SessionVO sessionVO, FriendVO friendVO)
    {
        int result = dao.updateFriendRemark(friendVO);

        ResultVO resultVO = new ResultVO(result, sessionVO.getToken(), result);

        return resultVO;
    }
}
