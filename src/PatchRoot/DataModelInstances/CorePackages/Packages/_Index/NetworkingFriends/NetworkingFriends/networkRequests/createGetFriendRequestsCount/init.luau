local v0 = require(script.Parent.Parent.FRIENDS_URL);
local _ = require(script.Parent.Parent.networkingFriendsTypes);
return function(v2) --[[ Line: 5 ]]
    -- upvalues: v0 (copy)
    return v2.roduxNetworking.GET({
        Name = "GetFriendRequestsCount"
    }, function(v3, _) --[[ Line: 8 ]]
        -- upvalues: v0 (ref)
        return v3(v0):path("v1"):path("user"):path("friend-requests"):path("count");
    end);
end;