package com.dgg.store.dao.common;

import com.dgg.store.util.pojo.FriendRequest;
import com.dgg.store.util.vo.friend.FriendVO;

import java.util.List;

public interface FriendsDao
{
    List<FriendVO> findUserByPhoneOrName(String userId);

    Integer insertFriendRequest(FriendRequest request);

    List<FriendRequest> findFriendRequest(FriendRequest condition);

    Integer updateFriendRequest(FriendRequest request);

    Integer findCountBy(FriendRequest request);

    Integer insertFriend(FriendVO friendVO);

    List<FriendVO> findFriendList(String userId);

    FriendVO findFriendData(String friendId);

    FriendVO findFriendDataById(String userId, String friendUserId);

    int updateFriendRemark(FriendVO friendVO);

    Integer findFriendExists(FriendRequest request);

    List<FriendVO> findUserByPhone(String friendPhone);

    int countNoReceivedRequest(FriendRequest condition);

    Integer deleteFriend(FriendVO condition);
}
