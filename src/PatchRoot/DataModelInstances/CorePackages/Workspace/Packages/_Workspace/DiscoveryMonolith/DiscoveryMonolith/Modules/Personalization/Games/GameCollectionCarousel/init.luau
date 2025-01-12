local l_script_FirstAncestor_0 = script:FindFirstAncestor("DiscoveryMonolith");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.t);
local l_validateProps_0 = require(l_Parent_0.DiscoveryUtils).validateProps;
local _ = require(l_Parent_0.DiscoveryTypes);
local l_GameTileConstants_0 = require(l_Parent_0.GameTile).GameTileConstants;
local _ = require(l_Parent_0.AppCommonLib);
local v8 = require(l_Parent_0.Responsive);
local l_usePreferredInput_0 = v8.usePreferredInput;
local l_useAppPolicy_0 = require(l_Parent_0.UniversalAppPolicy).useAppPolicy;
local l_CollectionCarousel_0 = require(l_Parent_0.CollectionViews).CollectionCarousel;
local v12 = require(l_Parent_0.GameCollections);
local l_useCountdownSubtitleTextBinding_0 = v12.useCountdownSubtitleTextBinding;
local l_useGetGameTileHeight_0 = v12.useGetGameTileHeight;
local l_useRenderGameCollectionItem_0 = v12.useRenderGameCollectionItem;
local l_useGameCollectionLayoutParams_0 = v12.useGameCollectionLayoutParams;
local l_isSeeAllTileEnabled_0 = v12.isSeeAllTileEnabled;
local l_useGameSortHeaderButtonParams_0 = v12.useGameSortHeaderButtonParams;
local l_useIsHoldToPlayEnabledForGames_0 = v12.useIsHoldToPlayEnabledForGames;
local v20 = require(l_Parent_0.DiscoveryAnalytics);
local l_useControllerBarFocusNavigationBindings_0 = v12.GameCollectionNavigationBindings.useControllerBarFocusNavigationBindings;
local l_useGameSortAnalytics_0 = v12.useGameSortAnalytics;
local l_GameSortImpressionsDetector_0 = v12.GameSortImpressionsDetector;
local l_useGameSortData_0 = v12.useGameSortData;
local l_useGameSortImpressionsParams_0 = v12.useGameSortImpressionsParams;
local l_useGameSortTooltipParams_0 = v12.useGameSortTooltipParams;
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local l_ScrollDetector_0 = require(l_Parent_0.ScrollTelemetry).ScrollDetector;
local l_FrameBoundsImpressionsTracker_0 = require(l_Parent_0.Impressions).FrameBoundsImpressionsTracker;
local l_ScreenSizeImpressionsTracker_0 = require(l_Parent_0.Impressions).ScreenSizeImpressionsTracker;
local l_HoldToPlayLauncher_0 = require(l_Parent_0.HoldToPlay).HoldToPlayLauncher;
local l_useHoldToPlayStateAndCallbacks_0 = require(l_Parent_0.HoldToPlay).useHoldToPlayStateAndCallbacks;
local l_useTextSizeOffset_0 = require(l_Parent_0.UIBlox).Core.Style.useTextSizeOffset;
local l_HoverTileCoordinator_0 = require(l_Parent_0.GameTile).HoverTileCoordinator;
local l_Modules_0 = l_script_FirstAncestor_0.Modules;
local v36 = require(l_Modules_0.Personalization.Games.useLoadGamesForSortFromGamesApi);
local v37 = require(l_Modules_0.Personalization.Games.useLoadMoreGames);
local v38 = require(l_Parent_0.SharedFlags);
local l_FFlagLuaAppHeaderButtonText_0 = v38.FFlagLuaAppHeaderButtonText;
local l_FFlagSearchOmniAutocompletePage_0 = v38.FFlagSearchOmniAutocompletePage;
local l_FFlagLuaAppMigrateGameTile_0 = v38.FFlagLuaAppMigrateGameTile;
local l_FFlagEnableChartsSubtitleLink_0 = v38.FFlagEnableChartsSubtitleLink;
local v43 = v3.strictInterface({
    useGridTiles = v3.optional(v3.boolean), 
    gameSortId = v3.string, 
    sortIndex = v3.number, 
    pageContext = v3.string, 
    scrollViewPositionChangedSignal = v3.optional(v3.table), 
    friendFooterEnabled = v3.optional(v3.boolean), 
    playerCountStyle = v3.optional(v3.string), 
    isSponsoredFooterAllowed = v3.optional(v3.boolean), 
    componentType = v3.optional(v3.string), 
    hideSeeAll = v3.optional(v3.boolean), 
    gameTileLayoutType = v3.optional(v3.string), 
    infoText = v3.optional(v3.string), 
    endTimestamp = v3.optional(v3.number), 
    countdownString = v3.optional(v3.string), 
    linkPath = v3.optional(v3.string), 
    subtitleLinkPath = v3.optional(v3.string), 
    gridSupportAllowed = v3.optional(v3.boolean), 
    isHoverSupportEnabled = v3.optional(v3.boolean), 
    itemRowData = v3.optional(v3.table), 
    playButtonStyle = v3.optional(v3.string), 
    sideMargin = v3.optional(v3.number), 
    backgroundMuralUrl = v3.optional(v3.string), 
    headerButtonText = if l_FFlagLuaAppHeaderButtonText_0 then v3.optional(v3.string) else nil, 
    shouldHideTileMetadata = v3.optional(v3.boolean), 
    shouldHideTileTitle = v3.optional(v3.boolean), 
    containedTile = v3.optional(v3.boolean), 
    shouldUseFrameBoundsForImpressions = if l_FFlagSearchOmniAutocompletePage_0 then v3.optional(v3.boolean) else nil, 
    layoutOverrides = if l_FFlagSearchOmniAutocompletePage_0 then v3.optional(v3.table) else nil
});
return v2.memo(function(v44) --[[ Line: 121 ]] --[[ Name: GameCollectionCarousel ]]
    -- upvalues: l_validateProps_0 (copy), v43 (copy), l_useAppPolicy_0 (copy), l_usePreferredInput_0 (copy), v8 (copy), v2 (copy), l_useGameSortData_0 (copy), v36 (copy), v37 (copy), l_useGameSortAnalytics_0 (copy), l_useGameSortHeaderButtonParams_0 (copy), l_FFlagEnableChartsSubtitleLink_0 (copy), l_FFlagLuaAppHeaderButtonText_0 (copy), l_useGameSortTooltipParams_0 (copy), l_useGameSortImpressionsParams_0 (copy), l_useIsHoldToPlayEnabledForGames_0 (copy), l_useHoldToPlayStateAndCallbacks_0 (copy), l_useControllerBarFocusNavigationBindings_0 (copy), l_FFlagSearchOmniAutocompletePage_0 (copy), l_useGameCollectionLayoutParams_0 (copy), l_FFlagLuaAppMigrateGameTile_0 (copy), l_GameTileConstants_0 (copy), l_useTextSizeOffset_0 (copy), l_useGetGameTileHeight_0 (copy), l_isSeeAllTileEnabled_0 (copy), l_useRenderGameCollectionItem_0 (copy), l_AppPage_0 (copy), v20 (copy), l_useCountdownSubtitleTextBinding_0 (copy), l_HoverTileCoordinator_0 (copy), l_CollectionCarousel_0 (copy), l_FrameBoundsImpressionsTracker_0 (copy), l_ScreenSizeImpressionsTracker_0 (copy), l_GameSortImpressionsDetector_0 (copy), l_ScrollDetector_0 (copy), l_HoldToPlayLauncher_0 (copy)
    l_validateProps_0(v43, v44);
    local v46 = l_useAppPolicy_0(function(v45) --[[ Line: 125 ]]
        return v45.useGridPageLayout();
    end);
    local v47 = l_usePreferredInput_0();
    local v48 = v44.isHoverSupportEnabled and v46 and v47 == v8.Input.Pointer;
    local v49 = v44.gameTileLayoutType or "Narrow";
    local v50, v51 = v2.useState(nil);
    v2.useRef(v50).current = v50;
    local v52 = v2.useRef(nil);
    local v53 = l_useGameSortData_0(v44.gameSortId, v44.pageContext);
    local v54 = v53.gameSortContents and v53.gameSortContents.entries or {};
    local v55 = v36(v44.gameSortId);
    v2.useEffect(function() --[[ Line: 150 ]]
        -- upvalues: v53 (copy), v55 (copy)
        if not v53.isOmni then
            v55();
        end;
    end, {
        v44.gameSortId, 
        v53.isOmni
    });
    local v56 = v37(v53.gameSortContents, v53.sort, v53.gameSortFetchingStatus, v53.isOmni, v44.pageContext, v53.sortIndex);
    local v57, v58, v59, v60 = l_useGameSortAnalytics_0(v53.sort, v53.isOmni, v44.sortIndex, v44.pageContext, v52, v54);
    local v61, v62, v63 = l_useGameSortHeaderButtonParams_0(v59, v53.sort, v53.isOmni, v53.sortIndex, v53.gamesApiSortPageId, v44.gameSortId, v44.pageContext, v44.linkPath, if l_FFlagEnableChartsSubtitleLink_0 then v44.subtitleLinkPath else nil, if l_FFlagLuaAppHeaderButtonText_0 then v44.headerButtonText else nil);
    local v64, v65 = l_useGameSortTooltipParams_0(v53.sort, v53.isOmni, v44.infoText);
    local v66, v67, v68 = l_useGameSortImpressionsParams_0(v53.sort, v53.isOmni, v44.sortIndex, v44.pageContext, v44.useGridTiles, v44.componentType, v53.gamesApiSortPageId, v44.gameSortId, v44.scrollViewPositionChangedSignal, nil, v44.itemRowData, v54);
    local v69 = ("GameCarousel_%*%*"):format(v44.gameSortId, v44.sortIndex);
    local v70 = l_useIsHoldToPlayEnabledForGames_0();
    local v71 = l_useHoldToPlayStateAndCallbacks_0();
    local v72 = l_useControllerBarFocusNavigationBindings_0(v61, if v70 then v71.holdToPlayEventHandler else nil);
    v2.useEffect(function() --[[ Line: 217 ]]
        -- upvalues: v72 (copy), v50 (copy)
        if v72 then
            v72(v50);
        end;
    end, {
        v72, 
        v50
    });
    local v73 = if l_FFlagSearchOmniAutocompletePage_0 and v44.layoutOverrides then v44.layoutOverrides else if v46 then nil else {
        sideMargin = v44.sideMargin
    };
    local v74 = l_useGameCollectionLayoutParams_0(v49, v50, false, v73);
    local l_backgroundMuralUrl_0 = v44.backgroundMuralUrl;
    local v76 = v44.shouldHideTileTitle or false;
    local v77 = v44.shouldHideTileMetadata or false;
    local v78 = if v44.containedTile ~= nil then v44.containedTile else l_FFlagLuaAppMigrateGameTile_0 and v46 and v44.gridSupportAllowed and v44.gameTileLayoutType == "Narrow" or l_backgroundMuralUrl_0 ~= nil and l_backgroundMuralUrl_0 ~= "";
    local v79 = if l_FFlagLuaAppMigrateGameTile_0 then l_GameTileConstants_0.TileTextLines[v49] and l_GameTileConstants_0.TileTextLines[v49].titleTextLines else nil;
    local v80 = l_useTextSizeOffset_0();
    local v81 = l_useGetGameTileHeight_0(v48, v49, v78, v77, v76, v80, nil, if l_FFlagLuaAppMigrateGameTile_0 then v79 else nil);
    local v82 = if l_isSeeAllTileEnabled_0(v44.hideSeeAll, v74.maxTilesToShow, v74.numColumns, #v54, v61) then v74.maxTilesToShow or #v54 + 1 else nil;
    local v83 = nil;
    v83 = if not (l_FFlagLuaAppMigrateGameTile_0 and v49 == "Narrow") or v44.playerCountStyle then v44.playerCountStyle else l_GameTileConstants_0.PlayerCountStyleValues.Footer;
    local v84 = l_useRenderGameCollectionItem_0(if l_FFlagLuaAppMigrateGameTile_0 then v83 else v44.playerCountStyle, v44.isSponsoredFooterAllowed, v49, v44.friendFooterEnabled, v44.pageContext == l_AppPage_0.Home, v69, v48, v57, v58, v20.Constants.Context.ExperienceTile, nil, nil, v61, if v53.isOmni and v53.sort then v53.sort.topicId else nil, v82, nil, v44.playButtonStyle, v78, v76, v77, if v70 then v71.onHoldableFocused else nil, if v70 then v71.onHoldableUnfocused else nil, if v70 then v71.shouldDisableHoldable else nil, v80, if l_FFlagLuaAppMigrateGameTile_0 then v79 else nil);
    local v85 = l_useCountdownSubtitleTextBinding_0(v44.endTimestamp, v44.countdownString, v53.sort and v53.sort.subtitle or "");
    local v86 = nil;
    v86 = if v44.endTimestamp and v44.countdownString then v85 else v53.sort and v53.sort.subtitle or nil;
    local v87 = v2.useCallback(function() --[[ Line: 322 ]]
        -- upvalues: l_HoverTileCoordinator_0 (ref)
        l_HoverTileCoordinator_0.default:reset();
    end, {});
    if not v53.gameSortDataFound then
        return nil;
    else
        return v2.createElement(v2.Fragment, nil, {
            GameCarousel = v2.createElement(l_CollectionCarousel_0, {
                title = v53.sort and v53.sort.displayName or "", 
                subtitle = v86, 
                backgroundMuralUrl = l_backgroundMuralUrl_0, 
                onViewableItemsChanged = v68, 
                onChangeCanvasPosition = v68, 
                containerRef = v51, 
                scrollingFrameRef = v52, 
                tooltipInfoText = v65, 
                hideHeaderButton = v44.hideSeeAll, 
                items = v54, 
                onActivateHeader = v61, 
                onActivateSubtitle = if l_FFlagEnableChartsSubtitleLink_0 and v44.subtitleLinkPath then v63 else nil, 
                onActivateInfoIcon = v64, 
                shouldUseGridPageLayout_legacy = v46 and v44.gridSupportAllowed or false, 
                renderItem = v84, 
                getItemHeight = v81, 
                numColumns = v74.numColumns, 
                fractionalItemAmount = v74.fractionalItemAmount, 
                columnGap = v74.columnGap, 
                sideMargin = v74.sideMargin, 
                maxItemsToShow = v74.maxTilesToShow, 
                headerButtonText = v62, 
                thresholdFromEnd = v74.loadMoreThreshold, 
                onReachedThresholdFromEnd = v56, 
                onScrollButtonEnter = v87, 
                forceScrollable = v49 == "Event"
            }), 
            GameSortImpressionsDetector = if l_FFlagSearchOmniAutocompletePage_0 then v44.shouldUseFrameBoundsForImpressions and v2.createElement(l_FrameBoundsImpressionsTracker_0, {
                parentRef = v52, 
                pageContext = v44.pageContext, 
                impressionsTag = v69, 
                scrollViewPositionChangedSignal = v67, 
                sendImpressions = v66, 
                dataUpdatedTimestamp = v53.gameSortContents and v53.gameSortContents.updatedTimestamp or nil
            }) or v2.createElement(l_ScreenSizeImpressionsTracker_0, {
                parentRef = v52, 
                pageContext = v44.pageContext, 
                impressionsTag = v69, 
                scrollViewPositionChangedSignal = v67, 
                sendImpressions = v66, 
                dataUpdatedTimestamp = v53.gameSortContents and v53.gameSortContents.updatedTimestamp or nil
            }) else v2.createElement(l_GameSortImpressionsDetector_0, {
                parentRef = v52, 
                pageContext = v44.pageContext, 
                impressionsTag = v69, 
                scrollViewPositionChangedSignal = v67, 
                sendGameImpressions = v66, 
                dataUpdatedTimestamp = v53.gameSortContents and v53.gameSortContents.updatedTimestamp or nil
            }), 
            ScrollDetector = v2.createElement(l_ScrollDetector_0, {
                scrollingFrameRef = v52, 
                sendScrollEvent = v60
            }), 
            HoldToPlayLauncher = if v70 and v71.shouldRenderHoldToPlayLauncher then v2.createElement(l_HoldToPlayLauncher_0, {
                selectedIndex = v71.selectedIndex, 
                selectedEntry = v71.selectedEntry, 
                selectedNavigationUniverseId = v71.selectedNavigationUniverseId, 
                holdState = v71.holdState, 
                holdProgress = v71.holdProgress, 
                cancelHold = v71.cancelHold, 
                launchContext = v20.Constants.Context.HoldToPlayLauncher, 
                referralSource = v44.pageContext, 
                reportExperienceLaunched = v58
            }) else nil
        });
    end;
end);