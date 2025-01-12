local l_script_FirstAncestor_0 = script:FindFirstAncestor("GameCollections");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local l_useDesignTokens_0 = require(l_Parent_0.Style).useDesignTokens;
local _ = require(l_Parent_0.GameTile);
local v5 = require(l_script_FirstAncestor_0.GameCollectionLayoutCalculators);
local l_FFlagLuaAppMigrateGameTile_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppMigrateGameTile;
return function(v7, v8, v9, v10, v11, v12, v13, v14) --[[ Line: 15 ]] --[[ Name: useGetGameTileHeight ]]
    -- upvalues: l_useDesignTokens_0 (copy), v2 (copy), v5 (copy), l_FFlagLuaAppMigrateGameTile_0 (copy)
    local v15 = l_useDesignTokens_0();
    return v2.useCallback(function(v16) --[[ Line: 28 ]]
        -- upvalues: v5 (ref), v7 (copy), v8 (copy), v15 (copy), v9 (copy), v10 (copy), v11 (copy), v12 (copy), v13 (copy), l_FFlagLuaAppMigrateGameTile_0 (ref), v14 (copy)
        return v5.calculateTileHeightFromWidth(v16, v7, v8, v15, v9, v10, v11, v12, v13, if l_FFlagLuaAppMigrateGameTile_0 then v14 else nil);
    end, {
        v15, 
        v7, 
        v8, 
        v9, 
        v10, 
        v11, 
        v12, 
        v13, 
        if l_FFlagLuaAppMigrateGameTile_0 then v14 else nil
    });
end;