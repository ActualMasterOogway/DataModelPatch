local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsCarousel");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Cryo);
local v4 = require(l_Parent_0.UIBlox);
local v5 = require(l_Parent_0.SharedFlags);
local l_userIdExists_0 = require(l_Parent_0.SocialCommon).Utils.userIdExists;
local v7 = require(l_Parent_0.ApolloClient);
local l_useQuery_0 = v7.useQuery;
local l_useApolloClient_0 = v7.useApolloClient;
local l_queries_0 = require(l_Parent_0.ApolloLocalState).queries;
local l_PresenceType_0 = require(l_Parent_0.GraphQLServer).types.PresenceType;
local v12 = require(l_Parent_0.ApolloFriends);
local v13 = require(l_Parent_0.ApolloPresence);
local l_useFetchTimeLogging_0 = require(l_Parent_0.SocialLuaAnalytics).Analytics.Timing.useFetchTimeLogging;
local v15 = require(l_script_FirstAncestor_0.Analytics.EventNames);
local v16 = require(l_script_FirstAncestor_0.Analytics.FetchNames);
local l_RetrievalStatus_0 = v4.App.Loading.Enum.RetrievalStatus;
local l_FriendsCarouselPresenceUpdateSignal_0 = require(l_script_FirstAncestor_0.Signals).FriendsCarouselPresenceUpdateSignal;
local l_FriendsCarouselFriendshipUpdateSignal_0 = require(l_script_FirstAncestor_0.Signals).FriendsCarouselFriendshipUpdateSignal;
local l_FFlagUnifyPresenceEventHandling_0 = v5.FFlagUnifyPresenceEventHandling;
local l_FFlagUnifyFriendshipEventHandling_0 = v5.FFlagUnifyFriendshipEventHandling;
local v22 = game:DefineFastFlag("CheckUserIdExistsFriendsCarousel", false);
local l_FIntFriendsCarouselInitialFetchSize_0 = v5.FIntFriendsCarouselInitialFetchSize;
local v24 = game:DefineFastInt("FriendsCarouselLoadMoreFetchSize", 10);
local _ = function(v25) --[[ Line: 62 ]] --[[ Name: getPresenceByUserIdDict ]]
    local v26 = {};
    for _, v28 in v25 do
        v26[v28.id] = v28.presence;
    end;
    return v26;
end;
local function v49(v30, v31, v32) --[[ Line: 76 ]]
    -- upvalues: v3 (copy), l_PresenceType_0 (copy)
    local v33 = v32.friends or v32.onlineFriends;
    local v34 = v30 or {};
    local v35 = {};
    for _, v37 in v34 do
        v35[v37.id] = v37.presence;
    end;
    local l_v35_0 = v35;
    v34 = v3.List.filter(v30, function(v39) --[[ Line: 85 ]]
        -- upvalues: l_PresenceType_0 (ref)
        return v39.presence.userPresenceType == l_PresenceType_0.InGame;
    end);
    v35 = v3.List.filter(v30, function(v40) --[[ Line: 89 ]]
        -- upvalues: l_PresenceType_0 (ref)
        return v40.presence.userPresenceType == l_PresenceType_0.InStudio;
    end);
    local v42 = v3.List.filter(v30, function(v41) --[[ Line: 93 ]]
        -- upvalues: l_PresenceType_0 (ref)
        return v41.presence.userPresenceType == l_PresenceType_0.Online;
    end);
    local v44 = v3.List.filter(v31 or {}, function(v43) --[[ Line: 97 ]]
        -- upvalues: l_v35_0 (copy)
        return not l_v35_0[v43.id];
    end);
    local v45 = v3.List.join(v34, v42, v35, v44);
    local v48 = v3.List.map(v45, function(v46) --[[ Line: 103 ]]
        -- upvalues: v32 (copy), l_PresenceType_0 (ref), v3 (ref)
        local v47 = if not v32.onlineFriends then {
            userPresenceType = l_PresenceType_0.Offline
        } else nil;
        return v3.Dictionary.join(v46, {
            isFriendWithUser = true, 
            presence = if v46.presence then v46.presence else v47
        });
    end);
    if v33 then
        table.insert(v48, {
            isLoading = true
        });
    end;
    return v48;
end;
local function v54(v50, v51) --[[ Line: 124 ]] --[[ Name: bulkUpdateUserPresences ]]
    -- upvalues: v13 (copy)
    for _, v53 in v51 do
        v13.Mutations.createUserPresenceCache(v50, {
            id = v53.userId, 
            userPresenceNumber = v53.userPresenceType, 
            lastLocation = v53.lastLocation, 
            lastOnline = v53.lastOnline, 
            gameId = v53.gameId, 
            placeId = v53.placeId, 
            rootPlaceId = v53.rootPlaceId, 
            universeId = v53.universeId
        });
    end;
end;
local function v66(v55, v56, v57) --[[ Line: 141 ]] --[[ Name: getNewlyOnlineFriendsCount ]]
    -- upvalues: l_queries_0 (copy), v3 (copy), v13 (copy), l_PresenceType_0 (copy)
    local v58 = v55:readQuery({
        query = l_queries_0.onlineFriendsByUserId, 
        variables = v56
    });
    local v59 = (if v58 then v58.onlineFriendsByUserId else {}) or {};
    local v60 = {};
    for _, v62 in v59 do
        v60[v62.id] = v62.presence;
    end;
    local l_v60_0 = v60;
    return #v3.List.filter(v57, function(v64) --[[ Line: 151 ]]
        -- upvalues: v13 (ref), l_PresenceType_0 (ref), l_v60_0 (copy)
        local v65 = false;
        if v13.Formatters.formatNumberToPresenceType(v64.userPresenceType) ~= l_PresenceType_0.Offline then
            v65 = not l_v60_0[tostring(v64.userId)];
        end;
        return v65;
    end);
end;
return function(v67) --[[ Line: 159 ]] --[[ Name: useCarouselList ]]
    -- upvalues: l_useApolloClient_0 (copy), v12 (copy), v2 (copy), l_useQuery_0 (copy), l_queries_0 (copy), v22 (copy), l_userIdExists_0 (copy), v3 (copy), l_FIntFriendsCarouselInitialFetchSize_0 (copy), l_useFetchTimeLogging_0 (copy), v16 (copy), v15 (copy), l_RetrievalStatus_0 (copy), v24 (copy), l_FFlagUnifyPresenceEventHandling_0 (copy), l_FFlagUnifyFriendshipEventHandling_0 (copy), l_FriendsCarouselPresenceUpdateSignal_0 (copy), v54 (copy), v66 (copy), l_FriendsCarouselFriendshipUpdateSignal_0 (copy), v49 (copy)
    local v68 = l_useApolloClient_0();
    local v69 = {
        userId = v67.userId, 
        sort = if v67.friendsSortVariant then v67.friendsSortVariant else v12.Enums.Sort.FriendshipScore
    };
    local v70 = v2.useRef(nil);
    local v71 = v2.useRef(nil);
    local v72 = l_useQuery_0(l_queries_0.allFriendsByUserId, {
        errorPolicy = "all", 
        skip = v22 and not l_userIdExists_0(v67.userId), 
        notifyOnNetworkStatusChange = true, 
        variables = v3.Dictionary.join(v69, {
            pageLimit = l_FIntFriendsCarouselInitialFetchSize_0, 
            pageCursor = ""
        })
    });
    local v73 = l_useQuery_0(l_queries_0.onlineFriendsByUserId, {
        skip = v22 and not l_userIdExists_0(v67.userId), 
        notifyOnNetworkStatusChange = true, 
        variables = v69
    });
    l_useFetchTimeLogging_0({
        loading = v72.loading, 
        error = v71.current or v72.error, 
        timerKey = v70.current or v16.AllFriends, 
        onSuccess = function(v74, v75) --[[ Line: 193 ]] --[[ Name: onSuccess ]]
            -- upvalues: v67 (copy), v15 (ref), l_RetrievalStatus_0 (ref), v16 (ref)
            if v67.fireAnalyticsEvent then
                v67.fireAnalyticsEvent(v15.PaginatedFriendsCarouselLoadingTime, {
                    status = l_RetrievalStatus_0.Done.rawValue(), 
                    loadingTime = v74, 
                    nextPage = v75 ~= v16.AllFriends, 
                    fetch = v16.AllFriends
                });
            end;
        end, 
        onError = function(v76, v77) --[[ Line: 203 ]] --[[ Name: onError ]]
            -- upvalues: v67 (copy), v15 (ref), l_RetrievalStatus_0 (ref), v16 (ref)
            if v67.fireAnalyticsEvent then
                v67.fireAnalyticsEvent(v15.PaginatedFriendsCarouselLoadingTime, {
                    status = l_RetrievalStatus_0.Failed.rawValue(), 
                    loadingTime = v76, 
                    nextPage = v77 ~= v16.AllFriends, 
                    fetch = v16.AllFriends
                });
            end;
        end
    });
    l_useFetchTimeLogging_0({
        loading = v73.loading, 
        error = v73.error, 
        timerKey = v16.OnlineFriends, 
        onSuccess = function(v78) --[[ Line: 219 ]] --[[ Name: onSuccess ]]
            -- upvalues: v67 (copy), v15 (ref), l_RetrievalStatus_0 (ref), v16 (ref)
            if v67.fireAnalyticsEvent then
                v67.fireAnalyticsEvent(v15.PaginatedFriendsCarouselLoadingTime, {
                    status = l_RetrievalStatus_0.Done.rawValue(), 
                    loadingTime = v78, 
                    fetch = v16.OnlineFriends
                });
            end;
        end, 
        onError = function(v79) --[[ Line: 228 ]] --[[ Name: onError ]]
            -- upvalues: v67 (copy), v15 (ref), l_RetrievalStatus_0 (ref), v16 (ref)
            if v67.fireAnalyticsEvent then
                v67.fireAnalyticsEvent(v15.PaginatedFriendsCarouselLoadingTime, {
                    status = l_RetrievalStatus_0.Failed.rawValue(), 
                    loadingTime = v79, 
                    fetch = v16.OnlineFriends
                });
            end;
        end
    });
    local v80 = if v72.data then v72.data.allFriendsByUserId.nextCursor else nil;
    local v81 = if v72.data then v72.data.allFriendsByUserId.friends else nil;
    local v82 = v73.data and v73.data.onlineFriendsByUserId or {};
    local v84 = v2.useCallback(function() --[[ Line: 243 ]]
        -- upvalues: v80 (copy), v72 (copy), v24 (ref), v71 (copy), v70 (copy)
        if not v80 or v80 == "" or v72.loading then
            return;
        else
            v72:fetchMore({
                variables = {
                    pageCursor = v80, 
                    pageLimit = v24
                }
            }):andThen(function(v83) --[[ Line: 257 ]]
                -- upvalues: v71 (ref)
                v71.current = v83 and v83.errors;
            end);
            v70.current = v80;
            return;
        end;
    end, {
        v80, 
        v72.loading
    });
    local function v85() --[[ Line: 264 ]]
        -- upvalues: v73 (copy), v72 (copy), v70 (copy), v71 (copy)
        v73:refetch();
        v72:refetch();
        v70.current = nil;
        v71.current = nil;
    end;
    if not l_FFlagUnifyPresenceEventHandling_0 or not l_FFlagUnifyFriendshipEventHandling_0 then
        v2.useEffect(function() --[[ Line: 272 ]]
            -- upvalues: l_FFlagUnifyPresenceEventHandling_0 (ref), l_FriendsCarouselPresenceUpdateSignal_0 (ref), v54 (ref), v68 (copy), v66 (ref), v69 (copy), v73 (copy), v67 (copy), v15 (ref), l_FFlagUnifyFriendshipEventHandling_0 (ref), l_FriendsCarouselFriendshipUpdateSignal_0 (ref), v12 (ref)
            if not l_FFlagUnifyPresenceEventHandling_0 then
                l_FriendsCarouselPresenceUpdateSignal_0.Event:Connect(function(v86) --[[ Line: 274 ]]
                    -- upvalues: v54 (ref), v68 (ref), v66 (ref), v69 (ref), v73 (ref), v67 (ref), v15 (ref)
                    v54(v68, v86);
                    if v66(v68, v69, v86) > 0 then
                        v73:refetch();
                        if v67.fireAnalyticsEvent then
                            v67.fireAnalyticsEvent(v15.OnlineFriendsRefetchOnPresenceUpdate);
                        end;
                    end;
                end);
            end;
            if not l_FFlagUnifyFriendshipEventHandling_0 then
                l_FriendsCarouselFriendshipUpdateSignal_0.Event:Connect(function(v87) --[[ Line: 288 ]]
                    -- upvalues: v12 (ref), v68 (ref), v67 (ref), v73 (ref), v15 (ref)
                    if v87.removedUserId then
                        v12.Cache.removeFriendFromCache(v68, {
                            targetUserId = v67.userId, 
                            userId = v87.removedUserId
                        });
                        return;
                    else
                        if v87.addedUserId then
                            v73:refetch();
                            v12.Cache.addFriendToFriendsByUserIdCache(v68, {
                                targetUserId = v67.userId, 
                                userId = v87.addedUserId, 
                                hasVerifiedBadge = nil
                            });
                            if v67.fireAnalyticsEvent then
                                v67.fireAnalyticsEvent(v15.OnlineFriendsRefetchOnFriendshipUpdate);
                            end;
                        end;
                        return;
                    end;
                end);
            end;
            return function() --[[ Line: 310 ]]
                -- upvalues: l_FFlagUnifyPresenceEventHandling_0 (ref), l_FriendsCarouselPresenceUpdateSignal_0 (ref), l_FFlagUnifyFriendshipEventHandling_0 (ref), l_FriendsCarouselFriendshipUpdateSignal_0 (ref)
                if not l_FFlagUnifyPresenceEventHandling_0 then
                    l_FriendsCarouselPresenceUpdateSignal_0:Destroy();
                end;
                if not l_FFlagUnifyFriendshipEventHandling_0 then
                    l_FriendsCarouselFriendshipUpdateSignal_0:Destroy();
                end;
            end;
        end, {});
    end;
    return v2.useMemo(function() --[[ Line: 321 ]]
        -- upvalues: v49 (ref), v82 (copy), v81 (copy), v72 (copy), v73 (copy)
        return (v49(v82, v81, {
            friends = v72.loading, 
            onlineFriends = v73.loading
        }));
    end, {
        v82, 
        v81, 
        v72.loading, 
        v73.loading
    }), v84, v85;
end;