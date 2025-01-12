local v0 = {};
v0.__index = v0;
v0.new = function() --[[ Line: 25 ]] --[[ Name: new ]]
    -- upvalues: v0 (copy)
    local v1 = setmetatable({}, v0);
    v1._connections = {};
    return v1;
end;
v0.trackConnection = function(v2, v3, v4) --[[ Line: 33 ]] --[[ Name: trackConnection ]]
    if v2._connections[v3] then
        v2._connections[v3]();
    end;
    v2._connections[v3] = function() --[[ Line: 38 ]]
        -- upvalues: v4 (copy)
        v4:Disconnect();
    end;
end;
v0.trackBoundFunction = function(v5, v6, v7) --[[ Line: 41 ]] --[[ Name: trackBoundFunction ]]
    if v5._connections[v6] then
        v5._connections[v6]();
    end;
    v5._connections[v6] = v7;
end;
v0.disconnect = function(v8, v9) --[[ Line: 48 ]] --[[ Name: disconnect ]]
    if v8._connections[v9] then
        v8._connections[v9]();
        v8._connections[v9] = nil;
    end;
end;
v0.disconnectAll = function(v10) --[[ Line: 55 ]] --[[ Name: disconnectAll ]]
    for _, v12 in pairs(v10._connections) do
        v12();
    end;
    v10._connections = {};
end;
return v0;