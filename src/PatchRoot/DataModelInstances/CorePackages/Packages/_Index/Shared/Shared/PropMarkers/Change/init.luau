local v0 = require(script.Parent.Parent["Type.roblox"]);
local v1 = {};
local v3 = {
    __tostring = function(v2) --[[ Line: 33 ]] --[[ Name: __tostring ]]
        return string.format("RoactHostChangeEvent(%s)", v2.name);
    end
};
setmetatable(v1, {
    __index = function(_, v5) --[[ Line: 39 ]] --[[ Name: __index ]]
        -- upvalues: v0 (copy), v3 (copy), v1 (copy)
        local v6 = {
            [v0] = v0.HostChangeEvent, 
            name = v5
        };
        setmetatable(v6, v3);
        v1[v5] = v6;
        return v6;
    end
});
return v1;