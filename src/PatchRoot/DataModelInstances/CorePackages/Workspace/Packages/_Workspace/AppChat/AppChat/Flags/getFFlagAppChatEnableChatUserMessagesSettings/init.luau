local v0 = require(script.Parent.getFFlagAppChatNewSettingsEndpoint);
game:DefineFastFlag("AppChatEnableChatUserMessagesSettings", false);
return function() --[[ Line: 5 ]]
    -- upvalues: v0 (copy)
    return game:GetFastFlag("AppChatEnableChatUserMessagesSettings") and v0();
end;