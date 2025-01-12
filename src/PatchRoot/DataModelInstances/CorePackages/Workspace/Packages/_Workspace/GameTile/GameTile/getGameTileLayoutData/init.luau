local l_script_FirstAncestor_0 = script:FindFirstAncestor("GameTile");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local _ = require(l_script_FirstAncestor_0.GameTileTypes);
local l_FFlagLuaAppGameTileIconTextBadgeEnabled_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppGameTileIconTextBadgeEnabled;
local v4 = {};
return function(v5, v6) --[[ Line: 12 ]] --[[ Name: getGameTileLayoutData ]]
    -- upvalues: l_FFlagLuaAppGameTileIconTextBadgeEnabled_0 (copy), v4 (copy)
    if v5 and v5.layoutDataBySort and v6 and v6 ~= "" and v5.layoutDataBySort[v6] then
        return v5.layoutDataBySort[v6];
    elseif v5 and v5.defaultLayoutData then
        return v5.defaultLayoutData;
    elseif l_FFlagLuaAppGameTileIconTextBadgeEnabled_0 then
        return v4;
    else
        return {};
    end;
end;