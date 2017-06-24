package com.dgg.store.service.common;


import com.dgg.store.util.pojo.FriendRequest;
import com.dgg.store.util.vo.friend.FriendVO;
import com.dgg.store.util.vo.core.ResultVO;
import com.dgg.store.util.vo.core.SessionVO;

public interface FriendsService
{
    ResultVO findUserByPhoneOrName(SessionVO sessionVO, FriendVO friendsVO);

    ResultVO insertFriendRequest(SessionVO sessionVO, FriendRequest friendRequest);

    ResultVO findFriendRequest(SessionVO sessionVO);

    ResultVO findFriendRequestCount(SessionVO sessionVO);

    ResultVO updateRequestIsRead(SessionVO sessionVO);

    ResultVO insertAgreeRequest(SessionVO sessionVO,FriendRequest request);

    ResultVO insertNegativeRequest(SessionVO sessionVO, FriendRequest friendRequest);

    ResultVO findFriendList(SessionVO sessionVO);

    ResultVO findFriendData(SessionVO sessionVO, FriendVO friendVO);

    ResultVO findFriendDataById(SessionVO sessionVO, FriendVO friendVO);

    ResultVO updateFriendRemark(SessionVO sessionVO,FriendVO friendVO);
}
