local v0 = require(script.Parent.Parent.FRIENDS_URL);
local _ = require(script.Parent.Parent.networkingFriendsTypes);
return function(v2) --[[ Line: 5 ]]
    -- upvalues: v0 (copy)
    return v2.roduxNetworking.GET({
        Name = "GetLuobuFriendsFromUserId"
    }, function(v3, v4, v5) --[[ Line: 8 ]]
        -- upvalues: v0 (ref)
        return v3(v0):path("v1"):path("users"):id(v4):path("luobu-friends"):queryArgs({
            userOpenId = v5.userOpenId, 
            userAccessToken = v5.userAccessToken, 
            type = v5.type, 
            appType = v5.appType
        });
    end);
end;