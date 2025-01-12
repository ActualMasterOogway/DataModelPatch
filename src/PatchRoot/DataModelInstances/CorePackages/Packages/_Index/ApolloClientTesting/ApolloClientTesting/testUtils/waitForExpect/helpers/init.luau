local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_setTimeout_0 = require(l_Parent_0.LuauPolyfill).setTimeout;
local v2 = {};
local function _(v3) --[[ Line: 28 ]] --[[ Name: runWithRealTimers ]]
    return (v3());
end;
v2.getSetTimeoutFn = function() --[[ Line: 60 ]] --[[ Name: getSetTimeoutFn ]]
    -- upvalues: l_setTimeout_0 (copy)
    return ((function() --[[ Line: 61 ]]
        -- upvalues: l_setTimeout_0 (ref)
        return l_setTimeout_0;
    end)());
end;
return v2;