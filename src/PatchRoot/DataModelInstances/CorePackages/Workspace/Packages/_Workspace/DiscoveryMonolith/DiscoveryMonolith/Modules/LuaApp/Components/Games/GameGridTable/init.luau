local l_script_FirstAncestor_0 = script:FindFirstAncestor("DiscoveryMonolith");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.LuauPolyfill);
local v4 = require(l_Parent_0.UIBlox);
local l_ResponsiveGrid_0 = v4.App.Container.Grid.ResponsiveGrid;
local v6 = require(l_Parent_0.GameTile);
local l_GameTileConstants_0 = v6.GameTileConstants;
local l_GameTileLayoutType_0 = v6.GameTileTypes.GameTileLayoutType;
local l_GameTileViewConfig_0 = v6.GameTileViewConfig;
local l_AppGameTile_0 = v6.AppGameTile;
local l_LayoutConfig_0 = require(l_Parent_0.RobloxAppEnums).LayoutConfig;
local l_useResponsiveLayout_0 = v4.Core.Layout.Responsive.useResponsiveLayout;
local l_useTextSizeOffset_0 = v4.Core.Style.useTextSizeOffset;
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useNavigation_0 = require(l_Parent_0.Navigation).useNavigation;
local l_OpenGameDetails_0 = require(l_Parent_0.GameDetail).OpenGameDetails;
local l_useDesignTokens_0 = require(l_Parent_0.Style).useDesignTokens;
local l_Modules_0 = l_script_FirstAncestor_0.Modules;
local v19 = require(l_Modules_0.LuaApp.Components.Games.AppFeaturedGameTileTwoByTwo);
local l_FFlagLuaAppMigrateGameTile_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppMigrateGameTile;
local v21 = game:DefineFastFlag("LuaAppFixEmphasisDisappear", false);
local function v23(v22) --[[ Line: 56 ]] --[[ Name: getCellSpan ]]
    if v22.featured then
        return 2;
    else
        return 1;
    end;
end;
return function(v24) --[[ Line: 60 ]] --[[ Name: GameGridTable ]]
    -- upvalues: l_LayoutConfig_0 (copy), v2 (copy), v3 (copy), l_useDispatch_0 (copy), l_useNavigation_0 (copy), l_OpenGameDetails_0 (copy), l_useTextSizeOffset_0 (copy), l_useResponsiveLayout_0 (copy), l_useDesignTokens_0 (copy), l_GameTileConstants_0 (copy), l_GameTileLayoutType_0 (copy), l_GameTileViewConfig_0 (copy), v19 (copy), l_AppGameTile_0 (copy), l_FFlagLuaAppMigrateGameTile_0 (copy), l_ResponsiveGrid_0 (copy), v23 (copy), v21 (copy)
    local v25 = nil;
    v25 = if v24.useGridTiles then l_LayoutConfig_0.Kind.Experiences.GridTile else l_LayoutConfig_0.Kind.Experiences.WithFooter;
    local v26 = v24.entries or {};
    local v27 = v24.gameEmphasis or false;
    local v33 = v2.useMemo(function() --[[ Line: 70 ]]
        -- upvalues: v3 (ref), v26 (copy), v27 (copy)
        return v3.Array.map(v26, function(v28, v29) --[[ Line: 71 ]]
            -- upvalues: v3 (ref), v27 (ref)
            local l_assign_0 = v3.Object.assign;
            local v31 = {
                index = v29
            };
            local v32 = false;
            if v29 == 1 then
                v32 = v27;
            end;
            v31.featured = v32;
            return l_assign_0(v31, v28);
        end);
    end, {
        v26, 
        v27
    });
    local v34 = l_useDispatch_0();
    local v35 = l_useNavigation_0();
    local v38 = v2.useCallback(function(v36, v37) --[[ Line: 82 ]]
        -- upvalues: v34 (copy), l_OpenGameDetails_0 (ref), v35 (copy)
        v34(l_OpenGameDetails_0(v36, v35, v37));
    end, {
        v35
    });
    local v39 = v24.windowSize or Vector2.one;
    local v40 = l_useTextSizeOffset_0();
    local l_source_0 = v24.source;
    local l_referralSource_0 = v24.referralSource;
    local l_hideGameStats_0 = v24.hideGameStats;
    local v44 = v24.useHoverTile == nil or v24.useHoverTile;
    local l_reportGameDetailOpened_0 = v24.reportGameDetailOpened;
    local l_reportExperienceLaunched_0 = v24.reportExperienceLaunched;
    local v47 = v24.showFriendActivity or false;
    local v48 = l_useResponsiveLayout_0("relativeHeight", v25);
    local v49 = v2.useRef(1);
    local v50 = l_useResponsiveLayout_0("columns", v25);
    v2.useEffect(function() --[[ Line: 101 ]]
        -- upvalues: v49 (copy), v50 (copy), v24 (copy)
        if v49.current ~= v50 then
            v49.current = v50;
            if v24.onItemsPerRowChanged then
                v24.onItemsPerRowChanged(v50);
            end;
        end;
    end, {
        v50, 
        v49, 
        v24.onItemsPerRowChanged
    });
    local v51 = l_useDesignTokens_0();
    if v24.isUnifiedGameTile then
        local v52 = l_GameTileConstants_0.TileTextLines[v24.gameTileLayoutType or l_GameTileLayoutType_0.Narrow];
        local v53 = l_GameTileViewConfig_0.getFooterHeight(v51, true, false, false, v40, nil, v52.titleTextLines);
        v48 = UDim.new(v48.Scale, v53);
    elseif typeof(v48) == "UDim" then
        local v54 = l_GameTileConstants_0.TileTextLines[v24.gameTileLayoutType or l_GameTileLayoutType_0.Narrow];
        local v55 = v54.titleTextLines + v54.metadataTextLines;
        v48 = v48 + UDim.new(0, v55 * (v40 or 0));
    end;
    local v58 = v2.useCallback(function(v56, v57) --[[ Line: 133 ]]
        -- upvalues: v2 (ref), v19 (ref), l_source_0 (copy), l_reportGameDetailOpened_0 (copy), l_reportExperienceLaunched_0 (copy), v24 (copy), l_AppGameTile_0 (ref), l_hideGameStats_0 (copy), l_referralSource_0 (copy), v47 (copy), v44 (copy), v38 (copy), l_FFlagLuaAppMigrateGameTile_0 (ref)
        if v56.featured then
            return v2.createElement(v19, {
                entry = v56, 
                index = v56.realGameEntryIndex or v56.index, 
                source = l_source_0, 
                reportGameDetailOpened = l_reportGameDetailOpened_0, 
                reportExperienceLaunched = l_reportExperienceLaunched_0, 
                hasBackground = true, 
                hasActionRow = true, 
                isDynamic = true, 
                impressionsTag = v24.impressionsTag, 
                launchExperienceEventContext = v24.launchExperienceEventContext
            });
        else
            return v2.createElement(l_AppGameTile_0, {
                entry = v56, 
                index = v56.realGameEntryIndex or v56.index, 
                source = l_source_0, 
                reportGameDetailOpened = l_reportGameDetailOpened_0, 
                reportExperienceLaunched = l_reportExperienceLaunched_0, 
                hideGameStats = l_hideGameStats_0, 
                referralSource = l_referralSource_0, 
                rowNum = math.ceil(v56.index / (v57.columns or 1)), 
                showFriendActivity = v47, 
                playerCountStyle = v24.playerCountStyle, 
                isSponsoredFooterAllowed = v24.isSponsoredFooterAllowed, 
                useHoverTile = v44, 
                useGridTile = v24.useGridTiles, 
                friendFooterEnabled = v24.useGridTiles and true or nil, 
                impressionsTag = v24.impressionsTag, 
                launchExperienceEventContext = v24.launchExperienceEventContext, 
                topicId = v24.topicId, 
                gameTileLayoutType = v24.gameTileLayoutType, 
                navigateToGameDetails = v38, 
                playButtonStyle = v24.playButtonStyle, 
                isUnifiedGameTile = if l_FFlagLuaAppMigrateGameTile_0 then v24.isUnifiedGameTile else nil, 
                isContained = l_FFlagLuaAppMigrateGameTile_0 and true or nil
            });
        end;
    end, {
        l_source_0, 
        l_referralSource_0, 
        l_hideGameStats_0, 
        v47, 
        l_reportGameDetailOpened_0, 
        l_reportExperienceLaunched_0, 
        v24.impressionsTag, 
        v24.launchExperienceEventContext, 
        v24.playerCountStyle, 
        v24.useGridTiles, 
        v24.isSponsoredFooterAllowed, 
        v24.playButtonStyle
    });
    local v59 = if v24.screenSize then v24.screenSize.Y else v39.Y;
    local v60 = 1 * v59;
    return v2.createElement(l_ResponsiveGrid_0, {
        kind = v25, 
        data = v33, 
        renderItem = v58, 
        layoutOrder = v24.LayoutOrder, 
        getCellColspan = v23, 
        getCellRowspan = v23, 
        relativeHeight = v48, 
        absoluteWindowTop = if v21 then -v59 else 0, 
        absoluteWindowHeight = if v21 then v59 * 3 else v59 + v60, 
        enableDeferredRefPropEvents = true
    });
end;