local v0 = require(script.Parent.GetFFlagLuaAppEnableSquadPage);
game:DefineFastFlag("AppChatRebrandStringUpdates", false);
return function() --[[ Line: 4 ]]
    -- upvalues: v0 (copy)
    return game:GetFastFlag("AppChatRebrandStringUpdates") and v0();
end;