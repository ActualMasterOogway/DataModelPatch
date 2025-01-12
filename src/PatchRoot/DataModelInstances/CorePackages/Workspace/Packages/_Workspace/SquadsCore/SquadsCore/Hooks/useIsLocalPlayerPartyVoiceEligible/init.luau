local l_Players_0 = game:GetService("Players");
local v1 = require(script.Parent.useIsUserPartyVoiceEligible);
useIsLocalPlayerPartyVoiceEligible = function() --[[ Line: 5 ]] --[[ Name: useIsLocalPlayerPartyVoiceEligible ]]
    -- upvalues: l_Players_0 (copy), v1 (copy)
    local v2 = l_Players_0.LocalPlayer and l_Players_0.LocalPlayer.UserId or 0;
    return v1(v2);
end;
return useIsLocalPlayerPartyVoiceEligible;