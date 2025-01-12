local v0 = require(script.LuauSerializer);
local v1 = {};
local v2 = {
    __index = v1
};
v1.new = function() --[[ Line: 15 ]] --[[ Name: new ]]
    -- upvalues: v0 (copy), v2 (copy)
    return (setmetatable({
        _inner = v0.new()
    }, v2));
end;
v1.serialize = function(v3, v4) --[[ Line: 21 ]] --[[ Name: serialize ]]
    return "return " .. v3._inner:serialize(v4) .. "\n";
end;
return v1;