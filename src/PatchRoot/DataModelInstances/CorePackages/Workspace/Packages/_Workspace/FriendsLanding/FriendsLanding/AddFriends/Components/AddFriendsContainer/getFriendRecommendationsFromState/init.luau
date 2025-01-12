local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsLanding");
local v1 = require(l_script_FirstAncestor_0.dependencies);
local l_AddFriends_0 = l_script_FirstAncestor_0.AddFriends;
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_llama_0 = v1.llama;
local l_getDeepValue_0 = v1.SocialLibraries.Dictionary.getDeepValue;
local l_RecommendationSourceEnum_0 = v1.SocialCommon.Enums.RecommendationSourceEnum;
local l_FFlagAddFriendsSeparateReducers_0 = require(l_Parent_0.SharedFlags).FFlagAddFriendsSeparateReducers;
local v8 = require(l_AddFriends_0.Redux.AddFriendsSelector);
local v9 = if l_FFlagAddFriendsSeparateReducers_0 then nil else require(l_script_FirstAncestor_0.Common.Constants).RODUX_KEY;
local v10 = if l_FFlagAddFriendsSeparateReducers_0 then require(l_AddFriends_0.Redux.RoduxFriends) else v1.RoduxFriends;
return function(v11) --[[ Line: 23 ]]
    -- upvalues: v10 (copy), l_RecommendationSourceEnum_0 (copy), l_llama_0 (copy), l_FFlagAddFriendsSeparateReducers_0 (copy), v8 (copy), l_getDeepValue_0 (copy), v9 (copy)
    local l_LocalUserId_0 = v11.LocalUserId;
    local v13 = v10.Selectors.getRecommendationIdsBySource(v11)(l_RecommendationSourceEnum_0.AddFriendsPage);
    local v14 = v10.Selectors.getSortedByRankRecommendationIds(v11)(l_LocalUserId_0, v13);
    local function v16(v15) --[[ Line: 31 ]]
        -- upvalues: l_llama_0 (ref), l_FFlagAddFriendsSeparateReducers_0 (ref), v8 (ref), v11 (copy), l_getDeepValue_0 (ref), v9 (ref), l_LocalUserId_0 (copy)
        return (l_llama_0.Dictionary.join(if l_FFlagAddFriendsSeparateReducers_0 then v8(v11, "Users.byUserId.%s", v15) else l_getDeepValue_0(v11, string.format("%s.Users.byUserId.%s", v9, v15)), if l_FFlagAddFriendsSeparateReducers_0 then v8(v11, "Friends.recommendations.byUserId.%s.%s", l_LocalUserId_0, v15) else l_getDeepValue_0(v11, string.format("%s.Friends.recommendations.byUserId.%s.%s", v9, l_LocalUserId_0, v15)), {
            isRecommendation = true
        }));
    end;
    return (l_llama_0.List.map(v14, v16));
end;