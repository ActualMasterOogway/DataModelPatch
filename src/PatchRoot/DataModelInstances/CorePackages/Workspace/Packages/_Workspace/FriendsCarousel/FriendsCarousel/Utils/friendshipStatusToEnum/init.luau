return function(v0) --[[ Line: 3 ]] --[[ Name: friendshipStatusToString ]]
    if v0.isFriendWithUser then
        return Enum.FriendStatus.Friend;
    elseif v0.hasIncomingFriendRequest then
        return Enum.FriendStatus.FriendRequestReceived;
    elseif v0.hasPendingFriendRequest then
        return Enum.FriendStatus.FriendRequestSent;
    else
        return Enum.FriendStatus.NotFriend;
    end;
end;