local v0 = require(script.Parent.FFlagUpdateSquadInDefaultAppChatContainer);
game:DefineFastFlag("EnablePartyIconInNonChrome5", false);
return function() --[[ Line: 5 ]]
    -- upvalues: v0 (copy)
    return game:GetFastFlag("EnablePartyIconInNonChrome5") and v0;
end;