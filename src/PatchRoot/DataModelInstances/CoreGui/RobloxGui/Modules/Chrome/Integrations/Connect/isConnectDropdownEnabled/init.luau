local l_script_FirstAncestor_0 = script:FindFirstAncestor("Chrome");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_InExperienceAppChatExperimentation_0 = require(l_CorePackages_0.Workspace.Packages.AppChat).App.InExperienceAppChatExperimentation;
local l_GetFFlagEnableAppChatInExperience_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagEnableAppChatInExperience;
local v4 = require(l_script_FirstAncestor_0.Flags.GetShouldShowPlatformChatBasedOnPolicy);
return function() --[[ Line: 12 ]]
    -- upvalues: l_GetFFlagEnableAppChatInExperience_0 (copy), l_InExperienceAppChatExperimentation_0 (copy), v4 (copy)
    return l_GetFFlagEnableAppChatInExperience_0() and l_InExperienceAppChatExperimentation_0.default.variant.ShowPlatformChatChromeDropdownEntryPoint and v4();
end;