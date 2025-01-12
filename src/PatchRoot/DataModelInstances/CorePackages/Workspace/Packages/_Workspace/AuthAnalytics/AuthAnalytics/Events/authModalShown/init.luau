local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Utils.checkAndSendEvent);
return function(v2, v3) --[[ Line: 4 ]]
    -- upvalues: v1 (copy)
    local v4 = {};
    if v3 then
        v4.state = v3;
    end;
    v1(v2, "authModalShown", v4);
end;