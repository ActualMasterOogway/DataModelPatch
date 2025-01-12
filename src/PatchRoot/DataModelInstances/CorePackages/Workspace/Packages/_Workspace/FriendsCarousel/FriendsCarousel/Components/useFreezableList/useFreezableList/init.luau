local l_Parent_0 = script:FindFirstAncestor("FriendsCarousel").Parent;
local v1 = require(l_Parent_0.React);
return function(v2) --[[ Line: 6 ]] --[[ Name: useFreezableList ]]
    -- upvalues: v1 (copy)
    local v3, v4 = v1.useState(nil);
    local v6 = v1.useCallback(function(v5) --[[ Line: 9 ]]
        -- upvalues: v2 (copy), v4 (copy)
        v4(if v5 then v2 else nil);
    end, {
        v2
    });
    return v3 or v2, v6;
end;