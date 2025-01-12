local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsCommon");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Cryo);
local v4 = require(l_Parent_0.ApolloClient);
local l_useQuery_0 = v4.useQuery;
local l_useApolloClient_0 = v4.useApolloClient;
local l_queries_0 = require(l_Parent_0.ApolloLocalState).queries;
local v8 = require(l_Parent_0.ApolloFriends);
local v9 = require(l_Parent_0.ApolloPresence);
local l_PresenceType_0 = require(l_Parent_0.GraphQLServer).types.PresenceType;
local l_FriendsCommonPresenceUpdateSignal_0 = require(l_script_FirstAncestor_0.Signals).FriendsCommonPresenceUpdateSignal;
local l_FFlagFixNoUniverseIdPaginatedFriends_0 = require(l_Parent_0.SharedFlags).FFlagFixNoUniverseIdPaginatedFriends;
local v13 = game:DefineFastInt("FriendsListDefaultPageSize", 12);
local function _(v14) --[[ Line: 38 ]]
    -- upvalues: v3 (copy), l_PresenceType_0 (copy)
    return v3.List.map(v14, function(v15) --[[ Line: 39 ]]
        -- upvalues: l_PresenceType_0 (ref), v3 (ref)
        if v15.presence and v15.presence.userPresenceType == l_PresenceType_0.InGame and v15.presence.universeId == "" then
            local v16 = v3.Dictionary.join(v15.presence, {
                userPresenceType = l_PresenceType_0.Online
            });
            return v3.Dictionary.join(v15, {
                presence = v16
            });
        else
            return v15;
        end;
    end);
end;
local function v29(v18, v19) --[[ Line: 52 ]]
    -- upvalues: l_PresenceType_0 (copy), v3 (copy)
    local v20 = {};
    local v21 = {};
    local v22 = {};
    local v23 = {};
    for _, v25 in v18 do
        local v26 = if v25.presence then v25.presence.userPresenceType else l_PresenceType_0.Offline;
        if v26 == l_PresenceType_0.InGame then
            table.insert(v21, v25);
        elseif v26 == l_PresenceType_0.InStudio then
            table.insert(v22, v25);
        else
            table.insert(v23, v25);
        end;
        v20[v25.id] = v25.presence;
    end;
    local v28 = v3.List.filter(v19 or {}, function(v27) --[[ Line: 73 ]]
        -- upvalues: v20 (copy)
        return not v20[v27.id];
    end);
    return v3.List.join(v21, v23, v22), v28;
end;
local function v41(v30, v31, v32) --[[ Line: 82 ]] --[[ Name: shouldRefetchOnlineFriends ]]
    -- upvalues: l_queries_0 (copy), v3 (copy), v9 (copy), l_PresenceType_0 (copy)
    local v33 = v30:readQuery({
        query = l_queries_0.onlineFriendsByUserId, 
        variables = v31
    });
    local v34 = if v33 then v33.onlineFriendsByUserId else {};
    local v35 = {};
    local v36 = v34 or {};
    for _, v38 in v36 do
        v35[v38.id] = v38.presence;
    end;
    return #v3.List.filter(v32, function(v39) --[[ Line: 95 ]]
        -- upvalues: v9 (ref), l_PresenceType_0 (ref), v35 (copy)
        local v40 = false;
        if v9.Formatters.formatNumberToPresenceType(v39.userPresenceType) ~= l_PresenceType_0.Offline then
            v40 = not v35[tostring(v39.userId)];
        end;
        return v40;
    end) > 0;
end;
local function v46(v42, v43) --[[ Line: 103 ]] --[[ Name: bulkUpdateUserPresences ]]
    -- upvalues: v9 (copy)
    for _, v45 in v43 do
        v9.Mutations.createUserPresenceCache(v42, {
            id = v45.userId, 
            userPresenceNumber = v45.userPresenceType, 
            lastLocation = v45.lastLocation, 
            lastOnline = v45.lastOnline, 
            gameId = v45.gameId, 
            placeId = v45.placeId, 
            rootPlaceId = v45.rootPlaceId, 
            universeId = v45.universeId
        });
    end;
end;
return function(v47) --[[ Line: 118 ]] --[[ Name: useFriendsListOrderedByPresence ]]
    -- upvalues: l_useApolloClient_0 (copy), v13 (copy), v8 (copy), v2 (copy), l_useQuery_0 (copy), l_queries_0 (copy), v3 (copy), l_FriendsCommonPresenceUpdateSignal_0 (copy), v46 (copy), v41 (copy), v29 (copy), l_FFlagFixNoUniverseIdPaginatedFriends_0 (copy), l_PresenceType_0 (copy)
    local v48 = l_useApolloClient_0();
    local v49 = v47.pageSize or v13;
    local v50 = {
        userId = v47.userId, 
        sort = v8.Enums.Sort.FriendshipScore
    };
    local v51 = v2.useRef(nil);
    local v52 = v2.useRef(nil);
    local v53 = l_useQuery_0(l_queries_0.allFriendsByUserId, {
        errorPolicy = "all", 
        skip = false, 
        notifyOnNetworkStatusChange = true, 
        variables = v3.Dictionary.join(v50, {
            pageLimit = v49, 
            pageCursor = ""
        })
    });
    local v54 = l_useQuery_0(l_queries_0.onlineFriendsByUserId, {
        skip = false, 
        notifyOnNetworkStatusChange = true, 
        variables = v50
    });
    local v55 = if v53.data then v53.data.allFriendsByUserId.nextCursor else nil;
    local v56 = if v53.data then v53.data.allFriendsByUserId.friends else nil;
    local v57 = v54.data and v54.data.onlineFriendsByUserId or {};
    local v59 = v2.useCallback(function() --[[ Line: 157 ]]
        -- upvalues: v55 (copy), v53 (copy), v49 (copy), v52 (copy), v51 (copy)
        if not v55 or v55 == "" or v53.loading then
            return;
        else
            v53:fetchMore({
                variables = {
                    pageCursor = v55, 
                    pageLimit = v49
                }
            }):andThen(function(v58) --[[ Line: 171 ]]
                -- upvalues: v52 (ref)
                v52.current = v58 and v58.errors;
            end);
            v51.current = v55;
            return;
        end;
    end, {
        v55, 
        v53.loading
    });
    local function v60() --[[ Line: 178 ]]
        -- upvalues: v54 (copy), v53 (copy), v51 (copy), v52 (copy)
        v54:refetch();
        v53:refetch();
        v51.current = nil;
        v52.current = nil;
    end;
    v2.useEffect(function() --[[ Line: 185 ]]
        -- upvalues: l_FriendsCommonPresenceUpdateSignal_0 (ref), v46 (ref), v48 (copy), v41 (ref), v50 (copy), v54 (copy)
        l_FriendsCommonPresenceUpdateSignal_0.Event:Connect(function(v61) --[[ Line: 186 ]]
            -- upvalues: v46 (ref), v48 (ref), v41 (ref), v50 (ref), v54 (ref)
            v46(v48, v61);
            if v41(v48, v50, v61) then
                v54:refetch();
            end;
        end);
        return function() --[[ Line: 193 ]]
            -- upvalues: l_FriendsCommonPresenceUpdateSignal_0 (ref)
            l_FriendsCommonPresenceUpdateSignal_0:Destroy();
        end;
    end, {});
    local v67, v68 = v2.useMemo(function() --[[ Line: 198 ]]
        -- upvalues: v29 (ref), l_FFlagFixNoUniverseIdPaginatedFriends_0 (ref), v57 (copy), v3 (ref), l_PresenceType_0 (ref), v56 (copy)
        local l_v29_0 = v29;
        local v63;
        if l_FFlagFixNoUniverseIdPaginatedFriends_0 then
            local l_v57_0 = v57;
            v63 = v3.List.map(l_v57_0, function(v65) --[[ Line: 39 ]]
                -- upvalues: l_PresenceType_0 (ref), v3 (ref)
                if v65.presence and v65.presence.userPresenceType == l_PresenceType_0.InGame and v65.presence.universeId == "" then
                    local v66 = v3.Dictionary.join(v65.presence, {
                        userPresenceType = l_PresenceType_0.Online
                    });
                    return v3.Dictionary.join(v65, {
                        presence = v66
                    });
                else
                    return v65;
                end;
            end);
        else
            v63 = v57;
        end;
        return l_v29_0(v63, v56);
    end, {
        v57, 
        v56
    });
    local v69 = not v55 or v55 == "";
    return {
        onlineFriends = v67, 
        offlineFriends = v68, 
        fetchMoreFriends = v59, 
        refreshFriendsData = v60, 
        isEndOfList = v69
    };
end;