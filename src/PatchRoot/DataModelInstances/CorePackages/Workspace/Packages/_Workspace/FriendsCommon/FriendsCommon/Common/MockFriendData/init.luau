local v0 = {
    __typename = "Friend", 
    id = "2", 
    hasVerifiedBadge = false, 
    targetUserId = "1"
};
local v1 = {
    __typename = "Friend", 
    id = "3", 
    targetUserId = "1", 
    presence = {
        __typename = "UserPresence", 
        id = "3", 
        userPresenceType = "InGame", 
        lastLocation = "location", 
        lastOnline = "time", 
        gameId = "game-id", 
        placeId = "123", 
        rootPlaceId = "456", 
        universeId = "789"
    }
};
local v2 = {
    __typename = "Friend", 
    id = "4", 
    targetUserId = "1", 
    presence = {
        __typename = "UserPresence", 
        id = "4", 
        userPresenceType = "InStudio", 
        lastLocation = "Studio", 
        lastOnline = "time2", 
        gameId = "", 
        placeId = "", 
        rootPlaceId = "", 
        universeId = ""
    }
};
local v3 = {
    __typename = "Friend", 
    id = "5", 
    targetUserId = "1", 
    presence = {
        __typename = "UserPresence", 
        id = "5", 
        userPresenceType = "Online", 
        lastLocation = "Website", 
        lastOnline = "time3", 
        gameId = "", 
        placeId = "", 
        rootPlaceId = "", 
        universeId = ""
    }
};
local v4 = {
    __typename = "Friend", 
    id = "6", 
    targetUserId = "1", 
    presence = {
        __typename = "UserPresence", 
        id = "6", 
        userPresenceType = "InGame", 
        lastLocation = "", 
        lastOnline = "time4", 
        gameId = "", 
        placeId = "", 
        rootPlaceId = "", 
        universeId = ""
    }
};
return {
    localUserId = "1", 
    offlineFriend = v0, 
    onlineFriend = v3, 
    inGameFriend = v1, 
    inStudioFriend = v2, 
    inGameFriendNoUniverseId = v4
};