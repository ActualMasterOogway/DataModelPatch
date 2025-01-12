local l_script_FirstAncestor_0 = script:FindFirstAncestor("GameTile");
local v1 = require(l_script_FirstAncestor_0.GameTileConstants);
local _ = require(l_script_FirstAncestor_0.GameTileTypes);
local v3 = require(l_script_FirstAncestor_0.Overlays.GameTileOverlayTextPill);
return {
    getTileBadgeComponent = function(v4) --[[ Line: 8 ]]
        -- upvalues: v1 (copy), v3 (copy)
        if v4 == v1.TileBadgeTypeValues.Text then
            return v3;
        else
            warn("Unsupported game tile badge type: " .. v4);
            return nil;
        end;
    end
};