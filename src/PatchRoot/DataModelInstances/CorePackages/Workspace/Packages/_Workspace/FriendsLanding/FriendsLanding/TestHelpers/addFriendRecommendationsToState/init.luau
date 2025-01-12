local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsLanding");
local v1 = require(l_script_FirstAncestor_0.dependencies);
local l_AddFriends_0 = l_script_FirstAncestor_0.AddFriends;
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_getDeepValue_0 = v1.SocialLibraries.Dictionary.getDeepValue;
local l_RecommendationSourceEnum_0 = v1.SocialCommon.Enums.RecommendationSourceEnum;
local v6 = if require(l_Parent_0.SharedFlags).FFlagAddFriendsSeparateReducers then require(l_AddFriends_0.Redux.RODUX_KEY) else require(l_script_FirstAncestor_0.Common.Constants).RODUX_KEY;
return function(v7) --[[ Line: 17 ]]
    -- upvalues: l_getDeepValue_0 (copy), v6 (copy), l_RecommendationSourceEnum_0 (copy)
    local v8 = l_getDeepValue_0(v7, string.format("%s.Friends.recommendations.byUserId.%s", v6, "test")) or {};
    local v9 = {};
    for v10, _ in pairs(v8) do
        v9[v10] = true;
    end;
    v7[v6].Friends.recommendations.bySource = {
        [l_RecommendationSourceEnum_0.AddFriendsPage] = v9
    };
end;