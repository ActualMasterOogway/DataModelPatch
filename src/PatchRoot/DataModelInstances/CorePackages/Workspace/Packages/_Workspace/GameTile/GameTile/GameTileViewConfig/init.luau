local l_script_FirstAncestor_0 = script:FindFirstAncestor("GameTile");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local _ = require(l_Parent_0.Style);
local l_memoize_0 = require(l_Parent_0.AppCommonLib).memoize;
local _ = require(l_script_FirstAncestor_0.GameTileTypes);
local v5 = game:DefineFastFlag("LuaAppUseNewTilePadding", false);
local l_FFlagLuaAppMigrateGameTile_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppMigrateGameTile;
local function v8(v7) --[[ Line: 18 ]] --[[ Name: getImageAspectRatio ]]
    if v7 == "Wide" or v7 == "Event" then
        return 1.7777777777777777;
    else
        return 1;
    end;
end;
local function v10(v9) --[[ Line: 26 ]] --[[ Name: getInverseImageAspectRatio ]]
    if v9 == "Wide" or v9 == "Event" then
        return 0.5625;
    else
        return 1;
    end;
end;
local function v13(v11, v12) --[[ Line: 34 ]] --[[ Name: getContainmentSidePadding ]]
    if v12 == "Wide" or v12 == "Event" then
        return v11.Global.Space_150;
    else
        return v11.Global.Space_75;
    end;
end;
local v17 = l_memoize_0(function(v14, v15, v16) --[[ Line: 52 ]]
    -- upvalues: v5 (copy), l_FFlagLuaAppMigrateGameTile_0 (copy)
    return {
        footerTopPadding = if v5 then v14.Global.Space_150 else v14.Global.Space_100, 
        titleHeight = if l_FFlagLuaAppMigrateGameTile_0 then (v16 or 1) * (v14.Global.Space_250 + (v15 or 0)) else v14.Global.Space_250 + (v15 or 0), 
        paddingAboveMetadata = v5 and 0 or v14.Global.Space_50, 
        metadataHeight = v14.Global.Space_250 + (v15 or 0), 
        footerBottomPadding = if v5 then v14.Global.Space_150 else v14.Global.Space_100, 
        playButtonHeight = v14.Global.Size_450
    };
end);
return {
    getTileHeight = function(v18, v19, v20, v21, v22, v23, v24, v25, v26) --[[ Line: 99 ]] --[[ Name: getTileHeight ]]
        -- upvalues: l_FFlagLuaAppMigrateGameTile_0 (copy), v17 (copy)
        local v27 = v19 * ((not (v20 ~= "Wide") or v20 == "Event") and 0.5625 or 1);
        local v28 = if l_FFlagLuaAppMigrateGameTile_0 then v26 else nil;
        local v29 = v17(v18, nil, if l_FFlagLuaAppMigrateGameTile_0 then v28 else nil);
        local l_footerTopPadding_0 = v29.footerTopPadding;
        if not v23 then
            l_footerTopPadding_0 = l_footerTopPadding_0 + v29.titleHeight + (v24 or 0);
        end;
        if not v22 then
            l_footerTopPadding_0 = l_footerTopPadding_0 + (v29.paddingAboveMetadata + v29.metadataHeight) + (v24 or 0);
        end;
        if v21 then
            l_footerTopPadding_0 = l_footerTopPadding_0 + v29.footerBottomPadding;
        end;
        if v25 then
            l_footerTopPadding_0 = l_footerTopPadding_0 + v25;
        end;
        return v27 + l_footerTopPadding_0;
    end, 
    getFooterHeight = function(v31, v32, v33, v34, v35, v36, v37) --[[ Line: 70 ]] --[[ Name: getFooterHeight ]]
        -- upvalues: v17 (copy), l_FFlagLuaAppMigrateGameTile_0 (copy)
        local v38 = v17(v31, nil, if l_FFlagLuaAppMigrateGameTile_0 then v37 else nil);
        local l_footerTopPadding_1 = v38.footerTopPadding;
        if not v34 then
            l_footerTopPadding_1 = l_footerTopPadding_1 + v38.titleHeight + (v35 or 0);
        end;
        if not v33 then
            l_footerTopPadding_1 = l_footerTopPadding_1 + (v38.paddingAboveMetadata + v38.metadataHeight) + (v35 or 0);
        end;
        if v32 then
            l_footerTopPadding_1 = l_footerTopPadding_1 + v38.footerBottomPadding;
        end;
        if v36 then
            l_footerTopPadding_1 = l_footerTopPadding_1 + v36;
        end;
        return l_footerTopPadding_1;
    end, 
    getImageAspectRatio = v8, 
    getInverseImageAspectRatio = v10, 
    getElementSizes = v17, 
    getContainmentSidePadding = v13
};