local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local v1 = require(l_script_FirstAncestor_0.Http.RoduxNetworking);
return function(v2) --[[ Line: 5 ]]
    -- upvalues: v1 (copy)
    local v3 = v1.getNetworkImpl();
    v1.setNetworkImpl(v2);
    return function() --[[ Line: 9 ]]
        -- upvalues: v1 (ref), v3 (copy)
        v1.setNetworkImpl(v3);
    end;
end;