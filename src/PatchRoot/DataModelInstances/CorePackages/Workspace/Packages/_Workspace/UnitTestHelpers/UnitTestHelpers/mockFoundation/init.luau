local l_Parent_0 = script.Parent.Parent;
local l_FoundationProvider_0 = require(l_Parent_0.Foundation).FoundationProvider;
local v2 = require(l_Parent_0.Roact);
return function(v3) --[[ Line: 7 ]]
    -- upvalues: v2 (copy), l_FoundationProvider_0 (copy)
    return v2.createElement(l_FoundationProvider_0, nil, {
        Element = v3
    });
end;