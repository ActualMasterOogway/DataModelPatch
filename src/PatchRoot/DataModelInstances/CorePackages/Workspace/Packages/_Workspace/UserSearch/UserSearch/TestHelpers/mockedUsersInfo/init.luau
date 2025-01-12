local l_script_FirstAncestor_0 = script:FindFirstAncestor("UserSearch");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.TestHelpers.ProfileInsightsMocks);
local l_PresenceType_0 = require(l_script_FirstAncestor_0.Rodux.RoduxPresence).Enums.PresenceType;
local l_ContextualInfoTypes_0 = require(l_Parent_0.SocialCommon).Enums.ContextualInfoTypes;
local function _(v5, v6) --[[ Line: 9 ]]
    -- upvalues: l_PresenceType_0 (copy)
    return {
        userPresenceType = v6, 
        userId = tonumber(v5), 
        lastLocation = "MockLastLocation", 
        lastOnline = "2022-05-08T22:44:25.08Z", 
        gameInstanceId = nil, 
        placeId = nil, 
        rootPlaceId = nil, 
        universeId = v6 == l_PresenceType_0.InGame and 123 or nil
    };
end;
local v8 = {
    yourself = "1111", 
    following = "2222", 
    friend = "3333", 
    incomingFriendship = "4444", 
    compactTileIncomingFriendship = "4444", 
    outgoingFriendship = "5555", 
    compactTileOutgoingFriendship = "5555", 
    previousUserName = "6666", 
    random = "7777", 
    notFriend = "8888", 
    mutualFriends = "9999", 
    compactTileMutualFriends = "9999", 
    frequents = "101010", 
    friendInGame = "111111", 
    friendInStudio = "121212"
};
local v9 = {
    yourself = l_ContextualInfoTypes_0.IsMyself, 
    following = l_ContextualInfoTypes_0.Following, 
    friend = l_ContextualInfoTypes_0.Friend, 
    incomingFriendship = nil, 
    compactTileIncomingFriendship = nil, 
    outgoingFriendship = nil, 
    previousUserName = l_ContextualInfoTypes_0.PreviousUsername, 
    random = nil, 
    notFriend = nil, 
    mutualFriends = l_ContextualInfoTypes_0.MutualFriends, 
    compactTileMutualFriends = l_ContextualInfoTypes_0.MutualFriends, 
    frequents = l_ContextualInfoTypes_0.Frequents, 
    friendInGame = l_ContextualInfoTypes_0.ExperienceLastLocation, 
    friendInStudio = l_ContextualInfoTypes_0.Friend
};
local v10 = {
    [v8.friend] = Enum.FriendStatus.Friend, 
    [v8.incomingFriendship] = Enum.FriendStatus.FriendRequestReceived, 
    [v8.compactTileIncomingFriendship] = Enum.FriendStatus.FriendRequestReceived, 
    [v8.outgoingFriendship] = Enum.FriendStatus.FriendRequestSent, 
    [v8.compactTileOutgoingFriendship] = Enum.FriendStatus.FriendRequestSent, 
    [v8.notFriend] = Enum.FriendStatus.NotFriend, 
    [v8.mutualFriends] = Enum.FriendStatus.NotFriend, 
    [v8.compactTileMutualFriends] = Enum.FriendStatus.NotFriend, 
    [v8.frequents] = Enum.FriendStatus.NotFriend, 
    [v8.friendInGame] = Enum.FriendStatus.Friend, 
    [v8.friendInStudio] = Enum.FriendStatus.Friend
};
local v11 = {
    LocalUserId = v8.yourself
};
local v12 = {
    NetworkStatus = {}, 
    Friends = {
        friendshipStatus = v10, 
        followings = {
            followingStatuses = {
                [v8.following] = {
                    isFollowing = true, 
                    isFollowed = false
                }
            }
        }
    }
};
local v13 = {};
local v14 = {};
local l_yourself_0 = v8.yourself;
local l_yourself_1 = v8.yourself;
local l_Offline_0 = l_PresenceType_0.Offline;
v14[l_yourself_0] = {
    userPresenceType = l_Offline_0, 
    userId = tonumber(l_yourself_1), 
    lastLocation = "MockLastLocation", 
    lastOnline = "2022-05-08T22:44:25.08Z", 
    gameInstanceId = nil, 
    placeId = nil, 
    rootPlaceId = nil, 
    universeId = l_Offline_0 == l_PresenceType_0.InGame and 123 or nil
};
l_yourself_0 = v8.following;
l_yourself_1 = v8.following;
l_Offline_0 = l_PresenceType_0.Offline;
v14[l_yourself_0] = {
    userPresenceType = l_Offline_0, 
    userId = tonumber(l_yourself_1), 
    lastLocation = "MockLastLocation", 
    lastOnline = "2022-05-08T22:44:25.08Z", 
    gameInstanceId = nil, 
    placeId = nil, 
    rootPlaceId = nil, 
    universeId = l_Offline_0 == l_PresenceType_0.InGame and 123 or nil
};
l_yourself_0 = v8.friend;
l_yourself_1 = v8.friend;
l_Offline_0 = l_PresenceType_0.Online;
v14[l_yourself_0] = {
    userPresenceType = l_Offline_0, 
    userId = tonumber(l_yourself_1), 
    lastLocation = "MockLastLocation", 
    lastOnline = "2022-05-08T22:44:25.08Z", 
    gameInstanceId = nil, 
    placeId = nil, 
    rootPlaceId = nil, 
    universeId = l_Offline_0 == l_PresenceType_0.InGame and 123 or nil
};
l_yourself_0 = v8.incomingFriendship;
l_yourself_1 = v8.incomingFriendship;
l_Offline_0 = l_PresenceType_0.Offline;
v14[l_yourself_0] = {
    userPresenceType = l_Offline_0, 
    userId = tonumber(l_yourself_1), 
    lastLocation = "MockLastLocation", 
    lastOnline = "2022-05-08T22:44:25.08Z", 
    gameInstanceId = nil, 
    placeId = nil, 
    rootPlaceId = nil, 
    universeId = l_Offline_0 == l_PresenceType_0.InGame and 123 or nil
};
l_yourself_0 = v8.compactTileIncomingFriendship;
l_yourself_1 = v8.compactTileIncomingFriendship;
l_Offline_0 = l_PresenceType_0.Offline;
v14[l_yourself_0] = {
    userPresenceType = l_Offline_0, 
    userId = tonumber(l_yourself_1), 
    lastLocation = "MockLastLocation", 
    lastOnline = "2022-05-08T22:44:25.08Z", 
    gameInstanceId = nil, 
    placeId = nil, 
    rootPlaceId = nil, 
    universeId = l_Offline_0 == l_PresenceType_0.InGame and 123 or nil
};
l_yourself_0 = v8.outgoingFriendship;
l_yourself_1 = v8.outgoingFriendship;
l_Offline_0 = l_PresenceType_0.Offline;
v14[l_yourself_0] = {
    userPresenceType = l_Offline_0, 
    userId = tonumber(l_yourself_1), 
    lastLocation = "MockLastLocation", 
    lastOnline = "2022-05-08T22:44:25.08Z", 
    gameInstanceId = nil, 
    placeId = nil, 
    rootPlaceId = nil, 
    universeId = l_Offline_0 == l_PresenceType_0.InGame and 123 or nil
};
l_yourself_0 = v8.previousUserName;
l_yourself_1 = v8.previousUserName;
l_Offline_0 = l_PresenceType_0.Offline;
v14[l_yourself_0] = {
    userPresenceType = l_Offline_0, 
    userId = tonumber(l_yourself_1), 
    lastLocation = "MockLastLocation", 
    lastOnline = "2022-05-08T22:44:25.08Z", 
    gameInstanceId = nil, 
    placeId = nil, 
    rootPlaceId = nil, 
    universeId = l_Offline_0 == l_PresenceType_0.InGame and 123 or nil
};
l_yourself_0 = v8.random;
l_yourself_1 = v8.random;
l_Offline_0 = l_PresenceType_0.Offline;
v14[l_yourself_0] = {
    userPresenceType = l_Offline_0, 
    userId = tonumber(l_yourself_1), 
    lastLocation = "MockLastLocation", 
    lastOnline = "2022-05-08T22:44:25.08Z", 
    gameInstanceId = nil, 
    placeId = nil, 
    rootPlaceId = nil, 
    universeId = l_Offline_0 == l_PresenceType_0.InGame and 123 or nil
};
l_yourself_0 = v8.notFriend;
l_yourself_1 = v8.notFriend;
l_Offline_0 = l_PresenceType_0.Offline;
v14[l_yourself_0] = {
    userPresenceType = l_Offline_0, 
    userId = tonumber(l_yourself_1), 
    lastLocation = "MockLastLocation", 
    lastOnline = "2022-05-08T22:44:25.08Z", 
    gameInstanceId = nil, 
    placeId = nil, 
    rootPlaceId = nil, 
    universeId = l_Offline_0 == l_PresenceType_0.InGame and 123 or nil
};
l_yourself_0 = v8.mutualFriends;
l_yourself_1 = v8.mutualFriends;
l_Offline_0 = l_PresenceType_0.Offline;
v14[l_yourself_0] = {
    userPresenceType = l_Offline_0, 
    userId = tonumber(l_yourself_1), 
    lastLocation = "MockLastLocation", 
    lastOnline = "2022-05-08T22:44:25.08Z", 
    gameInstanceId = nil, 
    placeId = nil, 
    rootPlaceId = nil, 
    universeId = l_Offline_0 == l_PresenceType_0.InGame and 123 or nil
};
l_yourself_0 = v8.compactTileMutualFriends;
l_yourself_1 = v8.compactTileMutualFriends;
l_Offline_0 = l_PresenceType_0.Offline;
v14[l_yourself_0] = {
    userPresenceType = l_Offline_0, 
    userId = tonumber(l_yourself_1), 
    lastLocation = "MockLastLocation", 
    lastOnline = "2022-05-08T22:44:25.08Z", 
    gameInstanceId = nil, 
    placeId = nil, 
    rootPlaceId = nil, 
    universeId = l_Offline_0 == l_PresenceType_0.InGame and 123 or nil
};
l_yourself_0 = v8.frequents;
l_yourself_1 = v8.frequents;
l_Offline_0 = l_PresenceType_0.Offline;
v14[l_yourself_0] = {
    userPresenceType = l_Offline_0, 
    userId = tonumber(l_yourself_1), 
    lastLocation = "MockLastLocation", 
    lastOnline = "2022-05-08T22:44:25.08Z", 
    gameInstanceId = nil, 
    placeId = nil, 
    rootPlaceId = nil, 
    universeId = l_Offline_0 == l_PresenceType_0.InGame and 123 or nil
};
l_yourself_0 = v8.friendInGame;
l_yourself_1 = v8.friendInGame;
l_Offline_0 = l_PresenceType_0.InGame;
v14[l_yourself_0] = {
    userPresenceType = l_Offline_0, 
    userId = tonumber(l_yourself_1), 
    lastLocation = "MockLastLocation", 
    lastOnline = "2022-05-08T22:44:25.08Z", 
    gameInstanceId = nil, 
    placeId = nil, 
    rootPlaceId = nil, 
    universeId = l_Offline_0 == l_PresenceType_0.InGame and 123 or nil
};
l_yourself_0 = v8.friendInStudio;
l_yourself_1 = v8.friendInStudio;
l_Offline_0 = l_PresenceType_0.InStudio;
v14[l_yourself_0] = {
    userPresenceType = l_Offline_0, 
    userId = tonumber(l_yourself_1), 
    lastLocation = "MockLastLocation", 
    lastOnline = "2022-05-08T22:44:25.08Z", 
    gameInstanceId = nil, 
    placeId = nil, 
    rootPlaceId = nil, 
    universeId = l_Offline_0 == l_PresenceType_0.InGame and 123 or nil
};
v13.byUserId = v14;
v12.Presence = v13;
v11.UserSearch = v12;
v12 = {
    yourself = {
        id = v8.yourself
    }, 
    following = {
        id = v8.following
    }, 
    friend = {
        id = v8.friend
    }, 
    incomingFriendship = {
        id = v8.incomingFriendship
    }, 
    compactTileIncomingFriendship = {
        id = v8.compactTileIncomingFriendship
    }, 
    outgoingFriendship = {
        id = v8.outgoingFriendship
    }, 
    compactTileOutgoingFriendship = {
        id = v8.compactTileOutgoingFriendship
    }, 
    previousUserName = {
        id = v8.previousUserName, 
        previousUsernames = {
            "random1", 
            "random1", 
            "searchKeyword"
        }
    }, 
    random = {
        id = v8.random
    }, 
    notFriend = {
        id = v8.notFriend
    }, 
    mutualFriends = {
        id = v8.mutualFriends, 
        profileInsight = v2.mockProfileInsightWithMutualFriends(v8.mutualFriends)
    }, 
    frequents = {
        id = v8.frequents, 
        profileInsight = v2.mockProfileInsight(v8.frequents)
    }, 
    friendInGame = {
        id = v8.friendInGame
    }, 
    friendInStudio = {
        id = v8.friendInStudio
    }
};
return {
    ids = v8, 
    state = v11, 
    users = v12, 
    contextualInfoType = v9
};