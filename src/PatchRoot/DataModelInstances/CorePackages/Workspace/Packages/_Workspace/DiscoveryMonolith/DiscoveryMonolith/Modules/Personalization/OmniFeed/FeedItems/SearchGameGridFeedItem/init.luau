local l_script_FirstAncestor_0 = script:FindFirstAncestor("DiscoveryMonolith");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.RoactServiceTags);
local l_RoactAnalyticsCommonGameEvents_0 = v3.RoactAnalyticsCommonGameEvents;
local l_RoactAnalytics_0 = v3.RoactAnalytics;
local l_AppEventIngestService_0 = v3.AppEventIngestService;
local v7 = require(l_Parent_0.ArgCheck);
local _ = require(l_Parent_0.AppCommonLib);
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_GameSortImpressionsDetector_0 = require(l_Parent_0.GameCollections).GameSortImpressionsDetector;
local l_SendGameImpressions_0 = require(l_Parent_0.GameCollections).SendGameImpressions;
local l_useRoactService_0 = require(l_Parent_0.RobloxAppHooks).useRoactService;
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local l_SearchTypes_0 = require(l_Parent_0.RobloxAppEnums).SearchTypes;
local v16 = require(l_Parent_0.DiscoveryAnalytics);
local l_gamePlayIntent_0 = v16.Events.gamePlayIntent;
local l_Context_0 = v16.Constants.Context;
local v19 = require(l_Parent_0.DiscoveryUtils);
local v20 = require(l_Parent_0.GameTile);
local l_GameTileConstants_0 = v20.GameTileConstants;
local l_GameTileExperimentation_0 = v20.GameTileExperimentation;
local l_LayoutConfig_0 = require(l_Parent_0.RobloxAppEnums).LayoutConfig;
local l_useResponsiveLayout_0 = require(l_Parent_0.UIBlox).Core.Layout.Responsive.useResponsiveLayout;
local l_Modules_0 = l_script_FirstAncestor_0.Modules;
local v26 = require(l_Modules_0.Personalization.OmniFeed.DataStore.ClearFeedItemRowData);
local v27 = require(l_Modules_0.Personalization.OmniFeed.DataStore.SetFeedItemRowData);
local v28 = require(l_Modules_0.Personalization.OmniFeed.useGridFlexFeedItemBounds);
local v29 = require(l_Modules_0.Personalization.OmniFeed.OmniFeedProps);
local v30 = require(l_Modules_0.LuaApp.Components.Games.GameGridSelector);
local v31 = require(l_Modules_0.LuaApp.getCurrentPage);
local v32 = require(l_Modules_0.Personalization.OmniFeed.getEntitiesForPartialFeedItem);
local v33 = require(l_Modules_0.LuaApp.Components.Search.SearchTypeSelection.SearchSelectionTypeHeader);
local v34 = require(l_Modules_0.LuaApp.Components.Search.getSearchItemsRowDataKey);
local l_FFlagLuaAppMigrateGameTile_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppMigrateGameTile;
local l_FFlagLuaAppMigrateGameTileIxp_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppMigrateGameTileIxp;
return function(v37) --[[ Line: 60 ]]
    -- upvalues: v29 (copy), l_useDispatch_0 (copy), l_useRoactService_0 (copy), l_RoactAnalyticsCommonGameEvents_0 (copy), l_RoactAnalytics_0 (copy), l_AppEventIngestService_0 (copy), v2 (copy), l_useSelector_0 (copy), v31 (copy), v19 (copy), l_LayoutConfig_0 (copy), l_useResponsiveLayout_0 (copy), v28 (copy), v7 (copy), v32 (copy), v34 (copy), v27 (copy), v26 (copy), l_gamePlayIntent_0 (copy), l_Context_0 (copy), l_SendGameImpressions_0 (copy), l_AppPage_0 (copy), l_FFlagLuaAppMigrateGameTile_0 (copy), l_FFlagLuaAppMigrateGameTileIxp_0 (copy), l_GameTileExperimentation_0 (copy), l_GameTileConstants_0 (copy), v33 (copy), l_SearchTypes_0 (copy), v30 (copy), l_GameSortImpressionsDetector_0 (copy)
    local l_searchUuid_0 = v37.searchUuid;
    local l_feedItemPosition_0 = v37[v29.key].feedItemPosition;
    local v40 = l_useDispatch_0();
    local v41 = l_useRoactService_0(l_RoactAnalyticsCommonGameEvents_0);
    local v42 = l_useRoactService_0(l_RoactAnalytics_0);
    local v43 = l_useRoactService_0(l_AppEventIngestService_0);
    local v44 = v2.useRef(nil);
    local v45 = "SearchResults" .. tostring(l_searchUuid_0);
    local v47 = l_useSelector_0(function(v46) --[[ Line: 70 ]]
        -- upvalues: l_searchUuid_0 (copy)
        return v46.Search.SearchesInGames[l_searchUuid_0];
    end);
    local v49 = l_useSelector_0(function(v48) --[[ Line: 73 ]]
        -- upvalues: v31 (ref)
        return v31(v48);
    end);
    local v51 = l_useSelector_0(function(v50) --[[ Line: 76 ]]
        return v50.ScreenSize;
    end);
    local v52 = v19.getPageSideMargin(v51.X);
    local v53, v54 = v2.useState(v51);
    local v55, v56 = v2.useState(Vector2.new(v51.X - 2 * v52, v51.Y));
    local function v61(v57) --[[ Line: 84 ]]
        -- upvalues: v37 (copy)
        local v58 = {};
        for _, v60 in ipairs(v57) do
            if v60.topicId == v37.topicId then
                table.insert(v58, v60);
            end;
        end;
        return v58;
    end;
    local v62 = v2.useMemo(function() --[[ Line: 94 ]]
        -- upvalues: v47 (copy), v61 (copy)
        return v47 and v61(v47.entries) or {};
    end, {
        v47
    });
    local v63, v64 = v2.useState(v62);
    v2.useEffect(function() --[[ Line: 100 ]]
        -- upvalues: v64 (copy), v62 (copy)
        v64(v62);
    end, {
        v62
    });
    local function v67(v65) --[[ Line: 104 ]]
        -- upvalues: v55 (copy), v56 (copy)
        if v65 then
            local l_AbsoluteContentSize_0 = v65.AbsoluteContentSize;
            if v55.X == l_AbsoluteContentSize_0.X and v55.Y == l_AbsoluteContentSize_0.Y then
                return;
            elseif l_AbsoluteContentSize_0.X > 0 and l_AbsoluteContentSize_0.Y > 0 then
                v56(l_AbsoluteContentSize_0);
            end;
        end;
    end;
    local function v69(v68) --[[ Line: 117 ]]
        -- upvalues: v54 (copy)
        if v68 then
            v54(v68.AbsoluteSize);
        end;
    end;
    local v70 = v53.X and v19.getPageSideMargin(v53.X);
    local v71 = v37.topicLayoutData or {};
    local l_WithFooter_0 = l_LayoutConfig_0.Kind.Experiences.WithFooter;
    local v73 = l_useResponsiveLayout_0("columns", l_WithFooter_0) or 1;
    local v74, v75 = v2.useState(v73);
    local function v77(v76) --[[ Line: 130 ]]
        -- upvalues: v75 (copy)
        v75(v76);
    end;
    local v78 = if v71.numOfRows and v71.numOfRows >= 0 then v71.numOfRows else 1e999;
    local v79 = ("%*_%*"):format(v37.topicId, l_searchUuid_0);
    local v80 = v28(v79, l_feedItemPosition_0, v74, v78) or {};
    local v81 = v47 and v47.emphasis or false;
    local v82 = false;
    if v80.firstIndex == 1 then
        v82 = v81;
    end;
    if v82 then
        v7.assert(v78 >= 2, "feed item with emphasis takes at least 2 rows");
    end;
    local v83 = v2.useMemo(function() --[[ Line: 149 ]]
        -- upvalues: v32 (ref), v63 (copy), v80 (copy), v81 (copy), v74 (copy)
        return v32(v63, v80, v81, v74);
    end, {
        v63, 
        v80, 
        v81, 
        v74
    });
    local l_showHeader_0 = v71.showHeader;
    local v85 = if #v83 > 0 then v83[#v83].uiIndex else 0;
    local v86 = if v85 and v74 and v74 > 0 then math.ceil(v85 / v74) else 0;
    local v87 = if not (v78 and v78 >= 0) or v86 < v78 then v86 else v78;
    local v88 = v34(v37.searchUuid);
    v2.useEffect(function() --[[ Line: 172 ]]
        -- upvalues: v40 (copy), v27 (ref), v88 (copy), l_feedItemPosition_0 (copy), v87 (copy), v26 (ref)
        v40(v27(v88, l_feedItemPosition_0, v87));
        return function() --[[ Line: 174 ]]
            -- upvalues: v40 (ref), v26 (ref), v88 (ref), l_feedItemPosition_0 (ref)
            v40(v26(v88, l_feedItemPosition_0));
        end;
    end, {
        v88, 
        l_feedItemPosition_0, 
        v87
    });
    local v91 = l_useSelector_0(function(v89) --[[ Line: 179 ]]
        -- upvalues: v88 (copy), l_feedItemPosition_0 (copy)
        local v90 = v89.Personalization.OmniItemsRowData[v88] or {};
        if l_feedItemPosition_0 then
            return v90[l_feedItemPosition_0];
        else
            return {};
        end;
    end);
    local v92 = v91 and v91.startRowNumber or nil;
    local v95 = v2.useCallback(function(v93) --[[ Line: 186 ]]
        -- upvalues: v92 (copy), v74 (copy)
        if not v93 or not v92 or not v74 or v74 <= 0 then
            return nil;
        else
            local v94 = math.ceil(v93 / v74);
            return v92 + v94 - 1;
        end;
    end, {
        v74, 
        v92
    });
    local function v104(v96) --[[ Line: 195 ]]
        -- upvalues: v83 (copy), v95 (copy), v41 (copy), v49 (copy), l_feedItemPosition_0 (copy), v37 (copy)
        local v97 = v83[v96];
        local v98 = v95(v97.uiIndex or v96);
        if v97 ~= nil then
            local l_placeId_0 = v97.placeId;
            local l_isSponsored_0 = v97.isSponsored;
            local v101 = #v83;
            local l_universeId_0 = v97.universeId;
            local v103 = v97.topicContentsIndex or v96;
            v41.reportOpenGameDetailFromSearch(l_placeId_0, v96, v101, l_isSponsored_0, l_universeId_0, v49, l_feedItemPosition_0, v37.topicId, v98, v103);
        end;
    end;
    local function v108(v105) --[[ Line: 222 ]]
        -- upvalues: v95 (copy), l_gamePlayIntent_0 (ref), v43 (copy), l_Context_0 (ref), l_feedItemPosition_0 (copy), v37 (copy)
        local v106 = v95(v105.uiIndex or v105.index);
        local v107 = v105.topicContentsIndex or v105.index;
        l_gamePlayIntent_0(v43, l_Context_0.SearchExperienceTile, {
            placeId = v105.placeId, 
            rootPlaceId = tonumber(v105.placeId), 
            sortEntryIndex = tostring(v105.index), 
            sortIndex = l_feedItemPosition_0, 
            gameSetTypeId = v37.topicId, 
            rowOnPage = v106, 
            topicDataPosition = v107
        });
    end;
    local function v111(v109) --[[ Line: 237 ]]
        -- upvalues: v47 (copy), l_searchUuid_0 (copy), v82 (copy), l_feedItemPosition_0 (copy), v37 (copy), l_SendGameImpressions_0 (ref), v43 (copy), v42 (copy), v83 (copy), l_AppPage_0 (ref), v74 (copy), v92 (copy)
        if not v47 then
            return;
        else
            local v110 = {
                searchUuid = l_searchUuid_0, 
                emphasisFlag = v82 and 1 or 0, 
                seeAllFlag = 1, 
                sortPos = l_feedItemPosition_0, 
                gameSetTypeId = v37.topicId
            };
            l_SendGameImpressions_0.sendFromSearch(v43, v42, v109, v83, l_AppPage_0.SearchPage, v110, v74, v92);
            return;
        end;
    end;
    local v112 = l_FFlagLuaAppMigrateGameTile_0 and not l_FFlagLuaAppMigrateGameTileIxp_0 or l_FFlagLuaAppMigrateGameTileIxp_0 and l_GameTileExperimentation_0.getIsTileMigrationEnabled();
    local v113 = nil;
    if v112 then
        v113 = l_GameTileConstants_0.PlayerCountStyleValues.Footer;
    end;
    return v2.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, 0), 
        Position = UDim2.new(0, 0, 0, 0), 
        AutomaticSize = Enum.AutomaticSize.Y, 
        BackgroundTransparency = 1, 
        [v2.Change.AbsoluteSize] = v69, 
        ref = v44
    }, {
        Layout = v2.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Padding = UDim.new(0, 16), 
            [v2.Change.AbsoluteContentSize] = v67
        }), 
        Padding = v2.createElement("UIPadding", {
            PaddingLeft = UDim.new(0, v70), 
            PaddingRight = UDim.new(0, v70)
        }), 
        Header = if l_showHeader_0 then v2.createElement(v33, {
            LayoutOrder = 1, 
            selectionType = l_SearchTypes_0.Games
        }) else nil, 
        GameGrid = v2.createElement(v30, {
            LayoutOrder = 2, 
            entries = v83, 
            source = "SearchResults", 
            reportGameDetailOpened = v104, 
            horizontalAlignment = Enum.HorizontalAlignment.Left, 
            windowSize = Vector2.new(v55.X, v53.Y), 
            screenSize = v51, 
            searchResultGrid = true, 
            gameEmphasis = v82, 
            currentSidePadding = v70, 
            scrollViewPositionChangedSignal = v37[v29.key].scrollViewPositionChangedSignal, 
            impressionsTag = v45, 
            reportExperienceLaunched = v108, 
            launchExperienceEventContext = l_Context_0.SearchExperienceTile, 
            onItemsPerRowChanged = v77, 
            playerCountStyle = if l_FFlagLuaAppMigrateGameTile_0 then v113 else nil, 
            isUnifiedGameTile = if l_FFlagLuaAppMigrateGameTile_0 then v112 else nil
        }), 
        GameSortImpressionsDetector = v2.createElement(l_GameSortImpressionsDetector_0, {
            parentRef = v44, 
            pageContext = l_AppPage_0.SearchPage, 
            impressionsTag = v45, 
            scrollViewPositionChangedSignal = v37[v29.key].scrollViewPositionChangedSignal, 
            sendGameImpressions = v111
        })
    });
end;