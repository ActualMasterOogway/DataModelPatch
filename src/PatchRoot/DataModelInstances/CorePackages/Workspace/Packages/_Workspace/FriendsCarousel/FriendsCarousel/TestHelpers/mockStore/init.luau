local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsCarousel");
local l_Rodux_0 = require(l_script_FirstAncestor_0.dependencies).Rodux;
return function(v2, v3) --[[ Line: 8 ]]
    -- upvalues: l_Rodux_0 (copy)
    local v5 = v3 or function(v4) --[[ Line: 9 ]]
        return v4;
    end;
    return l_Rodux_0.Store.new(v5, v2 or {}, {
        l_Rodux_0.thunkMiddleware
    });
end;