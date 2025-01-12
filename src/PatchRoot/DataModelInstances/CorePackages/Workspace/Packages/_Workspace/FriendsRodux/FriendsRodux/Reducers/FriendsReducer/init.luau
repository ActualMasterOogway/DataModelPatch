local l_Parent_0 = script:FindFirstAncestor("FriendsRodux").Parent;
local l_FFlagGetFriendCountFromNetwork_0 = require(l_Parent_0.SharedFlags).FFlagGetFriendCountFromNetwork;
local v2 = require(script.Parent.Friends.byUserId);
local v3 = if l_FFlagGetFriendCountFromNetwork_0 then require(script.Parent.Friends.countsByUserId) else require(script.Parent.Friends.countsByUserId_Deprecated);
local v4 = require(script.Parent.Friends.requests);
local v5 = require(script.Parent.Friends.recommendations);
local v6 = require(script.Parent.Friends.followings);
local v7 = require(script.Parent.Friends.friendshipStatus);
local v8 = require(script.Parent.Friends.friendsRankByUserId);
local v9 = require(script.Parent.Friends.contactNamesByUserId);
local l_FFlagAddNewFriendRequestsNetworking_0 = require(l_Parent_0.SharedFlags).FFlagAddNewFriendRequestsNetworking;
local v11 = {
    countsByUserId = {}, 
    byUserId = {}, 
    requests = {
        receivedCount = 0, 
        newFriendRequestsCount = l_FFlagAddNewFriendRequestsNetworking_0 and 0 or nil
    }, 
    recommendations = {}, 
    followings = {}, 
    friendshipStatus = {}, 
    friendsRankByUserId = {}, 
    contactNamesByUserId = {}
};
return function(v12) --[[ Line: 33 ]]
    -- upvalues: v11 (copy), v2 (copy), v3 (copy), v4 (copy), v5 (copy), v6 (copy), v7 (copy), v8 (copy), v9 (copy), l_FFlagGetFriendCountFromNetwork_0 (copy)
    return function(v13, v14) --[[ Line: 34 ]]
        -- upvalues: v11 (ref), v2 (ref), v12 (copy), v3 (ref), v4 (ref), v5 (ref), v6 (ref), v7 (ref), v8 (ref), v9 (ref), l_FFlagGetFriendCountFromNetwork_0 (ref)
        local v15 = v13 or v11;
        local v16 = v2(v12);
        local v17 = v3(v12);
        local v18 = v4(v12);
        local v19 = v5(v12);
        local v20 = v6(v12);
        local v21 = v7(v12);
        local v22 = v8(v12);
        local v23 = v9(v12);
        return {
            byUserId = v16(v15.byUserId, v14), 
            countsByUserId = v17(if l_FFlagGetFriendCountFromNetwork_0 then v15.countsByUserId else v13, v14), 
            requests = v18(v15.requests, v14), 
            recommendations = v19(v15.recommendations, v14), 
            followings = v20(v15.followings, v14), 
            friendshipStatus = v21(v15.friendshipStatus, v14), 
            friendsRankByUserId = v22(v15.friendsRankByUserId, v14), 
            contactNamesByUserId = v23(v15.contactNamesByUserId, v14)
        };
    end;
end;