local l_CorePackages_0 = game:GetService("CorePackages");
local l_GetFFlagEnableInGameMenuChromeABTest_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagEnableInGameMenuChromeABTest;
local l_GetFFlagEnableInGameMenuSongbirdABTest_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagEnableInGameMenuSongbirdABTest;
return function() --[[ Line: 6 ]]
    -- upvalues: l_GetFFlagEnableInGameMenuChromeABTest_0 (copy), l_GetFFlagEnableInGameMenuSongbirdABTest_0 (copy)
    return game:GetEngineFeature("ExperienceMenuABTest") and (l_GetFFlagEnableInGameMenuChromeABTest_0() or l_GetFFlagEnableInGameMenuSongbirdABTest_0());
end;