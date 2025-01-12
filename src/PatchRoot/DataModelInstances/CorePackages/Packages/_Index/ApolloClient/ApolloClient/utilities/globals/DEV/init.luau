local v0 = {};
local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Boolean_0 = require(l_Parent_0.LuauPolyfill).Boolean;
local l_default_0 = require(script.Parent.Parent.common.global).default;
local v4 = "__" .. "DEV" .. "__";
local _ = function() --[[ Line: 23 ]] --[[ Name: getDEV ]]
    -- upvalues: l_Boolean_0 (copy), l_default_0 (copy), v4 (copy)
    local _, v6 = xpcall(function() --[[ Line: 25 ]]
        -- upvalues: l_Boolean_0 (ref)
        return l_Boolean_0.toJSBoolean(_G.__DEV__);
    end, function() --[[ Line: 27 ]]
        -- upvalues: l_default_0 (ref), v4 (ref)
        l_default_0[v4] = true;
        return l_default_0[v4];
    end);
    return v6;
end;
local _, v9 = xpcall(function() --[[ Line: 25 ]]
    -- upvalues: l_Boolean_0 (copy)
    return l_Boolean_0.toJSBoolean(_G.__DEV__);
end, function() --[[ Line: 27 ]]
    -- upvalues: l_default_0 (copy), v4 (copy)
    l_default_0[v4] = true;
    return l_default_0[v4];
end);
v0.default = v9;
return v0;