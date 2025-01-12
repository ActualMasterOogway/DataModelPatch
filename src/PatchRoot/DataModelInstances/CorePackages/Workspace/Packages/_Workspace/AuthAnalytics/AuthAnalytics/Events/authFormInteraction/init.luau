local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Utils.checkAndSendEvent);
return function(v2, v3, v4, v5, v6) --[[ Line: 4 ]]
    -- upvalues: v1 (copy)
    local v7 = {};
    if v3 then
        v7.field = v3;
    end;
    if v4 then
        v7.state = v4;
    end;
    if v5 then
        v7.origin = v5;
    end;
    if v6 ~= nil then
        v7.entered = v6;
    end;
    v1(v2, "authFormInteraction", v7);
end;