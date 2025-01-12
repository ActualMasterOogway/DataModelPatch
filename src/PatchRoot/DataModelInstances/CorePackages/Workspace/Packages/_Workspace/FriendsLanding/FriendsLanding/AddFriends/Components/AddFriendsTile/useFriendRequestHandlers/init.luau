local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsLanding");
local l_AddFriends_0 = l_script_FirstAncestor_0.AddFriends;
local v2 = require(l_AddFriends_0.dependencies);
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v4 = require(l_Parent_0.React);
local v5 = require(script.Parent.getFriendRequestHandlersExtraProps);
local l_FriendshipOriginSourceType_0 = v2.NetworkingFriendsEnums.FriendshipOriginSourceType;
return function(v7) --[[ Line: 10 ]] --[[ Name: useFriendRequestHandlers ]]
    -- upvalues: v4 (copy), v5 (copy), l_FriendshipOriginSourceType_0 (copy)
    local v8 = v4.useMemo(function() --[[ Line: 11 ]]
        -- upvalues: v5 (ref), v7 (copy)
        return v5(v7);
    end, {
        v7.position, 
        v7.playerId, 
        v7.isFriendRequest, 
        v7.rank
    });
    local v9 = v4.useCallback(function() --[[ Line: 15 ]]
        -- upvalues: v7 (copy), v8 (copy)
        return v7.handleAcceptFriendRequest(v7.networking, v7.playerId, v8);
    end, {
        v7.networking, 
        v8, 
        v7.handleAcceptFriendRequest, 
        v7.playerId
    });
    local v10 = v4.useCallback(function() --[[ Line: 19 ]]
        -- upvalues: v7 (copy), v8 (copy)
        return v7.handleDeclineFriendRequest(v7.networking, v7.playerId, v8);
    end, {
        v7.networking, 
        v8, 
        v7.handleDeclineFriendRequest, 
        v7.playerId
    });
    local v11 = if v8 and v8.isRecommendation then l_FriendshipOriginSourceType_0.FriendRecommendations.rawValue() else nil;
    local v12 = v4.useCallback(function() --[[ Line: 26 ]]
        -- upvalues: v7 (copy), v11 (copy), v8 (copy)
        return v7.handleRequestFriendship(v7.networking, v7.playerId, v11, v8);
    end, {
        v7.networking, 
        v8, 
        v7.handleRequestFriendship, 
        v7.playerId
    });
    return {
        acceptFriendRequest = v9, 
        declineFriendRequest = v10, 
        requestFriendship = v12
    };
end;