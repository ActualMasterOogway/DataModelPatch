local l_script_FirstAncestor_0 = script:FindFirstAncestor("GameTile");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_GameInfosReducer_0 = require(l_Parent_0.GameInfosRodux).GameInfosReducer;
local v3 = require(l_Parent_0.React);
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local v5 = require(l_script_FirstAncestor_0.getGameTileLayoutData);
local v6 = require(l_script_FirstAncestor_0.Overlays.getValidTileBadges);
return function(v7, v8) --[[ Line: 12 ]] --[[ Name: useValidTileBadges ]]
    -- upvalues: l_useSelector_0 (copy), l_GameInfosReducer_0 (copy), v5 (copy), v3 (copy), v6 (copy)
    local v10 = l_useSelector_0(function(v9) --[[ Line: 13 ]]
        -- upvalues: l_GameInfosReducer_0 (ref), v7 (copy)
        return v9.Personalization[l_GameInfosReducer_0.key][v7];
    end);
    local v11 = v5(v10, v8);
    return (v3.useMemo(function() --[[ Line: 19 ]]
        -- upvalues: v11 (copy), v6 (ref)
        if v11 and v11.tileBadgesByPosition then
            return v6(v11.tileBadgesByPosition);
        else
            return nil;
        end;
    end, {
        v11
    }));
end;