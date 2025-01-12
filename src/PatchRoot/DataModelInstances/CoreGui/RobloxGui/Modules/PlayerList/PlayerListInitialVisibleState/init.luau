local l_VRService_0 = game:GetService("VRService");
local l_RobloxGui_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local v2 = require(l_RobloxGui_0.Modules.TenFootInterface);
local v3 = require(l_RobloxGui_0.Modules.Settings.Utility);
local function _() --[[ Line: 7 ]] --[[ Name: isSmallTouchScreen ]]
    -- upvalues: v3 (copy)
    if _G.__TESTEZ_RUNNING_TEST__ then
        return false;
    else
        return v3:IsSmallTouchScreen();
    end;
end;
return function() --[[ Line: 14 ]]
    -- upvalues: v3 (copy), l_VRService_0 (copy), v2 (copy)
    return not (not _G.__TESTEZ_RUNNING_TEST__ and v3:IsSmallTouchScreen()) and not l_VRService_0.VREnabled and not v2:IsEnabled();
end;