local l_Players_0 = game:GetService("Players");
local l_VRService_0 = game:GetService("VRService");
local l_CorePackages_0 = game:GetService("CorePackages");
local v3 = require(script.Parent.IsExperienceMenuABTestEnabled);
local v4 = require(script.Parent.ExperienceMenuABTestManager);
game:DefineFastInt("NewInGameMenuPercentRollout3", 0);
game:DefineFastString("NewInGameMenuForcedUserIds", "");
game:DefineFastFlag("NewInGameMenuDisabledInVR", false);
local _ = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local _ = require(l_CorePackages_0.Workspace.Packages.SharedFlags).isSubjectToDesktopPolicies;
return function() --[[ Line: 18 ]]
    -- upvalues: l_VRService_0 (copy), l_Players_0 (copy), v3 (copy), v4 (copy)
    if l_VRService_0.VREnabled then
        return true;
    else
        local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
        while not l_LocalPlayer_0 do
            l_Players_0:GetPropertyChangedSignal("LocalPlayer"):Wait();
            l_LocalPlayer_0 = l_Players_0.LocalPlayer;
        end;
        for v8 in game:GetFastString("NewInGameMenuForcedUserIds"):gmatch("%d+") do
            if tonumber(v8) == l_LocalPlayer_0.UserId then
                return true;
            end;
        end;
        if v3() and v4.default:isV3MenuEnabled() then
            return true;
        elseif game:GetFastInt("NewInGameMenuPercentRollout3") > l_LocalPlayer_0.UserId % 100 then
            return true;
        else
            return false;
        end;
    end;
end;