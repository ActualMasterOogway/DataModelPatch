local l_script_FirstAncestor_0 = script:FindFirstAncestor("GameTile");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_useDesignTokens_0 = require(l_Parent_0.Style).useDesignTokens;
local v3 = require(l_Parent_0.React);
local v4 = require(l_script_FirstAncestor_0.GameTileConstants);
local v5 = require(l_script_FirstAncestor_0.Overlays.GameTileOverlayBadge);
local v6 = require(l_script_FirstAncestor_0.Overlays.GameTileThumbnailBadgeMap);
local _ = require(l_script_FirstAncestor_0.GameTileTypes);
local l_TileBadgeIconNamesByType_0 = v4.TileBadgeIconNamesByType;
local l_TileBadgePositionValues_0 = v4.TileBadgePositionValues;
local l_FFlagLuaAppGameTileIconTextBadgeEnabled_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppGameTileIconTextBadgeEnabled;
local function v29(v11) --[[ Line: 20 ]] --[[ Name: GameTileThumbnailBadges ]]
    -- upvalues: l_useDesignTokens_0 (copy), v3 (copy), l_TileBadgePositionValues_0 (copy), l_FFlagLuaAppGameTileIconTextBadgeEnabled_0 (copy), v6 (copy), l_TileBadgeIconNamesByType_0 (copy), v5 (copy)
    local l_Space_150_0 = l_useDesignTokens_0().Global.Space_150;
    local v13, v14 = v3.useBinding(0);
    local v17 = v3.useCallback(function(v15) --[[ Line: 26 ]]
        -- upvalues: v14 (copy), l_Space_150_0 (copy)
        local l_X_0 = v15.AbsoluteSize.X;
        v14(l_X_0 - 2 * l_Space_150_0);
    end, {
        l_Space_150_0
    });
    local v18 = {};
    for v19, v20 in v11.tileBadgesByPosition do
        local v21 = nil;
        local v22 = nil;
        if v19 == l_TileBadgePositionValues_0.ImageTopLeft then
            v21 = UDim2.new(0, l_Space_150_0, 0, l_Space_150_0);
            v22 = Vector2.new(0, 0);
        end;
        if #v20 > 0 then
            local v23 = v20[1];
            local v24 = if l_FFlagLuaAppGameTileIconTextBadgeEnabled_0 then nil else v6.getTileBadgeComponent(v23.tileBadgeType);
            if l_FFlagLuaAppGameTileIconTextBadgeEnabled_0 or v24 then
                local v25 = nil;
                if l_FFlagLuaAppGameTileIconTextBadgeEnabled_0 and v23.icons and #v23.icons > 0 then
                    v25 = {};
                    for _, v27 in v23.icons do
                        local v28 = l_TileBadgeIconNamesByType_0[v27];
                        if v28 then
                            table.insert(v25, v28);
                        else
                            warn((("Unsupported game tile badge icon type: %*"):format(v27)));
                        end;
                    end;
                end;
                v18[v19 .. "TileBadge"] = v3.createElement(if l_FFlagLuaAppGameTileIconTextBadgeEnabled_0 then v5 else v24, {
                    Position = v21, 
                    AnchorPoint = v22, 
                    maxWidthBinding = v13, 
                    icons = if l_FFlagLuaAppGameTileIconTextBadgeEnabled_0 then v25 else nil, 
                    text = v23.text
                });
            end;
        end;
    end;
    return v3.createElement("Frame", {
        BackgroundTransparency = 1, 
        Size = UDim2.new(1, 0, 1, 0), 
        [v3.Change.AbsoluteSize] = v17
    }, v18);
end;
if l_FFlagLuaAppGameTileIconTextBadgeEnabled_0 then
    return (v3.memo(v29));
else
    return v29;
end;