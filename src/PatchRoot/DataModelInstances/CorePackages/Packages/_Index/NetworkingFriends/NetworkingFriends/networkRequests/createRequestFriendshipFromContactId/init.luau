local v0 = require(script.Parent.Parent.FRIENDS_URL);
local _ = require(script.Parent.Parent.networkingFriendsTypes);
return function(v2) --[[ Line: 12 ]]
    -- upvalues: v0 (copy)
    return v2.roduxNetworking.POST({
        Name = "RequestFriendshipFromContactId"
    }, function(v3, v4) --[[ Line: 17 ]]
        -- upvalues: v0 (ref)
        return v3(v0, {
            currentUserId = v4.currentUserId
        }):path("v1"):path("contacts"):id(v4.contactId):path("request-friendship"):body({});
    end);
end;