local l_Parent_0 = script:FindFirstAncestor("ExperienceService").Parent;
local l_EnableOptionalPlaceIdForUserIdGameJoins_0 = require(l_Parent_0.SharedFlags).EnableOptionalPlaceIdForUserIdGameJoins;
local _ = require(script.Parent.GameProtocolTypes);
local v3 = {
    new = function() --[[ Line: 15 ]] --[[ Name: new ]]
        return {
            referralPage = "LuaChat"
        };
    end
};
v3.fromPlaceId = function(v4) --[[ Line: 23 ]] --[[ Name: fromPlaceId ]]
    -- upvalues: v3 (copy)
    local v5 = v3.new();
    v5.placeId = v4;
    return v5;
end;
v3.fromUserId = function(v6, v7) --[[ Line: 31 ]] --[[ Name: fromUserId ]]
    -- upvalues: v3 (copy), l_EnableOptionalPlaceIdForUserIdGameJoins_0 (copy)
    local v8 = v3.new();
    v8.userId = v6;
    if l_EnableOptionalPlaceIdForUserIdGameJoins_0() then
        v8.placeId = v7;
    end;
    return v8;
end;
v3.fromPlaceInstance = function(v9, v10) --[[ Line: 42 ]] --[[ Name: fromPlaceInstance ]]
    -- upvalues: v3 (copy)
    local v11 = v3.new();
    v11.placeId = v9;
    v11.gameInstanceId = v10;
    return v11;
end;
v3.fromConversationId = function(v12, v13) --[[ Line: 51 ]] --[[ Name: fromConversationId ]]
    -- upvalues: v3 (copy)
    local v14 = v3.new();
    v14.placeId = v12;
    v14.conversationId = v13;
    return v14;
end;
v3.fromParams = function(v15) --[[ Line: 60 ]] --[[ Name: fromParams ]]
    -- upvalues: v3 (copy)
    local v16 = v3.new();
    for v17, v18 in pairs(v15) do
        v16[v17] = v18;
    end;
    return v16;
end;
return v3;