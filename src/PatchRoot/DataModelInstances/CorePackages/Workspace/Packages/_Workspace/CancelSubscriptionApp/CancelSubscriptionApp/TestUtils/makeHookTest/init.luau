local l_Parent_0 = script:FindFirstAncestor("CancelSubscriptionApp").Parent;
local v1 = require(l_Parent_0.React);
return function(v2, v3) --[[ Line: 5 ]] --[[ Name: makeHookTest ]]
    -- upvalues: v1 (copy)
    return function() --[[ Line: 6 ]]
        -- upvalues: v2 (copy), v3 (copy), v1 (ref)
        local v4 = v2();
        v3(v4);
        return v1.createElement("Frame");
    end;
end;