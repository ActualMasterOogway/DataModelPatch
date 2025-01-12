local v0 = require(script.Parent.GetFFlagLuaAppEnableSquadPage);
game:DefineFastFlag("AppChatAddConnectUnibarForActiveSquad", false);
return function() --[[ Line: 6 ]]
    -- upvalues: v0 (copy)
    return game:GetFastFlag("AppChatAddConnectUnibarForActiveSquad") and v0();
end;