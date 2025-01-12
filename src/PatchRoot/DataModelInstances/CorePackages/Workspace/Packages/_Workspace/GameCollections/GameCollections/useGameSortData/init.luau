local l_Parent_0 = script:FindFirstAncestor("GameCollections").Parent;
local l_RetrievalStatus_0 = require(l_Parent_0.Http).Enum.RetrievalStatus;
local v2 = require(l_Parent_0.tutils);
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local l_memoize_0 = require(l_Parent_0.AppCommonLib).memoize;
local l_TopicInfosReducer_0 = require(l_Parent_0.TopicInfosRodux).TopicInfosReducer;
local l_GameSortGroups_0 = require(l_Parent_0.DiscoveryTypes).GameSortGroups;
local v8 = require(l_Parent_0.FetchStatusRodux);
local l_FetchStatusReducer_0 = v8.FetchStatusReducer;
local l_FetchStatusNamespace_0 = v8.FetchStatusNamespace;
local l_TopicContentsReducer_0 = require(l_Parent_0.TopicContentsRodux).TopicContentsReducer;
local v16 = l_memoize_0(function(v12) --[[ Line: 32 ]]
    local v13 = {};
    if v12 and v12.sorts then
        for v14, v15 in ipairs(v12.sorts) do
            if v15.topicId then
                v13[tostring(v15.topicId)] = v14;
            end;
        end;
    end;
    return v13;
end);
return function(v17, v18) --[[ Line: 47 ]] --[[ Name: useGameSortData ]]
    -- upvalues: l_useSelector_0 (copy), l_TopicInfosReducer_0 (copy), l_AppPage_0 (copy), v16 (copy), l_GameSortGroups_0 (copy), l_TopicContentsReducer_0 (copy), l_FetchStatusNamespace_0 (copy), l_FetchStatusReducer_0 (copy), l_RetrievalStatus_0 (copy), v2 (copy)
    return l_useSelector_0(function(v19) --[[ Line: 48 ]]
        -- upvalues: l_TopicInfosReducer_0 (ref), v17 (copy), v18 (copy), l_AppPage_0 (ref), v16 (ref), l_GameSortGroups_0 (ref), l_TopicContentsReducer_0 (ref), l_FetchStatusNamespace_0 (ref), l_FetchStatusReducer_0 (ref), l_RetrievalStatus_0 (ref)
        local v20 = false;
        local v21 = false;
        local v22 = nil;
        local v23 = nil;
        local v24 = v19.Personalization[l_TopicInfosReducer_0.key][v17];
        if v24 ~= nil then
            if v24:isOmni() then
                if v18 == l_AppPage_0.Home then
                    local v25 = v19.OmniRecommendations[v18];
                    local v26 = v16(v25)[v17];
                    if v26 then
                        v20 = true;
                        v21 = true;
                        v22 = v26;
                    end;
                end;
            else
                v20 = true;
                local v27 = nil;
                if v18 == l_AppPage_0.Games then
                    v27 = l_GameSortGroups_0.Games;
                elseif v18 == l_AppPage_0.Home then
                    v27 = l_GameSortGroups_0.HomeGames;
                end;
                v23 = if v27 then v19.GameSortGroups[v27].pageId else nil;
            end;
        end;
        local v28 = v19.Personalization[l_TopicContentsReducer_0.key][v17];
        local v29 = v19.Personalization[l_TopicInfosReducer_0.key][v17];
        local v30 = nil;
        local v31 = nil;
        if v21 then
            v30 = l_FetchStatusNamespace_0.OmniRecommendations;
            v31 = v18;
        else
            v30 = l_FetchStatusNamespace_0.GameSorts;
            v31 = v17;
        end;
        local v32 = v19.Personalization[l_FetchStatusReducer_0.key][v30][v31];
        return {
            sortIndex = v22, 
            isOmni = v21, 
            gameSortDataFound = v20, 
            gamesApiSortPageId = v23, 
            sort = v29, 
            gameSortContents = v28, 
            gameSortFetchingStatus = v32 or l_RetrievalStatus_0.NotStarted
        };
    end, v2.shallowEqual);
end;