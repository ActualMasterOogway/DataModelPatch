local l_script_FirstAncestor_0 = script:FindFirstAncestor("UserBlockingRodux");
local v1 = require(l_script_FirstAncestor_0.Reducers.UserBlocking.isBlockedByMe);
local v2 = {
    isBlockedByMe = {}
};
return function(v3) --[[ Line: 8 ]]
    -- upvalues: v2 (copy), v1 (copy)
    return function(v4, v5) --[[ Line: 9 ]]
        -- upvalues: v2 (ref), v1 (ref), v3 (copy)
        local v6 = v4 or v2;
        return {
            isBlockedByMe = v1(v3)(v6.isBlockedByMe, v5)
        };
    end;
end;