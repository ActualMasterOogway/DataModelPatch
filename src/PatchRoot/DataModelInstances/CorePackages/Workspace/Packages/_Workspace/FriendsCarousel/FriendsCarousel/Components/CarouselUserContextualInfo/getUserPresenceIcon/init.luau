local l_Parent_0 = script.Parent.Parent.Parent;
local l_PresenceType_0 = require(l_Parent_0.dependencies).RoduxPresence.Enums.PresenceType;
local v2 = {
    [l_PresenceType_0.Online] = "component_assets/circle_16", 
    [l_PresenceType_0.InGame] = "icons/menu/games_small", 
    [l_PresenceType_0.InStudio] = "icons/logo/studiologo_small"
};
local v3 = UDim2.fromOffset(12, 12);
return function(v4) --[[ Line: 28 ]]
    -- upvalues: v2 (copy), l_PresenceType_0 (copy), v3 (copy)
    local v5 = {
        path = v2[v4.presence]
    };
    if v4.presence == l_PresenceType_0.Online then
        v5.color = v4.theme.OnlineStatus.Color;
        v5.transparency = v4.theme.OnlineStatus.Transparency;
        v5.size = v3;
    end;
    if v4.presence == l_PresenceType_0.InGame then
        v5.transparency = v4.theme.IconEmphasis.Transparency;
    end;
    return v5;
end;