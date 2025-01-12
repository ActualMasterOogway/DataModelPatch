local l_script_FirstAncestor_0 = script:FindFirstAncestor("DiscoveryMonolith");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.GameFilters);
local l_GameFilterCarousel_0 = v3.GameFilterCarousel;
local l_useGameFiltersSelector_0 = v3.DataStore.useGameFiltersSelector;
local l_useGameFilterAnalyticsInfo_0 = v3.useGameFilterAnalyticsInfo;
local l_GameSortGroups_0 = require(l_Parent_0.DiscoveryTypes).GameSortGroups;
local l_RoactNetworking_0 = require(l_Parent_0.RoactServiceTags).RoactNetworking;
local l_RoactAnalytics_0 = require(l_Parent_0.RoactServiceTags).RoactAnalytics;
local l_dependencyArray_0 = require(l_Parent_0.RoactUtils).Hooks.dependencyArray;
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useRoactService_0 = require(l_Parent_0.RobloxAppHooks).useRoactService;
local l_Modules_0 = l_script_FirstAncestor_0.Modules;
local v14 = require(l_Modules_0.Personalization.OmniFeed.OmniFeedProps);
local v15 = require(l_Modules_0.LuaApp.Thunks.FetchGamesPageData);
local v16 = require(l_Modules_0.Personalization.OmniFeed.useGameFiltersFeedItemSideMargin);
local l_Games_0 = l_GameSortGroups_0.Games;
return function(v18) --[[ Line: 31 ]] --[[ Name: GameFiltersFeedItem ]]
    -- upvalues: v14 (copy), l_useGameFiltersSelector_0 (copy), l_Games_0 (copy), l_useGameFilterAnalyticsInfo_0 (copy), v2 (copy), v16 (copy), l_useDispatch_0 (copy), l_useRoactService_0 (copy), l_RoactNetworking_0 (copy), l_RoactAnalytics_0 (copy), v15 (copy), l_dependencyArray_0 (copy), l_GameFilterCarousel_0 (copy)
    local v19 = v18[v14.key];
    local v20 = l_useGameFiltersSelector_0(l_Games_0);
    local v21 = l_useGameFilterAnalyticsInfo_0(v18.gameSortId, v18.sortIndex);
    local v22 = v2.useRef(nil);
    local v23 = v16(v22.current);
    local v24 = l_useDispatch_0();
    local v25 = l_useRoactService_0(l_RoactNetworking_0);
    local v26 = l_useRoactService_0(l_RoactAnalytics_0);
    local v30 = v2.useCallback(function(v27, v28) --[[ Line: 44 ]]
        -- upvalues: v24 (copy), v15 (ref), v25 (copy), v26 (copy)
        local v29 = {
            [v27] = v28
        };
        return v24(v15(v25, v26, nil, v29));
    end, l_dependencyArray_0(v25, v26));
    if v20 and #v20.allFilters > 0 then
        return v2.createElement(l_GameFilterCarousel_0, {
            title = v18.topicName, 
            filters = v20.allFilters, 
            sideMargin = v23, 
            sortIndex = v18.sortIndex, 
            onFilterApplied = v30, 
            containerRef = v22, 
            pageContext = v19.appPage, 
            dataUpdatedTimestamp = v20.updatedTimestamp, 
            analyticsInfo = v21, 
            scrollViewPositionChangedSignal = v19.scrollViewPositionChangedSignal
        });
    else
        return nil;
    end;
end;