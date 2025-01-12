local l_RobloxGui_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local v1 = require(l_RobloxGui_0.Modules.RobloxTranslator):FormatByKey("Feature.SettingsHub.Prompt.RestartOnMicAccessChange");
return function(v2) --[[ Line: 15 ]]
    -- upvalues: v1 (copy)
    if v2:GetPlatform() == Enum.Platform.Android then
        return "<b>" .. v1 .. "</b>";
    else
        return nil;
    end;
end;