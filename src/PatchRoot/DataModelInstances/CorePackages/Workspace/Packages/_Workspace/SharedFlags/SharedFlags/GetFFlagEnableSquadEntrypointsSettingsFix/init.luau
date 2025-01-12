local v0 = require(script.Parent.getFFlagAppChatEnableConversationUnavailableUI);
local v1 = game:DefineFastFlag("EnableSquadEntrypointsSettingsFix", false);
return function() --[[ Line: 6 ]]
    -- upvalues: v1 (copy), v0 (copy)
    return v1 and v0();
end;