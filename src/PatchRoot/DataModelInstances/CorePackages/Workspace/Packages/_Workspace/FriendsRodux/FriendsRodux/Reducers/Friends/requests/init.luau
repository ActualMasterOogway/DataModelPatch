local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsRodux");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_Parent_1 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.Rodux);
local v4 = require(script.receivedCount);
local v5 = require(script.byUserId);
local v6 = require(script.mutualFriends);
local v7 = require(script.sourceUniverseIds);
local v8 = require(script.nextPageCursor);
local v9 = require(script.sentAt);
local v10 = require(script.originSourceType);
local v11 = require(script.order);
local v12 = require(script.senderNickname);
local v13 = require(script.newFriendRequestsCount);
local l_FFlagAddNewFriendRequestsNetworking_0 = require(l_Parent_1.SharedFlags).FFlagAddNewFriendRequestsNetworking;
return function(v15) --[[ Line: 17 ]]
    -- upvalues: v3 (copy), v4 (copy), v5 (copy), v6 (copy), v7 (copy), v8 (copy), v9 (copy), v10 (copy), v11 (copy), v12 (copy), l_FFlagAddNewFriendRequestsNetworking_0 (copy), v13 (copy)
    return v3.combineReducers({
        receivedCount = v4(v15), 
        byUserId = v5(v15), 
        mutualFriends = v6(v15), 
        sourceUniverseIds = v7(v15), 
        nextPageCursor = v8(v15), 
        sentAt = v9(v15), 
        originSourceType = v10(v15), 
        order = v11(v15), 
        senderNickname = v12(v15), 
        newFriendRequestsCount = if l_FFlagAddNewFriendRequestsNetworking_0 then v13(v15) else nil
    });
end;