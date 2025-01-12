local l_CoreGui_0 = game:GetService("CoreGui");
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local v2 = require(l_RobloxGui_0.Modules.RobloxTranslator);
local v3 = require(script.Parent.mockTranslator);
return function() --[[ Line: 9 ]]
    -- upvalues: l_CoreGui_0 (copy), v2 (copy), v3 (copy)
    if l_CoreGui_0:FindFirstChild("CoreScriptLocalization") then
        return v2;
    else
        return v3;
    end;
end;