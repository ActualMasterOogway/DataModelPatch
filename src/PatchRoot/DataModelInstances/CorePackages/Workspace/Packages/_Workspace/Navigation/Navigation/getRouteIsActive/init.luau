local l_script_FirstAncestor_0 = script:FindFirstAncestor("Navigation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_Array_0 = require(l_Parent_0.LuauPolyfill).Array;
local v3 = require(l_script_FirstAncestor_0.getActiveRoutes);
local _ = require(l_script_FirstAncestor_0.NavigationTypes);
return function(v5, v6) --[[ Line: 12 ]] --[[ Name: getRouteIsActive ]]
    -- upvalues: l_Array_0 (copy), v3 (copy)
    return l_Array_0.find(v3(v5), function(v7) --[[ Line: 13 ]]
        -- upvalues: v6 (copy)
        return v7.routeName == v6;
    end) ~= nil;
end;