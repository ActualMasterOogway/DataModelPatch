local l_TextChatService_0 = game:GetService("TextChatService");
local v1 = require(script.Parent.getFFlagChatTranslationUIEnabled);
return function() --[[ Line: 4 ]]
    -- upvalues: l_TextChatService_0 (copy), v1 (copy)
    if l_TextChatService_0.ChatVersion == Enum.ChatVersion.LegacyChatService then
        return false;
    else
        return v1();
    end;
end;