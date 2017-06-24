package com.dgg.store.dao.common;

import com.dgg.store.mapper.FriendsMapper;
import com.dgg.store.util.pojo.FriendRequest;
import com.dgg.store.util.vo.friend.FriendVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class FriendsDaoImpl implements FriendsDao
{
    @Autowired
    private FriendsMapper mapper;

    @Override
    public List<FriendVO> findUserByPhoneOrName(String userId)
    {
        return mapper.findUserByPhoneOrName(userId);
    }

    @Override
    public Integer insertFriendRequest(FriendRequest request)
    {
        return mapper.insertFriendRequest(request);
    }

    @Override
    public List<FriendRequest> findFriendRequest(String userId)
    {
        return mapper.findFriendRequest(userId);
    }

    @Override
    public Integer updateFriendRequest(FriendRequest request)
    {
        return mapper.updateFriendRequest(request);
    }

    @Override
    public Integer findCountBy(FriendRequest request)
    {
        return mapper.findCountBy(request);
    }

    @Override
    public Integer insertFriend(FriendVO friendVO)
    {
        return mapper.insertFriend(friendVO);
    }

    @Override
    public List<FriendVO> findFriendList(String userId)
    {
        return mapper.findFriendList(userId);
    }

    @Override
    public FriendVO findFriendData(String friendId)
    {
        return mapper.findFriendData(friendId);
    }

    @Override
    public FriendVO findFriendDataById(String userId, String friendUserId)
    {
        return mapper.findFriendDataById(userId,friendUserId);
    }

    @Override
    public int updateFriendRemark(FriendVO friendVO)
    {
        return mapper.updateFriendRemark(friendVO);
    }

    @Override
    public Integer findFriendExists(FriendRequest request)
    {
        return mapper.findFriendExists(request);
    }
}
