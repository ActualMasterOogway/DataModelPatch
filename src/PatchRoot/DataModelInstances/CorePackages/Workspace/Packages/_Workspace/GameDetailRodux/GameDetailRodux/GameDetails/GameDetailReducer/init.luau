local l_script_FirstAncestor_0 = script:FindFirstAncestor("GameDetailRodux");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_Immutable_0 = require(l_Parent_0.AppCommonLib).Immutable;
local v3 = require(l_script_FirstAncestor_0.GameDetails.AddGameDetails);
return function(v4, v5) --[[ Line: 8 ]]
    -- upvalues: v3 (copy), l_Immutable_0 (copy)
    v4 = v4 or {};
    if v5.type == v3.name then
        v4 = l_Immutable_0.JoinDictionaries(v4, v5.gameDetails);
    end;
    return v4;
end;