local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.dependencies);
local _ = require(l_Parent_0.Common.ModelTypes);
local l_PresenceType_0 = v1.RoduxPresence.Enums.PresenceType;
return function(v4) --[[ Line: 8 ]]
    -- upvalues: l_PresenceType_0 (copy)
    if not v4 then
        return false;
    else
        return v4.userPresenceType == l_PresenceType_0.InGame and (v4.lastLocation and v4.lastLocation ~= "" or false);
    end;
end;