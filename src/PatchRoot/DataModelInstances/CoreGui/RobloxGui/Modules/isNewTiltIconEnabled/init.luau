local l_RobloxGui_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local v1 = require(l_RobloxGui_0.Modules.isNewInGameMenuEnabled);
local v2 = require(l_RobloxGui_0.Modules.Chrome.Enabled);
return function() --[[ Line: 6 ]]
    -- upvalues: v2 (copy), v1 (copy)
    return v2() and not v1();
end;