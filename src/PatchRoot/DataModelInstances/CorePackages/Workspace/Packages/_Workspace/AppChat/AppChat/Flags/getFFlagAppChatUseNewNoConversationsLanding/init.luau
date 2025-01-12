game:DefineFastFlag("AppChatUseNewNoConversationsLanding", false);
local v0 = require(script.Parent.getFFlagAppChatNewSettingsEndpoint);
local v1 = require(script.Parent.getFFlagAppChatMakeBackgroundTransparent);
return function() --[[ Line: 6 ]]
    -- upvalues: v0 (copy), v1 (copy)
    return game:GetFastFlag("AppChatUseNewNoConversationsLanding") and v0() and v1();
end;