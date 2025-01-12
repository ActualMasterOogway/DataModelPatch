local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Dev.React);
local v2 = require(script.Parent.foldProviders);
return function(v3, v4) --[[ Line: 14 ]]
    -- upvalues: v1 (copy), v2 (copy)
    v4 = v4 or {};
    assert(v4, "Config must not be nil");
    v3 = v1.createElement(v3, v4.props);
    return v2(v3, v4.providers or {});
end;