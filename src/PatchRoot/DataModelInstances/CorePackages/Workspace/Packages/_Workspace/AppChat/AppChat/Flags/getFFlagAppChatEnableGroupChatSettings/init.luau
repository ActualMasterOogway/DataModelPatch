local v0 = require(script.Parent.getFFlagAppChatNewSettingsEndpoint);
game:DefineFastFlag("AppChatEnableGroupChatSettings", false);
return function() --[[ Line: 5 ]]
    -- upvalues: v0 (copy)
    return game:GetFastFlag("AppChatEnableGroupChatSettings") and v0();
end;