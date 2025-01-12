local l_script_FirstAncestor_0 = script:FindFirstAncestor("GameCollections");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local l_GameTileConstants_0 = require(l_Parent_0.GameTile).GameTileConstants;
local v4 = require(l_Parent_0.Responsive);
local l_usePreferredInput_0 = v4.usePreferredInput;
local l_useAppPolicy_0 = require(l_Parent_0.UniversalAppPolicy).useAppPolicy;
local l_CollectionGrid_0 = require(l_Parent_0.CollectionViews).CollectionGrid;
local v8 = require(l_script_FirstAncestor_0.useGetGameTileHeight);
local v9 = require(l_script_FirstAncestor_0.useGameCollectionLayoutParams);
local l_FFlagLuaAppMigrateGameTile_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppMigrateGameTile;
local v11 = {};
local function v16(_, _, _, _) --[[ Line: 35 ]] --[[ Name: renderItem ]]
    return nil, "placeholder";
end;
return v2.memo(function(v17) --[[ Line: 42 ]] --[[ Name: PlaceholderGameGrid ]]
    -- upvalues: l_useAppPolicy_0 (copy), l_usePreferredInput_0 (copy), v4 (copy), v2 (copy), v9 (copy), l_FFlagLuaAppMigrateGameTile_0 (copy), l_GameTileConstants_0 (copy), v8 (copy), v11 (copy), l_CollectionGrid_0 (copy), v16 (copy)
    local v19 = l_useAppPolicy_0(function(v18) --[[ Line: 44 ]]
        return v18.useGridPageLayout();
    end);
    local v20 = l_usePreferredInput_0();
    local v21 = v17.isHoverSupportEnabled and v19 and v20 == v4.Input.Pointer;
    local v22 = v17.gameTileLayoutType or "Narrow";
    local v23, v24 = v2.useState(nil);
    v2.useRef(v23).current = v23;
    local v25 = if v19 then nil else {
        sideMargin = v17.sideMargin
    };
    local v26 = v9(v22, v23, false, v25);
    local v27 = v17.shouldHideTileTitle or false;
    local v28 = v17.shouldHideTileMetadata or false;
    local v29 = v17.containedTile or false;
    local v30 = if l_FFlagLuaAppMigrateGameTile_0 then l_GameTileConstants_0.TileTextLines[v22] and l_GameTileConstants_0.TileTextLines[v22].titleTextLines else nil;
    local v31 = v8(v21, v22, v29, v28, v27, nil, nil, if l_FFlagLuaAppMigrateGameTile_0 then v30 else nil);
    local v32 = v2.useRef(0);
    v2.useEffect(function() --[[ Line: 85 ]]
        -- upvalues: v26 (copy), v32 (copy), v17 (copy)
        if v26.numColumns ~= v32.current then
            v32.current = v26.numColumns;
            if v17.onItemsPerRowChanged then
                v17.onItemsPerRowChanged(v26.numColumns);
            end;
        end;
    end, {
        v26.numColumns, 
        v17.onItemsPerRowChanged, 
        v32
    });
    local v33 = math.clamp(v17.numRows, 0, 4);
    local v36 = v2.useMemo(function() --[[ Line: 98 ]]
        -- upvalues: v26 (copy), v33 (copy), v11 (ref)
        local v34 = {};
        for _ = 1, v26.numColumns * v33 do
            table.insert(v34, v11);
        end;
        return v34;
    end, {
        v26.numColumns, 
        v33
    });
    return v2.createElement(v2.Fragment, nil, {
        GameGrid = v2.createElement(l_CollectionGrid_0, {
            title = if v33 > 0 then v17.title else nil, 
            containerRef = v24, 
            verticalScrollingFrameRef = v17.verticalScrollingFrameRef, 
            hideHeaderButton = true, 
            items = v36, 
            shouldUseGridPageLayout_legacy = v19 and v17.gridSupportAllowed or false, 
            renderItem = v16, 
            getItemHeight = v31, 
            numColumns = v26.numColumns, 
            columnGap = v26.columnGap, 
            sideMargin = v26.sideMargin
        })
    });
end);