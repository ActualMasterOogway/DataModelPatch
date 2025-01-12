local l_script_FirstAncestor_0 = script:FindFirstAncestor("Chrome");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_InExperienceAppChatExperimentation_0 = require(l_CorePackages_0.Workspace.Packages.AppChat).App.InExperienceAppChatExperimentation;
local v3 = require(script.Parent.isConnectDropdownEnabled);
local l_GetFFlagEnableAppChatInExperience_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagEnableAppChatInExperience;
local l_GetFFlagAppChatAddConnectUnibarForActiveSquad_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagAppChatAddConnectUnibarForActiveSquad;
local v6 = require(l_script_FirstAncestor_0.Flags.GetShouldShowPlatformChatBasedOnPolicy);
return function() --[[ Line: 15 ]]
    -- upvalues: l_GetFFlagEnableAppChatInExperience_0 (copy), l_InExperienceAppChatExperimentation_0 (copy), v6 (copy), v3 (copy), l_GetFFlagAppChatAddConnectUnibarForActiveSquad_0 (copy)
    local v7 = l_GetFFlagEnableAppChatInExperience_0() and l_InExperienceAppChatExperimentation_0.default.variant.ShowPlatformChatChromeUnibarEntryPoint and v6();
    local v8 = v3();
    return v7 or v8 and l_GetFFlagAppChatAddConnectUnibarForActiveSquad_0();
end;