local l_script_FirstAncestor_0 = script:FindFirstAncestor("GameTile");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_mutedError_0 = require(l_Parent_0.Loggers).mutedError;
local v3 = require(l_script_FirstAncestor_0.GameTileConstants);
local _ = require(l_script_FirstAncestor_0.GameTileTypes);
return function(v5) --[[ Line: 11 ]] --[[ Name: getValidTileBadges ]]
    -- upvalues: v3 (copy), l_mutedError_0 (copy)
    local v6 = {};
    for v7, v8 in v5 do
        if v7 == v3.TileBadgePositionValues.ImageTopLeft and #v8 > 0 then
            local v9 = v8[1];
            if v9.tileBadgeType and v9.analyticsId then
                v6[v7] = {
                    v8[1]
                };
            else
                l_mutedError_0("Invalid tile badge metadata.");
            end;
        end;
    end;
    return v6;
end;