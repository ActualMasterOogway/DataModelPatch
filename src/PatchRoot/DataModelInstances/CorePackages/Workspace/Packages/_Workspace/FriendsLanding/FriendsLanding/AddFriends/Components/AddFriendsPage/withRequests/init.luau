local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsLanding");
local l_AddFriends_0 = l_script_FirstAncestor_0.AddFriends;
local v2 = require(l_AddFriends_0.dependencies);
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_Rodux_0 = v2.Rodux;
local l_llama_0 = v2.llama;
local l_PresenceType_0 = v2.RoduxPresence.Enums.PresenceType;
local v7 = require(l_script_FirstAncestor_0.TestHelpers.getBaseTestStates);
local v8 = if require(l_Parent_0.SharedFlags).FFlagAddFriendsSeparateReducers then require(l_AddFriends_0.Redux.RODUX_KEY) else require(l_script_FirstAncestor_0.Common.Constants).RODUX_KEY;
local l_smallNumbersOfFriends_0 = v7({
    roduxKey = v8
}).smallNumbersOfFriends;
local l_manyFriends_0 = v7({
    roduxKey = v8
}).manyFriends;
local v11 = {
    [Enum.FriendStatus.Friend] = "Friend", 
    [Enum.FriendStatus.FriendRequestReceived] = "RequestReceived"
};
local v12 = l_llama_0.Dictionary.keys(v11);
local function _(v13) --[[ Line: 27 ]]
    -- upvalues: v12 (copy)
    return v12[1 + v13 % #v12];
end;
local function v18(v15) --[[ Line: 31 ]]
    -- upvalues: l_Rodux_0 (copy), l_llama_0 (copy), v12 (copy)
    return l_Rodux_0.Store.new(function() --[[ Line: 32 ]]
        -- upvalues: l_llama_0 (ref), v15 (copy), v12 (ref)
        return {
            LocalUserId = "0", 
            FriendStatuses = l_llama_0.Dictionary.map(v15, function(v16, v17) --[[ Line: 35 ]]
                -- upvalues: v12 (ref)
                return v12[1 + v17 % #v12], v16.id;
            end), 
            ScreenSize = Vector2.new(360, 720)
        };
    end, {
        l_Rodux_0.thunkMiddleware
    });
end;
local function v25(v19) --[[ Line: 43 ]]
    -- upvalues: v8 (copy), l_llama_0 (copy), v12 (copy), v11 (copy), l_PresenceType_0 (copy)
    local l_test_0 = v19[v8].Friends.byUserId.test;
    local v21 = {};
    l_llama_0.List.every(l_test_0, function(v22, v23) --[[ Line: 47 ]]
        -- upvalues: v12 (ref), v21 (copy), v11 (ref), l_PresenceType_0 (ref)
        local v24 = v12[1 + v23 % #v12];
        v21[v23] = {
            id = v22, 
            displayName = v11[v24], 
            userPresenceType = l_PresenceType_0.InGame, 
            lastLocation = "Last Location", 
            username = ""
        };
        return true;
    end);
    return v21;
end;
local v26 = v25(l_manyFriends_0);
local v27 = v25(l_smallNumbersOfFriends_0);
return {
    friendRequests = v26, 
    manyFriendRequests = v26, 
    smallNumbersOfFriendRequests = v27, 
    createStore = v18
};