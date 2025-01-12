local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsLanding");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_AddFriends_0 = l_script_FirstAncestor_0.AddFriends;
local v3 = require(l_AddFriends_0.dependencies);
local l_llama_0 = v3.llama;
local l_Promise_0 = v3.Promise;
local l_SocialCommon_0 = v3.SocialCommon;
local l_RecommendationSourceEnum_0 = l_SocialCommon_0.Enums.RecommendationSourceEnum;
local l_ContextualInfoTypes_0 = l_SocialCommon_0.Enums.ContextualInfoTypes;
local l_RECOMMENDATION_SESSION_ID_KEY_0 = require(l_script_FirstAncestor_0.Common.Constants).RECOMMENDATION_SESSION_ID_KEY;
local l_FFlagAddFriendsMigrateAnalytics_0 = require(l_Parent_0.SharedFlags).FFlagAddFriendsMigrateAnalytics;
local l_FFlagAddFriendsSeparateReducers_0 = require(l_Parent_0.SharedFlags).FFlagAddFriendsSeparateReducers;
local v12 = if l_FFlagAddFriendsSeparateReducers_0 then require(l_AddFriends_0.Redux.RoduxFriends) else v3.RoduxFriends;
local v13 = if l_FFlagAddFriendsSeparateReducers_0 then require(l_AddFriends_0.Redux.RoduxAnalytics) else v3.RoduxAnalytics;
local v14 = if l_FFlagAddFriendsSeparateReducers_0 then require(l_AddFriends_0.Networking.FriendsNetworking) else v3.FriendsNetworking;
local v15 = if l_FFlagAddFriendsSeparateReducers_0 then require(l_AddFriends_0.Networking.NetworkingGames) else v3.GamesNetworking;
local v16 = if l_FFlagAddFriendsSeparateReducers_0 then require(l_AddFriends_0.Networking.NetworkingAccountInformation) else v3.NetworkingAccountInformation;
local v17 = if l_FFlagAddFriendsSeparateReducers_0 then require(l_AddFriends_0.Networking.NetworkingUserSettings) else v3.NetworkingUserSettings;
local l_FFlagAddNewFriendRequestsNetworking_0 = require(l_Parent_0.SharedFlags).FFlagAddNewFriendRequestsNetworking;
local function v25(v19) --[[ Line: 40 ]]
    local v20 = {};
    local v21 = {};
    for _, v23 in pairs(v19) do
        table.insert(v20, v23.id);
        local l_sourceUniverseId_0 = v23.friendRequest.sourceUniverseId;
        if l_sourceUniverseId_0 ~= nil and l_sourceUniverseId_0 ~= 0 then
            table.insert(v21, l_sourceUniverseId_0);
        end;
    end;
    return {
        userIds = v20, 
        universeIds = v21
    };
end;
return function(v26) --[[ Line: 56 ]]
    -- upvalues: v14 (copy), l_FFlagAddFriendsMigrateAnalytics_0 (copy), l_ContextualInfoTypes_0 (copy), l_FFlagAddNewFriendRequestsNetworking_0 (copy), v16 (copy), l_Promise_0 (copy), l_llama_0 (copy), v25 (copy), v15 (copy), l_RecommendationSourceEnum_0 (copy), v12 (copy), v13 (copy), l_RECOMMENDATION_SESSION_ID_KEY_0 (copy), v17 (copy)
    return {
        acceptFriendRequest = function(v27) --[[ Line: 58 ]] --[[ Name: acceptFriendRequest ]]
            -- upvalues: v26 (copy), v14 (ref)
            return v26(v14.AcceptFriendRequestFromUserId.API(v27));
        end, 
        declineFriendRequest = function(v28) --[[ Line: 61 ]] --[[ Name: declineFriendRequest ]]
            -- upvalues: v26 (copy), v14 (ref)
            return v26(v14.DeclineFriendRequestFromUserId.API(v28));
        end, 
        ignoreAllFriendsRequests = function(v29) --[[ Line: 64 ]] --[[ Name: ignoreAllFriendsRequests ]]
            -- upvalues: v26 (copy), v14 (ref)
            return v26(v14.DeclineAllFriendRequests.API(v29));
        end, 
        requestFriendship = function(v30) --[[ Line: 67 ]] --[[ Name: requestFriendship ]]
            -- upvalues: l_FFlagAddFriendsMigrateAnalytics_0 (ref), v26 (copy), v14 (ref), l_ContextualInfoTypes_0 (ref)
            if l_FFlagAddFriendsMigrateAnalytics_0 then
                if v30.isContact then
                    return v26(v14.RequestFriendshipFromContactId.API({
                        currentUserId = v30.currentUserId, 
                        contactId = v30.targetUserId
                    }));
                else
                    return v26(v14.RequestFriendshipFromUserId.API({
                        currentUserId = v30.currentUserId, 
                        targetUserId = v30.targetUserId, 
                        friendshipOriginSourceType = v30.friendshipOriginSourceType
                    }));
                end;
            elseif v30.contextType == l_ContextualInfoTypes_0.Contacts then
                return v26(v14.RequestFriendshipFromContactId.API(v30));
            else
                return v26(v14.RequestFriendshipFromUserId.API(v30));
            end;
        end, 
        getFriendRequestsCount = function(v31) --[[ Line: 89 ]] --[[ Name: getFriendRequestsCount ]]
            -- upvalues: v26 (copy), v14 (ref)
            return v26(v14.GetFriendRequestsCount.API(v31));
        end, 
        clearNewFriendRequests = l_FFlagAddNewFriendRequestsNetworking_0 and function(v32) --[[ Line: 93 ]]
            -- upvalues: v26 (copy), v14 (ref)
            return v26(v14.ClearNewFriendRequests.API({
                currentUserId = v32
            }));
        end or nil, 
        getPhoneInformation = function() --[[ Line: 99 ]] --[[ Name: getPhoneInformation ]]
            -- upvalues: v26 (copy), v16 (ref)
            return v26(v16.GetPhoneInformation.API({}));
        end, 
        getFriendRequests = function(v33) --[[ Line: 102 ]] --[[ Name: getFriendRequests ]]
            -- upvalues: l_Promise_0 (ref), l_llama_0 (ref), v26 (copy), v14 (ref), v25 (ref), v15 (ref)
            return l_Promise_0.new(function(v34, v35) --[[ Line: 103 ]]
                -- upvalues: v33 (ref), l_llama_0 (ref), v26 (ref), v14 (ref), v25 (ref), v15 (ref), l_Promise_0 (ref)
                v33 = l_llama_0.Dictionary.join(v33 or {}, {
                    currentUserId = v33.localUserId
                });
                v26(v14.GetFriendRequests.API(v33)):andThen(function(v36) --[[ Line: 108 ]]
                    -- upvalues: v25 (ref), l_llama_0 (ref), v26 (ref), v14 (ref), v15 (ref), l_Promise_0 (ref), v34 (copy), v35 (copy)
                    local v37 = v25(v36.responseBody.data);
                    local v38 = {};
                    if not l_llama_0.isEmpty(v37.userIds) then
                        table.insert(v38, v26(v14.GetFollowingExists.API({
                            targetUserIds = v37.userIds
                        })));
                    end;
                    if not l_llama_0.isEmpty(v37.universeIds) then
                        table.insert(v38, v26(v15.GetExperiencesDetails.API(v37.universeIds)));
                    end;
                    l_Promise_0.all(v38):andThen(function() --[[ Line: 124 ]]
                        -- upvalues: v34 (ref), v36 (copy)
                        v34(v36);
                    end):catch(v35);
                end):catch(v35);
            end);
        end, 
        getFriendRecommendations = function(v39) --[[ Line: 132 ]] --[[ Name: getFriendRecommendations ]]
            -- upvalues: v26 (copy), v14 (ref), l_RecommendationSourceEnum_0 (ref), l_llama_0 (ref), l_ContextualInfoTypes_0 (ref), v12 (ref), v13 (ref), l_RECOMMENDATION_SESSION_ID_KEY_0 (ref), l_Promise_0 (ref)
            return v26(v14.GetFriendRecommendationsFromUserId.API({
                targetUserId = v39.localUserId, 
                source = l_RecommendationSourceEnum_0.AddFriendsPage
            })):andThen(function(v40) --[[ Line: 136 ]]
                -- upvalues: l_llama_0 (ref), l_ContextualInfoTypes_0 (ref), v26 (ref), v12 (ref), l_RecommendationSourceEnum_0 (ref), v13 (ref), l_RECOMMENDATION_SESSION_ID_KEY_0 (ref), l_Promise_0 (ref)
                local l_data_0 = v40.responseBody.data;
                local v43 = l_llama_0.List.map(l_data_0, function(v42) --[[ Line: 138 ]]
                    -- upvalues: l_ContextualInfoTypes_0 (ref)
                    if v42.contextType == l_ContextualInfoTypes_0.Contacts then
                        return v42.contactId;
                    else
                        return v42.id;
                    end;
                end);
                v26(v12.Actions.RecommendationSourceCreated({
                    source = l_RecommendationSourceEnum_0.AddFriendsPage, 
                    recommendationIds = v43
                }));
                local l_recommendationRequestId_0 = v40.responseBody.recommendationRequestId;
                v26(v13.Actions.SessionIdUpdated({
                    sessionKey = l_RECOMMENDATION_SESSION_ID_KEY_0, 
                    sessionId = l_recommendationRequestId_0
                }));
                return l_Promise_0.resolve(v40);
            end);
        end, 
        getUserSettingsMetadata = function() --[[ Line: 156 ]] --[[ Name: getUserSettingsMetadata ]]
            -- upvalues: v26 (copy), v17 (ref)
            return v26(v17.GetUserSettingsMetadata.API());
        end
    };
end;