local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfilePlatform");
local l_PresenceType_0 = require(l_script_FirstAncestor_0.Rodux.Presence).Enums.PresenceType;
local v2 = require(l_script_FirstAncestor_0.Common.Enums);
local v3 = require(l_script_FirstAncestor_0.Flags.FFlagProfilePlatformFixNilUniverseId);
local v4 = {
    [l_PresenceType_0.Offline] = v2.PresenceTypes.Offline, 
    [l_PresenceType_0.Online] = v2.PresenceTypes.Online, 
    [l_PresenceType_0.InGame] = v2.PresenceTypes.InGame, 
    [l_PresenceType_0.InStudio] = v2.PresenceTypes.InStudio
};
return function(v5, v6) --[[ Line: 16 ]]
    -- upvalues: v3 (copy), v4 (copy), v2 (copy)
    if v3 then
        local v7 = v4[v5] or v2.PresenceTypes.Offline;
        if v7 == v2.PresenceTypes.InGame and v6 == nil then
            return v2.PresenceTypes.Online;
        else
            return v7;
        end;
    else
        return v4[v5];
    end;
end;