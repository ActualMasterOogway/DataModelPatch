local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsLanding");
local l_AddFriends_0 = l_script_FirstAncestor_0.AddFriends;
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_AddFriends_0.dependencies);
local l_t_0 = v3.t;
local l_Images_0 = v3.UIBlox.App.ImageSet.Images;
local l_FriendshipOriginSourceType_0 = v3.NetworkingFriendsEnums.FriendshipOriginSourceType;
local v7 = require(script.Parent.getFriendRequestHandlersExtraProps);
local l_FFlagAddFriendsMigrateAnalytics_0 = require(l_Parent_0.SharedFlags).FFlagAddFriendsMigrateAnalytics;
local v9 = l_t_0.strictInterface({
    playerId = l_t_0.string, 
    isFriendRequest = l_t_0.boolean, 
    hasIncomingFriendRequest = l_t_0.optional(l_t_0.boolean), 
    friendStatus = l_t_0.optional(l_t_0.enum(Enum.FriendStatus)), 
    networking = l_t_0.optional(l_t_0.callback), 
    handleRequestFriendship = l_t_0.optional(l_t_0.callback), 
    handleAcceptFriendRequest = l_t_0.optional(l_t_0.callback), 
    handleDeclineFriendRequest = l_t_0.optional(l_t_0.callback), 
    position = l_t_0.optional(l_t_0.integer), 
    rank = l_t_0.optional(l_t_0.integer), 
    contextType = if l_FFlagAddFriendsMigrateAnalytics_0 then nil else l_t_0.optional(l_t_0.string), 
    isContact = if l_FFlagAddFriendsMigrateAnalytics_0 then l_t_0.optional(l_t_0.boolean) else nil, 
    contextualInfoType = if l_FFlagAddFriendsMigrateAnalytics_0 then l_t_0.optional(l_t_0.string) else nil
});
return function(v10) --[[ Line: 37 ]]
    -- upvalues: v9 (copy), v7 (copy), l_Images_0 (copy), l_FriendshipOriginSourceType_0 (copy)
    assert(v9(v10));
    local v11 = {};
    local v12 = v7(v10);
    if v10.isFriendRequest then
        if (v10.friendStatus or Enum.FriendStatus.FriendRequestReceived) == Enum.FriendStatus.FriendRequestReceived then
            table.insert(v11, {
                icon = l_Images_0["icons/actions/reject"], 
                isSecondary = true, 
                onActivated = function() --[[ Line: 54 ]] --[[ Name: onActivated ]]
                    -- upvalues: v10 (copy), v12 (copy)
                    v10.handleDeclineFriendRequest(v10.networking, v10.playerId, v12);
                end
            });
            table.insert(v11, {
                icon = l_Images_0["icons/actions/friends/friendAdd"], 
                isSecondary = false, 
                onActivated = function() --[[ Line: 61 ]] --[[ Name: onActivated ]]
                    -- upvalues: v10 (copy), v12 (copy)
                    v10.handleAcceptFriendRequest(v10.networking, v10.playerId, v12);
                end
            });
            return v11;
        end;
    else
        local v13 = v10.friendStatus or Enum.FriendStatus.NotFriend;
        if v10.hasIncomingFriendRequest then
            table.insert(v11, {
                icon = l_Images_0["icons/actions/friends/friendAdd"], 
                isSecondary = false, 
                onActivated = function() --[[ Line: 76 ]] --[[ Name: onActivated ]]
                    -- upvalues: v10 (copy), v12 (copy)
                    v10.handleAcceptFriendRequest(v10.networking, v10.playerId, v12);
                end
            });
            return v11;
        elseif v13 == Enum.FriendStatus.NotFriend then
            local v14 = nil;
            if v12.isRecommendation then
                v14 = l_FriendshipOriginSourceType_0.FriendRecommendations.rawValue();
            end;
            table.insert(v11, {
                icon = l_Images_0["icons/actions/friends/friendAdd"], 
                isSecondary = false, 
                onActivated = function() --[[ Line: 88 ]] --[[ Name: onActivated ]]
                    -- upvalues: v10 (copy), v14 (ref), v12 (copy)
                    v10.handleRequestFriendship(v10.networking, v10.playerId, v14, v12);
                end
            });
            return v11;
        elseif v13 == Enum.FriendStatus.FriendRequestSent then
            table.insert(v11, {
                icon = l_Images_0["icons/actions/friends/friendpending"], 
                isSecondary = false, 
                isDisabled = true, 
                onActivated = function() --[[ Line: 102 ]] --[[ Name: onActivated ]]

                end
            });
        end;
    end;
    return v11;
end;