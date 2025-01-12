local l_Parent_0 = script.Parent.Parent;
local l_jest_0 = require(l_Parent_0.JestGlobals).jest;
return function(v2) --[[ Line: 7 ]] --[[ Name: createMemberFunctionMocker ]]
    -- upvalues: l_jest_0 (copy)
    local v3 = {};
    local v4 = getmetatable(v2);
    return function(v5) --[[ Line: 11 ]] --[[ Name: mockMemberFunction ]]
        -- upvalues: v4 (copy), l_jest_0 (ref), v3 (copy)
        local v6 = v4[v5];
        local v7 = l_jest_0.fn();
        v4[v5] = v7;
        table.insert(v3, function() --[[ Line: 15 ]]
            -- upvalues: v4 (ref), v5 (copy), v6 (copy)
            v4[v5] = v6;
        end);
        return v7;
    end, function() --[[ Line: 21 ]] --[[ Name: reset ]]
        -- upvalues: v3 (copy)
        for v8 = #v3, 1, -1 do
            v3[v8]();
        end;
        table.clear(v3);
    end;
end;