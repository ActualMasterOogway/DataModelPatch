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
local l_FFlagFixNoUniverseIdPaginatedFriends_0 = v5.FFlagFixNoUniverseIdPaginatedFriends;
local v23 = game:DefineFastFlag("CheckUserIdExistsFriendsCarousel", false);
local l_FIntFriendsCarouselInitialFetchSize_0 = v5.FIntFriendsCarouselInitialFetchSize;
local v25 = game:DefineFastInt("FriendsCarouselLoadMoreFetchSize", 10);
local _ = function(v26) --[[ Line: 61 ]] --[[ Name: getPresenceByUserIdDict ]]
    local v27 = {};
    for _, v29 in v26 do
        v27[v29.id] = v29.presence;
    end;
    return v27;
end;
local function _(v31, v32) --[[ Line: 75 ]]
    -- upvalues: v3 (copy), l_PresenceType_0 (copy)
    return v3.List.map(v31, function(v33) --[[ Line: 76 ]]
        -- upvalues: v32 (copy), l_PresenceType_0 (ref), v3 (ref)
        local v34 = if not v32.onlineFriends then {
            userPresenceType = l_PresenceType_0.Offline
        } else nil;
        return v3.Dictionary.join(v33, {
            isFriendWithUser = true, 
            presence = if v33.presence then v33.presence else v34
        });
    end);
end;
local function _(v36) --[[ Line: 91 ]]
    -- upvalues: v3 (copy), l_PresenceType_0 (copy)
    return v3.List.map(v36, function(v37) --[[ Line: 92 ]]
        -- upvalues: l_PresenceType_0 (ref), v3 (ref)
        if v37.presence and v37.presence.userPresenceType == l_PresenceType_0.InGame and v37.presence.universeId == "" then
            local v38 = v3.Dictionary.join(v37.presence, {
                userPresenceType = l_PresenceType_0.Online
            });
            return v3.Dictionary.join(v37, {
                presence = v38
            });
        else
            return v37;
        end;
    end);
end;
local function v62(v40, v41, v42) --[[ Line: 105 ]]
    -- upvalues: v3 (copy), l_PresenceType_0 (copy)
    local v43 = v42.friends or v42.onlineFriends;
    local v44 = v40 or {};
    local v45 = {};
    for _, v47 in v44 do
        v45[v47.id] = v47.presence;
    end;
    local l_v45_0 = v45;
    v44 = v3.List.filter(v40, function(v49) --[[ Line: 114 ]]
        -- upvalues: l_PresenceType_0 (ref)
        return v49.presence.userPresenceType == l_PresenceType_0.InGame;
    end);
    v45 = v3.List.filter(v40, function(v50) --[[ Line: 118 ]]
        -- upvalues: l_PresenceType_0 (ref)
        return v50.presence.userPresenceType == l_PresenceType_0.InStudio;
    end);
    local v52 = v3.List.filter(v40, function(v51) --[[ Line: 122 ]]
        -- upvalues: l_PresenceType_0 (ref)
        return v51.presence.userPresenceType == l_PresenceType_0.Online;
    end);
    local v54 = v3.List.filter(v41 or {}, function(v53) --[[ Line: 126 ]]
        -- upvalues: l_v45_0 (copy)
        return not l_v45_0[v53.id];
    end);
    local v55 = v3.List.join(v44, v52, v45);
    local v58 = v3.List.map(v55, function(v56) --[[ Line: 76 ]]
        -- upvalues: v42 (copy), l_PresenceType_0 (ref), v3 (ref)
        local v57 = if not v42.onlineFriends then {
            userPresenceType = l_PresenceType_0.Offline
        } else nil;
        return v3.Dictionary.join(v56, {
            isFriendWithUser = true, 
            presence = if v56.presence then v56.presence else v57
        });
    end);
    local v61 = v3.List.map(v54, function(v59) --[[ Line: 76 ]]
        -- upvalues: v42 (copy), l_PresenceType_0 (ref), v3 (ref)
        local v60 = if not v42.onlineFriends then {
            userPresenceType = l_PresenceType_0.Offline
        } else nil;
        return v3.Dictionary.join(v59, {
            isFriendWithUser = true, 
            presence = if v59.presence then v59.presence else v60
        });
    end);
    if v43 then
        table.insert(v61, {
            isLoading = true
        });
    end;
    return v58, v61;
end;
local function v67(v63, v64) --[[ Line: 141 ]] --[[ Name: bulkUpdateUserPresences ]]
    -- upvalues: v13 (copy)
    for _, v66 in v64 do
        v13.Mutations.createUserPresenceCache(v63, {
            id = v66.userId, 
            userPresenceNumber = v66.userPresenceType, 
            lastLocation = v66.lastLocation, 
            lastOnline = v66.lastOnline, 
            gameId = v66.gameId, 
            placeId = v66.placeId, 
            rootPlaceId = v66.rootPlaceId, 
            universeId = v66.universeId
        });
    end;
end;
local function v79(v68, v69, v70) --[[ Line: 158 ]] --[[ Name: getNewlyOnlineFriendsCount ]]
    -- upvalues: l_queries_0 (copy), v3 (copy), v13 (copy), l_PresenceType_0 (copy)
    local v71 = v68:readQuery({
        query = l_queries_0.onlineFriendsByUserId, 
        variables = v69
    });
    local v72 = (if v71 then v71.onlineFriendsByUserId else {}) or {};
    local v73 = {};
    for _, v75 in v72 do
        v73[v75.id] = v75.presence;
    end;
    local l_v73_0 = v73;
    return #v3.List.filter(v70, function(v77) --[[ Line: 168 ]]
        -- upvalues: v13 (ref), l_PresenceType_0 (ref), l_v73_0 (copy)
        local v78 = false;
        if v13.Formatters.formatNumberToPresenceType(v77.userPresenceType) ~= l_PresenceType_0.Offline then
            v78 = not l_v73_0[tostring(v77.userId)];
        end;
        return v78;
    end);
end;
return function(v80) --[[ Line: 176 ]] --[[ Name: useCarouselList ]]
    -- upvalues: l_useApolloClient_0 (copy), v12 (copy), v2 (copy), l_useQuery_0 (copy), l_queries_0 (copy), v23 (copy), l_userIdExists_0 (copy), v3 (copy), l_FIntFriendsCarouselInitialFetchSize_0 (copy), l_useFetchTimeLogging_0 (copy), v16 (copy), v15 (copy), l_RetrievalStatus_0 (copy), v25 (copy), l_FFlagUnifyFriendshipEventHandling_0 (copy), l_FFlagUnifyPresenceEventHandling_0 (copy), l_FriendsCarouselPresenceUpdateSignal_0 (copy), v67 (copy), v79 (copy), l_FriendsCarouselFriendshipUpdateSignal_0 (copy), v62 (copy), l_FFlagFixNoUniverseIdPaginatedFriends_0 (copy), l_PresenceType_0 (copy)
    local v81 = l_useApolloClient_0();
    local v82 = {
        userId = v80.userId, 
        sort = if v80.friendsSortVariant then v80.friendsSortVariant else v12.Enums.Sort.FriendshipScore
    };
    local v83 = v2.useRef(nil);
    local v84 = v2.useRef(nil);
    local v85 = l_useQuery_0(l_queries_0.allFriendsByUserId, {
        errorPolicy = "all", 
        skip = v23 and not l_userIdExists_0(v80.userId), 
        notifyOnNetworkStatusChange = true, 
        variables = v3.Dictionary.join(v82, {
            pageLimit = l_FIntFriendsCarouselInitialFetchSize_0, 
            pageCursor = ""
        })
    });
    local v86 = l_useQuery_0(l_queries_0.onlineFriendsByUserId, {
        skip = v23 and not l_userIdExists_0(v80.userId), 
        notifyOnNetworkStatusChange = true, 
        variables = v82
    });
    l_useFetchTimeLogging_0({
        loading = v85.loading, 
        error = v84.current or v85.error, 
        timerKey = v83.current or v16.AllFriends, 
        onSuccess = function(v87, v88) --[[ Line: 215 ]] --[[ Name: onSuccess ]]
            -- upvalues: v80 (copy), v15 (ref), l_RetrievalStatus_0 (ref), v16 (ref)
            if v80.fireAnalyticsEvent then
                v80.fireAnalyticsEvent(v15.PaginatedFriendsCarouselLoadingTime, {
                    status = l_RetrievalStatus_0.Done.rawValue(), 
                    loadingTime = v87, 
                    nextPage = v88 ~= v16.AllFriends, 
                    fetch = v16.AllFriends
                });
            end;
        end, 
        onError = function(v89, v90) --[[ Line: 225 ]] --[[ Name: onError ]]
            -- upvalues: v80 (copy), v15 (ref), l_RetrievalStatus_0 (ref), v16 (ref)
            if v80.fireAnalyticsEvent then
                v80.fireAnalyticsEvent(v15.PaginatedFriendsCarouselLoadingTime, {
                    status = l_RetrievalStatus_0.Failed.rawValue(), 
                    loadingTime = v89, 
                    nextPage = v90 ~= v16.AllFriends, 
                    fetch = v16.AllFriends
                });
            end;
        end
    });
    l_useFetchTimeLogging_0({
        loading = v86.loading, 
        error = v86.error, 
        timerKey = v16.OnlineFriends, 
        onSuccess = function(v91) --[[ Line: 241 ]] --[[ Name: onSuccess ]]
            -- upvalues: v80 (copy), v15 (ref), l_RetrievalStatus_0 (ref), v16 (ref)
            if v80.fireAnalyticsEvent then
                v80.fireAnalyticsEvent(v15.PaginatedFriendsCarouselLoadingTime, {
                    status = l_RetrievalStatus_0.Done.rawValue(), 
                    loadingTime = v91, 
                    fetch = v16.OnlineFriends
                });
            end;
        end, 
        onError = function(v92) --[[ Line: 250 ]] --[[ Name: onError ]]
            -- upvalues: v80 (copy), v15 (ref), l_RetrievalStatus_0 (ref), v16 (ref)
            if v80.fireAnalyticsEvent then
                v80.fireAnalyticsEvent(v15.PaginatedFriendsCarouselLoadingTime, {
                    status = l_RetrievalStatus_0.Failed.rawValue(), 
                    loadingTime = v92, 
                    fetch = v16.OnlineFriends
                });
            end;
        end
    });
    local v93 = if v85.data then v85.data.allFriendsByUserId.nextCursor else nil;
    local v94 = if v85.data then v85.data.allFriendsByUserId.friends else nil;
    local v95 = v86.data and v86.data.onlineFriendsByUserId or {};
    local v97 = v2.useCallback(function() --[[ Line: 265 ]]
        -- upvalues: v93 (copy), v85 (copy), v25 (ref), v84 (copy), v83 (copy)
        if not v93 or v93 == "" or v85.loading then
            return;
        else
            v85:fetchMore({
                variables = {
                    pageCursor = v93, 
                    pageLimit = v25
                }
            }):andThen(function(v96) --[[ Line: 279 ]]
                -- upvalues: v84 (ref)
                v84.current = v96 and v96.errors;
            end);
            v83.current = v93;
            return;
        end;
    end, {
        v93, 
        v85.loading
    });
    local function v98() --[[ Line: 286 ]]
        -- upvalues: v86 (copy), v85 (copy), v83 (copy), v84 (copy)
        v86:refetch();
        v85:refetch();
        v83.current = nil;
        v84.current = nil;
    end;
    if not l_FFlagUnifyFriendshipEventHandling_0 or not l_FFlagUnifyPresenceEventHandling_0 then
        v2.useEffect(function() --[[ Line: 294 ]]
            -- upvalues: l_FFlagUnifyPresenceEventHandling_0 (ref), l_FriendsCarouselPresenceUpdateSignal_0 (ref), v67 (ref), v81 (copy), v79 (ref), v82 (copy), v86 (copy), v80 (copy), v15 (ref), l_FFlagUnifyFriendshipEventHandling_0 (ref), l_FriendsCarouselFriendshipUpdateSignal_0 (ref), v12 (ref)
            if not l_FFlagUnifyPresenceEventHandling_0 then
                l_FriendsCarouselPresenceUpdateSignal_0.Event:Connect(function(v99) --[[ Line: 296 ]]
                    -- upvalues: v67 (ref), v81 (ref), v79 (ref), v82 (ref), v86 (ref), v80 (ref), v15 (ref)
                    v67(v81, v99);
                    if v79(v81, v82, v99) > 0 then
                        v86:refetch();
                        if v80.fireAnalyticsEvent then
                            v80.fireAnalyticsEvent(v15.OnlineFriendsRefetchOnPresenceUpdate);
                        end;
                    end;
                end);
            end;
            if not l_FFlagUnifyFriendshipEventHandling_0 then
                l_FriendsCarouselFriendshipUpdateSignal_0.Event:Connect(function(v100) --[[ Line: 310 ]]
                    -- upvalues: v12 (ref), v81 (ref), v80 (ref), v86 (ref), v15 (ref)
                    if v100.removedUserId then
                        v12.Cache.removeFriendFromCache(v81, {
                            targetUserId = v80.userId, 
                            userId = v100.removedUserId
                        });
                        return;
                    else
                        if v100.addedUserId then
                            v86:refetch();
                            v12.Cache.addFriendToFriendsByUserIdCache(v81, {
                                targetUserId = v80.userId, 
                                userId = v100.addedUserId, 
                                hasVerifiedBadge = nil
                            });
                            if v80.fireAnalyticsEvent then
                                v80.fireAnalyticsEvent(v15.OnlineFriendsRefetchOnFriendshipUpdate);
                            end;
                        end;
                        return;
                    end;
                end);
            end;
            return function() --[[ Line: 332 ]]
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
    local v106, v107 = v2.useMemo(function() --[[ Line: 343 ]]
        -- upvalues: v62 (ref), l_FFlagFixNoUniverseIdPaginatedFriends_0 (ref), v95 (copy), v3 (ref), l_PresenceType_0 (ref), v94 (copy), v85 (copy), v86 (copy)
        local l_v62_0 = v62;
        local v102;
        if l_FFlagFixNoUniverseIdPaginatedFriends_0 then
            local l_v95_0 = v95;
            v102 = v3.List.map(l_v95_0, function(v104) --[[ Line: 92 ]]
                -- upvalues: l_PresenceType_0 (ref), v3 (ref)
                if v104.presence and v104.presence.userPresenceType == l_PresenceType_0.InGame and v104.presence.universeId == "" then
                    local v105 = v3.Dictionary.join(v104.presence, {
                        userPresenceType = l_PresenceType_0.Online
                    });
                    return v3.Dictionary.join(v104, {
                        presence = v105
                    });
                else
                    return v104;
                end;
            end);
        else
            v102 = v95;
        end;
        return l_v62_0(v102, v94, {
            friends = v85.loading, 
            onlineFriends = v86.loading
        });
    end, {
        v95, 
        v94, 
        v85.loading, 
        v86.loading
    });
    return {
        onlineFriends = v106, 
        offlineFriends = v107, 
        fetchMoreFriends = v97, 
        refetchCarouselData = v98
    };
end;