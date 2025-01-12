local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsLanding");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.Common.Constants);
local l_FFlagAddFriendsMigrateAnalytics_0 = require(l_Parent_0.SharedFlags).FFlagAddFriendsMigrateAnalytics;
return function(v4) --[[ Line: 34 ]]
    -- upvalues: l_FFlagAddFriendsMigrateAnalytics_0 (copy), v2 (copy)
    return {
        absolutePosition = v4.position, 
        requestedId = v4.playerId, 
        isRecommendation = not v4.isFriendRequest, 
        recommendationRank = if not v4.isFriendRequest then v4.rank else nil, 
        source = if l_FFlagAddFriendsMigrateAnalytics_0 then nil else if v4.isFriendRequest then nil else v2.AddFriendsPYMKSourceName, 
        contextType = if l_FFlagAddFriendsMigrateAnalytics_0 then nil else v4.contextType, 
        isContact = if l_FFlagAddFriendsMigrateAnalytics_0 then v4.isContact else nil, 
        contextualInfoType = if l_FFlagAddFriendsMigrateAnalytics_0 then v4.contextualInfoType else nil
    };
end;