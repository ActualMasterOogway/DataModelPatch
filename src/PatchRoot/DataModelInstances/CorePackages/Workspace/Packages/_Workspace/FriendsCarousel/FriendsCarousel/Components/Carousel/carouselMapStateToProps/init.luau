local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_0.dependencies);
local l_SocialLibraries_0 = v2.SocialLibraries;
local l_isSubjectTo10ftPolicies_0 = v2.isSubjectTo10ftPolicies;
local l_getDeepValue_0 = l_SocialLibraries_0.Dictionary.getDeepValue;
local l_RODUX_KEY_0 = require(l_Parent_0.Common.Constants).RODUX_KEY;
local l_RECOMMENDATION_SESSION_ID_KEY_0 = require(l_Parent_0.Common.Constants).RECOMMENDATION_SESSION_ID_KEY;
local v8 = require(script.Parent.getFriendsList);
local v9 = require(script.Parent.getRecommendationsList);
local v10 = require(script.Parent.getCarouselList);
local v11 = require(script.Parent.getCarouselFetchingStatus);
local v12 = require(l_Parent_0.Utils.showRecommendations);
local l_NetworkStatus_0 = v2.RoduxNetworking.Enum.NetworkStatus;
local l_getSessionIdByKey_0 = v2.RoduxAnalytics.Selectors.getSessionIdByKey;
local _ = require(l_Parent_0.Common.LocalTypes);
local v16 = game:DefineFastFlag("FFlagFriendCarouselLocalShowRecommendationsLogic", false);
local l_FFlagPaginatedFriendsCarouselEnabledForAll_0 = require(l_Parent_1.SharedFlags).FFlagPaginatedFriendsCarouselEnabledForAll;
return function(v18, v19) --[[ Line: 24 ]]
    -- upvalues: v8 (copy), l_RODUX_KEY_0 (copy), l_getDeepValue_0 (copy), v16 (copy), v12 (copy), v9 (copy), l_isSubjectTo10ftPolicies_0 (copy), v10 (copy), v11 (copy), l_NetworkStatus_0 (copy), l_getSessionIdByKey_0 (copy), l_RECOMMENDATION_SESSION_ID_KEY_0 (copy), l_FFlagPaginatedFriendsCarouselEnabledForAll_0 (copy)
    local v20 = tostring(v18.LocalUserId);
    local v21 = v8(v18, l_RODUX_KEY_0, v19);
    local v22 = l_getDeepValue_0(v18, string.format("%s.Friends.countsByUserId.%s", l_RODUX_KEY_0, v20)) or 0;
    local v23 = if if v16 then v12(v22) else v19.showRecommendations then v9(v18, l_RODUX_KEY_0, v19) else {};
    local v24 = l_isSubjectTo10ftPolicies_0() and "onlineFriendsThenRecommendationsThenOfflineFriends" or "allFriendsThenRecommendations";
    local v25 = v10(v21, v23, v24);
    local v26 = l_getDeepValue_0(v18, string.format("%s.Friends.requests.receivedCount", l_RODUX_KEY_0)) or 0;
    local v27 = v11(v18, v20, v12(v22));
    v25 = v25 or {};
    if v27 ~= l_NetworkStatus_0.Done then
        table.insert(v25, {
            isLoading = true
        });
    end;
    local v28 = v23 and #v23 or 0;
    local v29 = l_getSessionIdByKey_0(v18)(l_RECOMMENDATION_SESSION_ID_KEY_0);
    return {
        localUserId = v20, 
        friendCount = v22, 
        friendRequestCount = v26, 
        fetchingStatus = v27, 
        friendsAndRecList = v25, 
        recommendationCount = v28, 
        recommendationSessionId = v29, 
        recommendationsList = if l_FFlagPaginatedFriendsCarouselEnabledForAll_0 then v23 else nil
    };
end;