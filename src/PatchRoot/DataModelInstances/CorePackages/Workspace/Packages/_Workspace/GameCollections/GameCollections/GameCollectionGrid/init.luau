local l_script_FirstAncestor_0 = script:FindFirstAncestor("GameCollections");
local l_useControllerBarFocusNavigationBindings_0 = require(l_script_FirstAncestor_0.GameCollectionNavigationBindings).useControllerBarFocusNavigationBindings;
local v2 = require(l_script_FirstAncestor_0.useGetGameTileHeight);
local v3 = require(l_script_FirstAncestor_0.useIsHoldToPlayEnabledForGames);
local v4 = require(l_script_FirstAncestor_0.useRenderGameCollectionItem);
local v5 = require(l_script_FirstAncestor_0.useGameCollectionLayoutParams);
local v6 = require(l_script_FirstAncestor_0.useGameSortAnalytics);
local v7 = require(l_script_FirstAncestor_0.Impressions.GameSortImpressionsDetector);
local v8 = require(l_script_FirstAncestor_0.useGameSortData);
local v9 = require(l_script_FirstAncestor_0.Impressions.useGameSortImpressionsParams);
local v10 = require(l_script_FirstAncestor_0.useGameSortTooltipParams);
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v12 = require(l_Parent_0.React);
local v13 = require(l_Parent_0.t);
local l_validateProps_0 = require(l_Parent_0.DiscoveryUtils).validateProps;
local _ = require(l_Parent_0.DiscoveryTypes);
local l_GameTileConstants_0 = require(l_Parent_0.GameTile).GameTileConstants;
local _ = require(l_Parent_0.AppCommonLib);
local v18 = require(l_Parent_0.Responsive);
local l_usePreferredInput_0 = v18.usePreferredInput;
local l_useAppPolicy_0 = require(l_Parent_0.UniversalAppPolicy).useAppPolicy;
local l_CollectionGrid_0 = require(l_Parent_0.CollectionViews).CollectionGrid;
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local v23 = require(l_Parent_0.DiscoveryAnalytics);
local l_useTextSizeOffset_0 = require(l_Parent_0.UIBlox).Core.Style.useTextSizeOffset;
local v25 = require(l_Parent_0.HoldToPlay);
local l_HoldToPlayLauncher_0 = v25.HoldToPlayLauncher;
local l_useHoldToPlayStateAndCallbacks_0 = v25.useHoldToPlayStateAndCallbacks;
local l_FFlagLuaAppMigrateGameTile_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppMigrateGameTile;
local v29 = v13.strictInterface({
    entries = v13.optional(v13.table), 
    title = v13.string, 
    verticalScrollingFrameRef = v13.table, 
    maxNumRows = v13.optional(v13.number), 
    useGridTiles = v13.optional(v13.boolean), 
    gameSortId = v13.string, 
    sortIndex = v13.number, 
    pageContext = v13.string, 
    scrollViewPositionChangedSignal = v13.optional(v13.table), 
    friendFooterEnabled = v13.optional(v13.boolean), 
    playerCountStyle = v13.optional(v13.string), 
    isSponsoredFooterAllowed = v13.optional(v13.boolean), 
    componentType = v13.optional(v13.string), 
    gameTileLayoutType = v13.optional(v13.string), 
    infoText = v13.optional(v13.string), 
    linkPath = v13.optional(v13.string), 
    gridSupportAllowed = v13.optional(v13.boolean), 
    isHoverSupportEnabled = v13.optional(v13.boolean), 
    onItemsPerRowChanged = v13.optional(v13.callback), 
    itemRowData = v13.optional(v13.table), 
    playButtonStyle = v13.optional(v13.string), 
    sideMargin = v13.optional(v13.number), 
    shouldHideTileMetadata = v13.optional(v13.boolean), 
    shouldHideTileTitle = v13.optional(v13.boolean), 
    containedTile = v13.optional(v13.boolean)
});
return v12.memo(function(v30) --[[ Line: 103 ]] --[[ Name: GameCollectionGrid ]]
    -- upvalues: l_validateProps_0 (copy), v29 (copy), l_useAppPolicy_0 (copy), l_usePreferredInput_0 (copy), v18 (copy), v12 (copy), v8 (copy), v6 (copy), v10 (copy), v5 (copy), v9 (copy), v3 (copy), l_useHoldToPlayStateAndCallbacks_0 (copy), l_useControllerBarFocusNavigationBindings_0 (copy), l_useTextSizeOffset_0 (copy), l_FFlagLuaAppMigrateGameTile_0 (copy), l_GameTileConstants_0 (copy), v2 (copy), v4 (copy), l_AppPage_0 (copy), v23 (copy), l_CollectionGrid_0 (copy), v7 (copy), l_HoldToPlayLauncher_0 (copy)
    l_validateProps_0(v29, v30);
    local v32 = l_useAppPolicy_0(function(v31) --[[ Line: 107 ]]
        return v31.useGridPageLayout();
    end);
    local v33 = l_usePreferredInput_0();
    local v34 = v33 == v18.Input.Directional and 4 or 2;
    local v35 = v33 == v18.Input.Directional and 4 or 1;
    local v36 = v30.isHoverSupportEnabled and v32 and v33 == v18.Input.Pointer;
    local v37 = v30.gameTileLayoutType or "Narrow";
    local v38, v39 = v12.useState(nil);
    local v40 = v12.useRef(v38);
    v40.current = v38;
    local v41 = v8(v30.gameSortId, v30.pageContext);
    local v42, v43 = v6(v41.sort, v41.isOmni, v30.sortIndex, v30.pageContext, nil, v30.entries);
    local v44, v45 = v10(v41.sort, v41.isOmni, v30.infoText);
    local v46 = if v32 then nil else {
        sideMargin = v30.sideMargin
    };
    local v47 = v5(v37, v38, false, v46);
    local v48, v49, v50 = v9(v41.sort, v41.isOmni, v30.sortIndex, v30.pageContext, v30.useGridTiles, v30.componentType, v41.gamesApiSortPageId, v30.gameSortId, v30.scrollViewPositionChangedSignal, v47.numColumns or 0, v30.itemRowData, v30.entries);
    local v51 = ("GameGrid_%*_%*"):format(v30.gameSortId, v30.sortIndex);
    local v52 = v3();
    local v53 = l_useHoldToPlayStateAndCallbacks_0();
    local v54 = l_useControllerBarFocusNavigationBindings_0(nil, if v52 then v53.holdToPlayEventHandler else nil);
    v12.useEffect(function() --[[ Line: 175 ]]
        -- upvalues: v54 (copy), v38 (copy)
        if v54 then
            v54(v38);
        end;
    end, {
        v54, 
        v38
    });
    local v55 = v30.shouldHideTileTitle or false;
    local v56 = v30.shouldHideTileMetadata or false;
    local v57 = v30.containedTile or false;
    local v58 = l_useTextSizeOffset_0();
    local v59 = if l_FFlagLuaAppMigrateGameTile_0 then l_GameTileConstants_0.TileTextLines[v37] and l_GameTileConstants_0.TileTextLines[v37].titleTextLines else nil;
    local v60 = v2(v36, v37, v57, v56, v55, v58, nil, if l_FFlagLuaAppMigrateGameTile_0 then v59 else nil);
    local v61 = nil;
    v61 = if not (l_FFlagLuaAppMigrateGameTile_0 and v37 == "Narrow") or v30.playerCountStyle then v30.playerCountStyle else l_GameTileConstants_0.PlayerCountStyleValues.Footer;
    local v62 = v4(if l_FFlagLuaAppMigrateGameTile_0 then v61 else v30.playerCountStyle, v30.isSponsoredFooterAllowed, v37, v30.friendFooterEnabled, v30.pageContext == l_AppPage_0.Home, v51, v36, v42, v43, v23.Constants.Context.ExperienceTile, nil, nil, nil, if v41.isOmni then v30.gameSortId else nil, nil, nil, v30.playButtonStyle, v57, v55, v56, if v52 then v53.onHoldableFocused else nil, if v52 then v53.onHoldableUnfocused else nil, if v52 then v53.shouldDisableHoldable else nil, v58, if l_FFlagLuaAppMigrateGameTile_0 then v59 else nil);
    local v63 = v12.useRef(0);
    v12.useEffect(function() --[[ Line: 243 ]]
        -- upvalues: v47 (copy), v63 (copy), v30 (copy)
        if v47.numColumns ~= v63.current then
            v63.current = v47.numColumns;
            if v30.onItemsPerRowChanged then
                v30.onItemsPerRowChanged(v47.numColumns);
            end;
        end;
    end, {
        v47.numColumns, 
        v30.onItemsPerRowChanged, 
        v63
    });
    if not v41.gameSortDataFound then
        return nil;
    else
        return v12.createElement(v12.Fragment, nil, {
            GameGrid = v12.createElement(l_CollectionGrid_0, {
                title = v30.title, 
                subtitle = v41.sort and v41.sort.subtitle or nil, 
                onViewableItemsChanged = v50, 
                containerRef = v39, 
                tooltipInfoText = v45, 
                hideHeaderButton = true, 
                items = v30.entries, 
                onActivateInfoIcon = v44, 
                shouldUseGridPageLayout_legacy = v32 and v30.gridSupportAllowed or false, 
                verticalScrollingFrameRef = v30.verticalScrollingFrameRef, 
                renderItem = v62, 
                getItemHeight = v60, 
                numColumns = v47.numColumns, 
                columnGap = v47.columnGap, 
                sideMargin = v47.sideMargin, 
                verticalPadding = v47.verticalPadding, 
                maxNumRows = v30.maxNumRows, 
                bufferRowsBelowScreen = v34, 
                bufferRowsAboveScreen = v35
            }), 
            GameSortImpressionsDetector = v12.createElement(v7, {
                parentRef = v40, 
                pageContext = v30.pageContext, 
                impressionsTag = v51, 
                scrollViewPositionChangedSignal = v49, 
                sendGameImpressions = v48, 
                dataUpdatedTimestamp = v41.gameSortContents and v41.gameSortContents.updatedTimestamp or nil
            }), 
            HoldToPlayLauncher = if v52 and v53.shouldRenderHoldToPlayLauncher then v12.createElement(l_HoldToPlayLauncher_0, {
                selectedIndex = v53.selectedIndex, 
                selectedEntry = v53.selectedEntry, 
                selectedNavigationUniverseId = v53.selectedNavigationUniverseId, 
                holdState = v53.holdState, 
                holdProgress = v53.holdProgress, 
                cancelHold = v53.cancelHold, 
                launchContext = v23.Constants.Context.HoldToPlayLauncher, 
                referralSource = v30.pageContext, 
                reportExperienceLaunched = v43
            }) else nil
        });
    end;
end);