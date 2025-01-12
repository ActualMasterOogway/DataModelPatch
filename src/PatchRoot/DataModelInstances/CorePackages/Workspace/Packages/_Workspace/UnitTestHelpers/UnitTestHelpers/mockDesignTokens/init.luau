local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Roact);
local v2 = require(l_Parent_0.Style);
return function(v3, v4) --[[ Line: 7 ]]
    -- upvalues: v1 (copy), v2 (copy)
    local v5 = v4 or {};
    return v1.createElement(v2.DesignTokenProvider, {
        tokenMappers = v5
    }, {
        Element = v3
    });
end;