package com.dgg.store.mapper;

import com.dgg.store.util.pojo.FriendRequest;
import com.dgg.store.util.vo.friend.FriendVO;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface FriendsMapper
{
    List<FriendVO> findUserByPhoneOrName(@Param("userId") String userId);

    Integer insertFriendRequest(FriendRequest request);

    List<FriendRequest> findFriendRequest(FriendRequest condition);

    Integer updateFriendRequest(FriendRequest request);

    Integer findCountBy(FriendRequest request);

    Integer insertFriend(FriendVO friendVO);

    List<FriendVO> findFriendList(@Param("userId") String userId);

    FriendVO findFriendData(@Param("friendId") String friendId);

    FriendVO findFriendDataById(@Param("userId") String userId, @Param("friendUserId") String friendUserId);

    int updateFriendRemark(FriendVO friendVO);

    Integer findFriendExists(FriendRequest request);

    List<FriendVO> findUserByPhone(@Param("userPhone") String friendPhone);
}