return function(v0) --[[ Line: 2 ]] --[[ Name: flip ]]
    local v1 = type(v0);
    assert(v1 == "table", "expected a table for first argument, got " .. v1);
    local v2 = {};
    for v3, v4 in pairs(v0) do
        v2[v4] = v3;
    end;
    return v2;
end;