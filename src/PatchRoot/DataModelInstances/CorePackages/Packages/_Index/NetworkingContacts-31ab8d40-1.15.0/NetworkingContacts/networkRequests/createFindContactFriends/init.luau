local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.API_URL);
local _ = require(l_Parent_0.Types.networkRequestsTypes);
game:DefineFastString("ContactImporterFindFriendsUrl", "contacts");
local l_game_FastString_0 = game:GetFastString("ContactImporterFindFriendsUrl");
return function(v4) --[[ Line: 8 ]]
    -- upvalues: v1 (copy), l_game_FastString_0 (copy)
    return v4.roduxNetworking.GET({
        Name = "FindContactFriends"
    }, function(v5) --[[ Line: 11 ]]
        -- upvalues: v1 (ref), l_game_FastString_0 (ref)
        return v5(v1):path("contacts-api"):path("v1"):path(l_game_FastString_0);
    end);
end;