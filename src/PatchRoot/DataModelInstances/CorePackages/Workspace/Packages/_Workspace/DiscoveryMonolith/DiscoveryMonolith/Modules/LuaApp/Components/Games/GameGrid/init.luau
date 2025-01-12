local l_script_FirstAncestor_0 = script:FindFirstAncestor("DiscoveryMonolith");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.UIBlox);
local l_GridMetrics_0 = v2.App.Grid.GridMetrics;
local l_useStyle_0 = v2.Core.Style.useStyle;
local l_useTextSizeOffset_0 = v2.Core.Style.useTextSizeOffset;
local l_getExperienceTileRelativeHeight_0 = v2.App.Tile.getExperienceTileRelativeHeight;
local l_AspectRatioModeEnum_0 = v2.App.Tile.AspectRatioModeEnum;
local v8 = require(l_Parent_0.Roact);
local v9 = require(l_Parent_0.Cryo);
local v10 = require(l_Parent_0.GameTile);
local l_AppGameTile_0 = v10.AppGameTile;
local l_GameTileViewConfig_0 = v10.GameTileViewConfig;
local l_Symbol_0 = require(l_Parent_0.AppCommonLib).Symbol;
local v14 = require(l_Parent_0.RoactRodux);
local l_FormFactor_0 = require(l_Parent_0.FormFactor).Enums.FormFactor;
local l_OpenGameDetails_0 = require(l_Parent_0.GameDetail).OpenGameDetails;
local l_withNavigation_0 = require(l_Parent_0.RoactNavigation).withNavigation;
local l_useDesignTokens_0 = require(l_Parent_0.Style).useDesignTokens;
local l_useUiModeInfo_0 = require(l_Parent_0.RobloxAppHooks).useUiModeInfo;
local l_UiMode_0 = require(l_Parent_0.RobloxAppEnums).UiMode;
local v21 = require(l_Parent_0.DiscoveryTypes);
local l_Modules_0 = l_script_FirstAncestor_0.Modules;
local v23 = require(l_Modules_0.LuaApp.Components.Games.AppFeaturedGameTileTwoByTwo);
local v24 = require(l_Modules_0.LuaApp.Components.Generic.GridView);
local v25 = require(l_Modules_0.LuaApp.Flags.GetFFlagLuaAppUpdateGameSortGridRowHeight10ft);
local l_FFlagLuaAppMigrateGameTile_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppMigrateGameTile;
local v27 = v8.PureComponent:extend("GameGrid");
local l_GAME_GRID_CHILD_PADDING_0 = v21.Constants.GAME_GRID_CHILD_PADDING;
local l_GAME_GRID_TILE_FOOTER_HEIGHT_0 = v21.Constants.GAME_GRID_TILE_FOOTER_HEIGHT;
local v30 = l_Symbol_0.named("TilePlaceHolder");
local l_Square_0 = l_AspectRatioModeEnum_0.Square;
v27.defaultProps = {
    friendFooterEnabled = false, 
    useGridTiles = false, 
    getItemMetrics = l_GridMetrics_0.getSmallMetrics, 
    horizontalAlignment = Enum.HorizontalAlignment.Center, 
    searchResultGrid = false, 
    gameEmphasis = false, 
    source = nil, 
    showFriendActivity = false
};
v27.init = function(v32) --[[ Line: 54 ]] --[[ Name: init ]]
    v32.navigateToGameDetails = function(v33, v34) --[[ Line: 55 ]]
        -- upvalues: v32 (copy)
        v32.props.openGameDetails(v33, v34, v32.props.navigation);
    end;
end;
v27.renderItem = function(v35, v36, v37, v38, v39) --[[ Line: 60 ]] --[[ Name: renderItem ]]
    -- upvalues: v8 (copy), v23 (copy), v30 (copy), l_AppGameTile_0 (copy), l_FFlagLuaAppMigrateGameTile_0 (copy)
    local l_reportGameDetailOpened_0 = v35.props.reportGameDetailOpened;
    local l_reportExperienceLaunched_0 = v35.props.reportExperienceLaunched;
    local l_source_0 = v35.props.source;
    local l_hideGameStats_0 = v35.props.hideGameStats;
    if type(v36) == "table" and v36.featured then
        return v8.createElement(v23, {
            layoutOrder = v38, 
            entry = v36, 
            size = v37, 
            index = v36.realGameEntryIndex or v38, 
            source = l_source_0, 
            reportGameDetailOpened = l_reportGameDetailOpened_0, 
            reportExperienceLaunched = l_reportExperienceLaunched_0, 
            impressionsTag = v35.props.impressionsTag, 
            launchExperienceEventContext = v35.props.launchExperienceEventContext
        });
    elseif type(v36) == "userdata" and v36 == v30 then
        return v8.createElement("Frame", {
            LayoutOrder = v38, 
            Size = UDim2.new(0, v37.X, 0, v37.Y), 
            BackgroundTransparency = 1
        });
    else
        return v8.createElement(l_AppGameTile_0, {
            layoutOrder = v38, 
            entry = v36, 
            Size = UDim2.new(0, v37.X, 0, v37.Y), 
            index = v36.realGameEntryIndex or v38, 
            source = l_source_0, 
            reportGameDetailOpened = l_reportGameDetailOpened_0, 
            reportExperienceLaunched = l_reportExperienceLaunched_0, 
            hideGameStats = l_hideGameStats_0, 
            referralSource = v35.props.referralSource, 
            rowNum = v39, 
            showFriendActivity = v35.props.showFriendActivity, 
            impressionsTag = v35.props.impressionsTag, 
            friendFooterEnabled = if v35.props.useGridTiles then v35.props.friendFooterEnabled else nil, 
            useGridTile = v35.props.useGridTiles, 
            launchExperienceEventContext = v35.props.launchExperienceEventContext, 
            playerCountStyle = v35.props.playerCountStyle, 
            isSponsoredFooterAllowed = v35.props.isSponsoredFooterAllowed, 
            topicId = v35.props.topicId, 
            gameTileLayoutType = v35.props.gameTileLayoutType, 
            navigateToGameDetails = v35.navigateToGameDetails, 
            playButtonStyle = v35.props.playButtonStyle, 
            isUnifiedGameTile = if l_FFlagLuaAppMigrateGameTile_0 then v35.props.isUnifiedGameTile else nil
        });
    end;
end;
v27.render = function(v44) --[[ Line: 112 ]] --[[ Name: render ]]
    -- upvalues: l_GridMetrics_0 (copy), l_UiMode_0 (copy), l_FormFactor_0 (copy), l_GameTileViewConfig_0 (copy), l_GAME_GRID_TILE_FOOTER_HEIGHT_0 (copy), l_GAME_GRID_CHILD_PADDING_0 (copy), v25 (copy), l_getExperienceTileRelativeHeight_0 (copy), l_Square_0 (copy), v30 (copy), v9 (copy), v8 (copy), v24 (copy)
    local l_entries_0 = v44.props.entries;
    local l_LayoutOrder_0 = v44.props.LayoutOrder;
    local l_numberOfRowsToShow_0 = v44.props.numberOfRowsToShow;
    local l_windowSize_0 = v44.props.windowSize;
    local l_screenSize_0 = v44.props.screenSize;
    local l_horizontalAlignment_0 = v44.props.horizontalAlignment;
    local l_searchResultGrid_0 = v44.props.searchResultGrid;
    local v52 = nil;
    local v53 = l_searchResultGrid_0 and l_GridMetrics_0.getMediumMetrics or v44.props.getItemMetrics;
    local v54 = nil;
    local v55 = nil;
    local v56 = nil;
    if v44.props.useGridTiles then
        local v57 = nil;
        local v58 = nil;
        local v59 = nil;
        if v44.props.uiModeInfo.uiMode == l_UiMode_0.TenFoot then
            v59 = 5;
            v57 = v44.props.designTokens.Global.Space_300;
            v58 = 51;
        elseif v44.props.formFactor == l_FormFactor_0.WIDE then
            v59 = 4;
            v57 = 8;
            v58 = 28;
        else
            v59 = 2;
            v57 = 8;
            v58 = 28;
        end;
        v54 = l_GridMetrics_0.getMetricsForFixedColumns(l_windowSize_0.X, v57, v59).itemWidth;
        v55 = l_GameTileViewConfig_0.getTileHeight(v44.props.designTokens, v54, v44.props.gameTileLayoutType, false, false, false, v44.props.textSizeOffset);
        v56 = Vector2.new(v57, v58);
    else
        local l_l_GAME_GRID_TILE_FOOTER_HEIGHT_0_0 = l_GAME_GRID_TILE_FOOTER_HEIGHT_0;
        v56 = Vector2.new(l_GAME_GRID_CHILD_PADDING_0, l_GAME_GRID_CHILD_PADDING_0 * 2);
        if v44.props.uiModeInfo.uiMode == l_UiMode_0.TenFoot then
            v56 = Vector2.new(v44.props.cellSpacingHorizontal, v44.props.cellSpacingVertical);
            v54 = l_GridMetrics_0.getMetricsForFixedColumns(l_windowSize_0.X, v56.X, 8).itemWidth;
        else
            v54 = v53(l_windowSize_0.X, l_GAME_GRID_CHILD_PADDING_0).itemWidth;
        end;
        if v25() then
            l_l_GAME_GRID_TILE_FOOTER_HEIGHT_0_0 = l_getExperienceTileRelativeHeight_0(v44.props.style, l_Square_0, 2).Offset;
        end;
        v55 = math.floor(v54 + l_l_GAME_GRID_TILE_FOOTER_HEIGHT_0_0);
    end;
    local v61 = Vector2.new(v54, v55);
    if l_searchResultGrid_0 and #l_entries_0 > 0 and v44.props.gameEmphasis then
        v52 = {};
        table.insert(v52, v30);
        table.insert(v52, v30);
        local v62 = math.floor((l_windowSize_0.X + v56.X) / (v61.X + v56.X)) - 2;
        local v63 = 2;
        while v63 < 2 + v62 do
            if v63 <= #l_entries_0 then
                table.insert(v52, v9.Dictionary.join(l_entries_0[v63], {
                    realGameEntryIndex = v63
                }));
            else
                table.insert(v52, v30);
            end;
            v63 = v63 + 1;
        end;
        table.insert(v52, v9.Dictionary.join(l_entries_0[1], {
            featured = true, 
            realGameEntryIndex = 1
        }));
        table.insert(v52, v30);
        for v64 = v63, #l_entries_0 do
            table.insert(v52, v9.Dictionary.join(l_entries_0[v64], {
                realGameEntryIndex = v64
            }));
        end;
    end;
    return v8.createElement(v24, {
        layoutOrder = l_LayoutOrder_0, 
        items = v52 or l_entries_0, 
        renderItem = function(...) --[[ Line: 237 ]] --[[ Name: renderItem ]]
            -- upvalues: v44 (copy)
            return v44:renderItem(...);
        end, 
        windowAbsoluteSize = l_windowSize_0, 
        screenSize = l_screenSize_0, 
        itemAbsoluteSize = v61, 
        cellPaddingOffset = v56, 
        numberOfRowsToShow = l_numberOfRowsToShow_0, 
        horizontalAlignment = l_horizontalAlignment_0, 
        onItemsPerRowChanged = v44.props.onItemsPerRowChanged
    });
end;
local v71 = l_withNavigation_0((v14.connect(function(v65, _) --[[ Line: 250 ]]
    return {
        formFactor = v65.FormFactor
    };
end, function(v67) --[[ Line: 254 ]]
    -- upvalues: l_OpenGameDetails_0 (copy)
    return {
        openGameDetails = function(v68, v69, v70) --[[ Line: 256 ]] --[[ Name: openGameDetails ]]
            -- upvalues: v67 (copy), l_OpenGameDetails_0 (ref)
            v67(l_OpenGameDetails_0(v68, v70, v69));
        end
    };
end)(v27)));
local l_v71_0 = v71 --[[ copy: 32 -> 33 ]];
v27 = function(v73) --[[ Line: 265 ]]
    -- upvalues: l_useDesignTokens_0 (copy), l_useUiModeInfo_0 (copy), l_useTextSizeOffset_0 (copy), v9 (copy), v8 (copy), l_v71_0 (copy)
    local v74 = l_useDesignTokens_0();
    local v75 = l_useUiModeInfo_0();
    local v76 = l_useTextSizeOffset_0();
    local v77 = v9.Dictionary.join(v73, {
        uiModeInfo = v75, 
        cellSpacingHorizontal = v74.Global.Space_300, 
        cellSpacingVertical = v74.Global.Space_400, 
        designTokens = v74, 
        textSizeOffset = v76
    });
    return v8.createElement(l_v71_0, v77);
end;
if v25() then
    v71 = v27;
    v27 = function(v78) --[[ Line: 284 ]]
        -- upvalues: l_useStyle_0 (copy), l_useTextSizeOffset_0 (copy), v9 (copy), v8 (copy), v71 (copy)
        local v79 = l_useStyle_0();
        local v80 = l_useTextSizeOffset_0();
        local v81 = v9.Dictionary.join(v78, {
            style = v79, 
            textSizeOffset = v80
        });
        return v8.createElement(v71, v81);
    end;
end;
return v27;