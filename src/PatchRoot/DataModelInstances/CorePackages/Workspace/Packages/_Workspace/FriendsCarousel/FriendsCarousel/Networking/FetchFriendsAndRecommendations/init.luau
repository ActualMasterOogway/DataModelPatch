local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_0.dependencies);
local l_NetworkingFriends_0 = v2.NetworkingFriends;
local l_NetworkingAliases_0 = v2.NetworkingAliases;
local l_RoduxFriends_0 = v2.RoduxFriends;
local l_RoduxAnalytics_0 = v2.RoduxAnalytics;
local l_Promise_0 = v2.Promise;
local l_Dash_0 = v2.Dash;
local v9 = require(l_Parent_0.Utils.showRecommendations);
local l_EventNames_0 = require(l_Parent_0.Analytics).EventNames;
local l_Analytics_0 = require(l_Parent_0.Analytics).Analytics;
local v12 = require(l_Parent_0.Analytics.FetchNames);
local l_RetrievalStatus_0 = require(l_Parent_1.UIBlox).App.Loading.Enum.RetrievalStatus;
local v14 = require(l_Parent_0.Common.UserSorts);
local l_RECOMMENDATION_SESSION_ID_KEY_0 = require(l_Parent_0.Common.Constants).RECOMMENDATION_SESSION_ID_KEY;
local l_SocialCommon_0 = v2.SocialCommon;
local l_RecommendationSourceEnum_0 = l_SocialCommon_0.Enums.RecommendationSourceEnum;
local l_ContextualInfoTypes_0 = l_SocialCommon_0.Enums.ContextualInfoTypes;
local l_Timers_0 = require(l_Parent_1.SocialLuaAnalytics).Analytics.Timing.Timers;
local v20 = v2.logger:new("FriendsCarousel/" .. script.Name);
local l_isSubjectToDesktopPolicies_0 = v2.isSubjectToDesktopPolicies;
local function _(v22) --[[ Line: 35 ]]
    -- upvalues: v9 (copy), l_isSubjectToDesktopPolicies_0 (copy)
    return v9(v22) and not l_isSubjectToDesktopPolicies_0();
end;
local v24 = 0;
return function(v25) --[[ Line: 47 ]]
    -- upvalues: l_Analytics_0 (copy), l_Timers_0 (copy), l_NetworkingFriends_0 (copy), v14 (copy), v24 (ref), l_Dash_0 (copy), l_EventNames_0 (copy), l_RetrievalStatus_0 (copy), v12 (copy), l_NetworkingAliases_0 (copy), l_Promise_0 (copy), v20 (copy), v9 (copy), l_isSubjectToDesktopPolicies_0 (copy), l_ContextualInfoTypes_0 (copy), l_RoduxFriends_0 (copy), l_RecommendationSourceEnum_0 (copy), l_RoduxAnalytics_0 (copy), l_RECOMMENDATION_SESSION_ID_KEY_0 (copy)
    return function(v26) --[[ Line: 48 ]]
        -- upvalues: l_Analytics_0 (ref), l_Timers_0 (ref), l_NetworkingFriends_0 (ref), v14 (ref), v24 (ref), v25 (copy), l_Dash_0 (ref), l_EventNames_0 (ref), l_RetrievalStatus_0 (ref), v12 (ref), l_NetworkingAliases_0 (ref), l_Promise_0 (ref), v20 (ref), v9 (ref), l_isSubjectToDesktopPolicies_0 (ref), l_ContextualInfoTypes_0 (ref), l_RoduxFriends_0 (ref), l_RecommendationSourceEnum_0 (ref), l_RoduxAnalytics_0 (ref), l_RECOMMENDATION_SESSION_ID_KEY_0 (ref)
        local v27 = tostring(v26:getState().LocalUserId);
        local l_fireAnalyticsEvent_0 = l_Analytics_0({
            infoForAllEvents = {
                uid = v27
            }
        }).fireAnalyticsEvent;
        local v29 = l_Timers_0();
        local v30 = v29.start();
        return v26:dispatch(l_NetworkingFriends_0.GetFriendsFromUserId.API(v27, {
            userSort = v14.StatusFrequents
        })):andThen(function(v31) --[[ Line: 62 ]]
            -- upvalues: v24 (ref), v25 (ref), l_Dash_0 (ref), v29 (copy), v30 (copy), l_fireAnalyticsEvent_0 (copy), l_EventNames_0 (ref), l_RetrievalStatus_0 (ref), v12 (ref), v26 (copy), l_NetworkingAliases_0 (ref), l_Promise_0 (ref), v20 (ref), v9 (ref), l_isSubjectToDesktopPolicies_0 (ref), l_NetworkingFriends_0 (ref), v27 (copy), l_ContextualInfoTypes_0 (ref), l_RoduxFriends_0 (ref), l_RecommendationSourceEnum_0 (ref), l_RoduxAnalytics_0 (ref), l_RECOMMENDATION_SESSION_ID_KEY_0 (ref)
            local l_data_0 = v31.responseBody.data;
            local v33 = l_data_0 and #l_data_0 or 0;
            v24 = if v25 and v25.refresh then v24 + 1 else v24;
            local v35 = if l_data_0 then l_Dash_0.map(l_data_0, function(v34) --[[ Line: 67 ]]
                return v34.id;
            end) else {};
            local v36 = v29.stop(v30);
            l_fireAnalyticsEvent_0(l_EventNames_0.FriendsEndpointLoadingTime, {
                status = l_RetrievalStatus_0.Done.rawValue(), 
                loadingTime = v36, 
                fetch = v12.OldAllFriends
            });
            v26:dispatch(l_NetworkingAliases_0.GetTagsFromUserIds.API(v35)):andThen(function() --[[ Line: 82 ]]
                -- upvalues: l_Promise_0 (ref)
                return l_Promise_0.resolve();
            end):catch(function(v37) --[[ Line: 85 ]]
                -- upvalues: v20 (ref)
                v20:info((("GetTagsFromUserIds failed: %*"):format(v37)));
            end);
            if v9(v33) and not l_isSubjectToDesktopPolicies_0() then
                v26:dispatch(l_NetworkingFriends_0.GetFriendRecommendationsFromUserId.API({
                    targetUserId = v27
                })):andThen(function(v38) --[[ Line: 94 ]]
                    -- upvalues: l_Dash_0 (ref), l_ContextualInfoTypes_0 (ref), v26 (ref), l_RoduxFriends_0 (ref), l_RecommendationSourceEnum_0 (ref), l_RoduxAnalytics_0 (ref), l_RECOMMENDATION_SESSION_ID_KEY_0 (ref), l_Promise_0 (ref), l_fireAnalyticsEvent_0 (ref), l_EventNames_0 (ref), v33 (copy), v24 (ref)
                    local l_data_1 = v38.responseBody.data;
                    local v41 = l_Dash_0.map(l_data_1, function(v40) --[[ Line: 96 ]]
                        -- upvalues: l_ContextualInfoTypes_0 (ref)
                        if v40.contextType == l_ContextualInfoTypes_0.Contacts then
                            return v40.contactId;
                        else
                            return v40.id;
                        end;
                    end);
                    v26:dispatch(l_RoduxFriends_0.Actions.RecommendationSourceCreated({
                        source = l_RecommendationSourceEnum_0.HomepageFriendsCarousel, 
                        recommendationIds = v41
                    }));
                    local l_recommendationRequestId_0 = v38.responseBody.recommendationRequestId;
                    v26:dispatch(l_RoduxAnalytics_0.Actions.SessionIdUpdated({
                        sessionKey = l_RECOMMENDATION_SESSION_ID_KEY_0, 
                        sessionId = l_recommendationRequestId_0
                    }));
                    return l_Promise_0.resolve(v38):andThen(function(v43) --[[ Line: 112 ]]
                        -- upvalues: l_fireAnalyticsEvent_0 (ref), l_EventNames_0 (ref), v33 (ref), v24 (ref)
                        if l_fireAnalyticsEvent_0 then
                            local l_data_2 = v43.responseBody.data;
                            local v45 = l_data_2 and #l_data_2 or 0;
                            local l_recommendationRequestId_1 = v43.responseBody.recommendationRequestId;
                            l_fireAnalyticsEvent_0(l_EventNames_0.CarouselLoadedWithUsers, {
                                friendCount = v33, 
                                recommendationCount = v45, 
                                recommendationLimit = true, 
                                refreshCount = v24, 
                                fetchedRecommendations = true, 
                                recommendationSessionId = l_recommendationRequestId_1
                            });
                        end;
                    end);
                end):catch(function(v47) --[[ Line: 130 ]]
                    -- upvalues: v20 (ref)
                    v20:info((("GetFriendRecommendationsFromUserId failed: %*"):format(v47)));
                end);
            elseif l_fireAnalyticsEvent_0 then
                l_fireAnalyticsEvent_0(l_EventNames_0.CarouselLoadedWithUsers, {
                    friendCount = v33, 
                    recommendationCount = 0, 
                    recommendationLimit = true, 
                    refreshCount = v24, 
                    fetchedRecommendations = false
                });
            end;
            return l_Promise_0.resolve(l_data_0);
        end);
    end;
end;