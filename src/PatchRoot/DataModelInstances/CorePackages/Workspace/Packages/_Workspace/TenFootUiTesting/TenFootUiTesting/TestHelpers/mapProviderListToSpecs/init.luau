local l_Parent_0 = script:FindFirstAncestor("TenFootUiTesting").Parent;
local v1 = require(l_Parent_0.Cryo);
local _ = require(l_Parent_0.Dev.RoactUtils);
return function(v3) --[[ Line: 10 ]] --[[ Name: mapProviderListToSpecs ]]
    -- upvalues: v1 (copy)
    return v1.List.map(v3, function(v4) --[[ Line: 11 ]]
        return {
            class = v4
        };
    end);
end;