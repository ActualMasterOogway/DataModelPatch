local v0 = require(script.Parent.Parent.List.toSet);
return function(v1, ...) --[[ Line: 4 ]] --[[ Name: removeValue ]]
    -- upvalues: v0 (copy)
    local v2 = type(v1);
    assert(v2 == "table", "expected a table for first argument, got " .. v2);
    local v3 = v0({
        ...
    });
    local v4 = {};
    local v5 = 1;
    for v6 = 1, #v1 do
        if not v3[v1[v6]] then
            v4[v5] = v1[v6];
            v5 = v5 + 1;
        end;
    end;
    return v4;
end;