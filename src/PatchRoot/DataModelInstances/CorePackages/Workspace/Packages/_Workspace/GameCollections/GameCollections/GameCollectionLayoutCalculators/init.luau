local l_Parent_0 = script:FindFirstAncestor("GameCollections").Parent;
local v1 = require(l_Parent_0.CollectionViews);
local v2 = require(l_Parent_0.GameTile);
local l_GameTileViewConfig_0 = v2.GameTileViewConfig;
local l_CollectionLayoutCalculators_0 = v1.CollectionLayoutCalculators;
local l_GameTileConstants_0 = v2.GameTileConstants;
local _ = require(l_Parent_0.Style);
local l_FFlagLuaAppMigrateGameTile_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppMigrateGameTile;
local l_FFlagLuaAppMigrateGameTileIxp_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppMigrateGameTileIxp;
local l_GameTileExperimentation_0 = v2.GameTileExperimentation;
return {
    calculateNumColumns = l_CollectionLayoutCalculators_0.calculateNumColumns, 
    calculateTileHeightFromWidth = function(v10, v11, v12, v13, v14, v15, v16, v17, v18, v19) --[[ Line: 20 ]] --[[ Name: calculateTileHeightFromWidth ]]
        -- upvalues: l_FFlagLuaAppMigrateGameTile_0 (copy), l_FFlagLuaAppMigrateGameTileIxp_0 (copy), l_GameTileExperimentation_0 (copy), l_GameTileViewConfig_0 (copy), l_GameTileConstants_0 (copy)
        if l_FFlagLuaAppMigrateGameTile_0 and not l_FFlagLuaAppMigrateGameTileIxp_0 or l_FFlagLuaAppMigrateGameTileIxp_0 and l_GameTileExperimentation_0.getIsTileMigrationEnabled() or v12 == "Event" or v12 == "Wide" then
            return l_GameTileViewConfig_0.getTileHeight(v13, v10, v12, v14, v15, v16, v17, v18, if l_FFlagLuaAppMigrateGameTile_0 then v19 else nil);
        else
            local v20 = nil;
            local v21 = l_GameTileConstants_0.TileTextLines[v12];
            local l_titleTextLines_0 = v21.titleTextLines;
            local l_metadataTextLines_0 = v21.metadataTextLines;
            v20 = if v11 then v13.Global.Size_1000 else v13.Global.Size_900 * 70 / 72;
            local v24 = l_titleTextLines_0 + l_metadataTextLines_0;
            return v10 + v20 + (v17 or 0) * v24;
        end;
    end, 
    calculateSideMargin = l_CollectionLayoutCalculators_0.calculateSideMargin, 
    calculateColumnGap = l_CollectionLayoutCalculators_0.calculateColumnGap, 
    calculateVerticalPadding = l_CollectionLayoutCalculators_0.calculateVerticalPadding, 
    calculateFractionalItemAmount = l_CollectionLayoutCalculators_0.calculateFractionalItemAmount, 
    calculateMaxTilesToShow = l_CollectionLayoutCalculators_0.calculateMaxTilesToShow, 
    calculateLoadMoreThreshold = l_CollectionLayoutCalculators_0.calculateLoadMoreThreshold
};