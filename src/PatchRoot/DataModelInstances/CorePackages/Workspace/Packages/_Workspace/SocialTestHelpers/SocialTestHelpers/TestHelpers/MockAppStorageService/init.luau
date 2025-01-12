local v0 = {};
v0.__index = v0;
v0.new = function(v1) --[[ Line: 7 ]] --[[ Name: new ]]
    -- upvalues: v0 (copy)
    local v2 = v1 or {};
    setmetatable(v2, {
        __index = v0
    });
    return v2;
end;
v0.GetItem = function(v3, v4) --[[ Line: 16 ]] --[[ Name: GetItem ]]
    return v3[v4];
end;
v0.SetItem = function(v5, v6, v7) --[[ Line: 20 ]] --[[ Name: SetItem ]]
    v5[v6] = tostring(v7);
end;
v0.flush = function(_) --[[ Line: 24 ]] --[[ Name: flush ]]

end;
return v0;