local l_Parent_0 = script.Parent.Parent.Parent;
local l_PresenceType_0 = require(l_Parent_0.dependencies).RoduxPresence.Enums.PresenceType;
local _ = require(l_Parent_0.Common.ModelTypes);
local v3 = require(l_Parent_0.Utils.isUserInGame);
return function(v4) --[[ Line: 10 ]]
    -- upvalues: l_PresenceType_0 (copy), v3 (copy)
    local l_userPresenceType_0 = v4.userPresenceType;
    if l_userPresenceType_0 == l_PresenceType_0.InGame then
        return v3(v4) and l_PresenceType_0.InGame or l_PresenceType_0.Online;
    else
        return l_userPresenceType_0;
    end;
end;