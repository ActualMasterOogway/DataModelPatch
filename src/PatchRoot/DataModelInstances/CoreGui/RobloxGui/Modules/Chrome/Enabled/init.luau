local l_script_FirstAncestor_0 = script:FindFirstAncestor("Chrome");
local v1 = require(l_script_FirstAncestor_0.Parent.IsExperienceMenuABTestEnabled);
local v2 = require(l_script_FirstAncestor_0.Parent.ExperienceMenuABTestManager);
game:DefineFastFlag("EnableInGameMenuChrome", false);
local v3 = game:DefineFastFlag("DebugEnableChromeOnUnsupportedDevices", false);
local l_VRService_0 = game:GetService("VRService");
local l_RobloxGui_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local v6 = require(l_RobloxGui_0.Modules.TenFootInterface):IsEnabled();
return function() --[[ Line: 13 ]]
    -- upvalues: v3 (copy), l_VRService_0 (copy), v1 (copy), v2 (copy), v6 (copy)
    if v3 then
        return true;
    elseif l_VRService_0.VREnabled then
        return false;
    elseif v1() and v2.default:isChromeEnabled() then
        return true;
    elseif v6 then
        return false;
    else
        return game:GetFastFlag("EnableInGameMenuChrome");
    end;
end;