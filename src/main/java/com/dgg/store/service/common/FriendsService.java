package com.dgg.store.service.common;


import com.dgg.store.util.pojo.FriendRequest;
import com.dgg.store.util.vo.core.ResultVO;
import com.dgg.store.util.vo.core.SessionVO;
import com.dgg.store.util.vo.friend.FriendVO;

public interface FriendsService
{
    ResultVO findUserByPhoneOrName(SessionVO sessionVO, FriendVO friendsVO);

    ResultVO insertFriendRequest(SessionVO sessionVO, FriendRequest friendRequest);

    ResultVO updateFriendRequest(SessionVO sessionVO);

    ResultVO findFriendRequestCount(SessionVO sessionVO);

    ResultVO updateRequestIsRead(SessionVO sessionVO);

    ResultVO insertAgreeRequest(SessionVO sessionVO,FriendRequest request);

    ResultVO insertNegativeRequest(SessionVO sessionVO, FriendRequest friendRequest);

    ResultVO findFriendList(SessionVO sessionVO);

    ResultVO findFriendData(SessionVO sessionVO, FriendVO friendVO);

    ResultVO findFriendDataById(SessionVO sessionVO, FriendVO friendVO);

    ResultVO updateFriendRemark(SessionVO sessionVO,FriendVO friendVO);

    ResultVO updateFriendRequestById(SessionVO sessionVO, FriendRequest friendRequest);

    ResultVO findUserByPhone(SessionVO sessionVO, FriendVO friendsVO);

    ResultVO updateNotReceivedRequest(SessionVO sessionVO);

    ResultVO updateReceivedRequest(SessionVO sessionVO, FriendRequest friendRequest);

    ResultVO countNoReceivedRequest(SessionVO sessionVO, FriendRequest friendRequest);

    ResultVO deleteFriend(SessionVO sessionVO, FriendVO friendVO);
}
