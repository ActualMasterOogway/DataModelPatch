local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.dependencies);
local l_NetworkingFriends_0 = v1.NetworkingFriends;
local l_NetworkStatus_0 = v1.RoduxNetworking.Enum.NetworkStatus;
return function(v4, v5, v6) --[[ Line: 7 ]]
    -- upvalues: l_NetworkingFriends_0 (copy), l_NetworkStatus_0 (copy)
    local v7 = l_NetworkingFriends_0.GetFriendsFromUserId.getStatus(v4, v5);
    if v6 then
        local v8 = l_NetworkingFriends_0.GetFriendRecommendationsFromUserId.getStatus(v4, v5);
        if v7 == l_NetworkStatus_0.Done then
            v7 = if v8 == l_NetworkStatus_0.Failed then l_NetworkStatus_0.Failed else if v8 == l_NetworkStatus_0.Done then l_NetworkStatus_0.Done else l_NetworkStatus_0.Fetching;
        end;
    end;
    if v7 == l_NetworkStatus_0.Failed then
        v7 = l_NetworkStatus_0.Done;
    end;
    return v7;
end;