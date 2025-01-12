local l_CorePackages_0 = game:GetService("CorePackages");
local l_GetFFlagLuaAppEnableSquadPage_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagLuaAppEnableSquadPage;
game:DefineFastFlag("AppChatInExpConnectIconEnableSquadIndicator2", false);
return function() --[[ Line: 6 ]]
    -- upvalues: l_GetFFlagLuaAppEnableSquadPage_0 (copy)
    return game:GetFastFlag("AppChatInExpConnectIconEnableSquadIndicator2") and l_GetFFlagLuaAppEnableSquadPage_0();
end;