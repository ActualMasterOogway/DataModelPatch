local v0 = {};
local v1 = {
    __index = v0
};
local v2 = {
    new = function() --[[ Line: 15 ]] --[[ Name: new ]]
        -- upvalues: v1 (copy)
        return (setmetatable({
            _callbacks = {}
        }, v1));
    end
};
v0.fire = function(v3, ...) --[[ Line: 21 ]] --[[ Name: fire ]]
    for _, v5 in v3._callbacks do
        v5(...);
    end;
end;
v0.connect = function(v6, v7) --[[ Line: 27 ]] --[[ Name: connect ]]
    table.insert(v6._callbacks, v7);
    local v8 = true;
    return function() --[[ Line: 31 ]] --[[ Name: disconnect ]]
        -- upvalues: v8 (ref), v6 (copy), v7 (copy)
        if not v8 then
            error("Attempt to disconnect an already disconnected connection");
        end;
        v8 = false;
        local v9 = table.find(v6._callbacks, v7);
        if v9 ~= nil then
            table.remove(v6._callbacks, v9);
        end;
    end;
end;
return v2;