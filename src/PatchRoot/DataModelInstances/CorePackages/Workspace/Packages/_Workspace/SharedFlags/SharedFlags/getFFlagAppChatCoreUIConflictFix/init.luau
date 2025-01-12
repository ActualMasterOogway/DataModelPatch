local v0 = require(script.Parent.GetFFlagEnableAppChatInExperience);
game:DefineFastFlag("AppChatCoreUIConflictFix", false);
return function() --[[ Line: 5 ]]
    -- upvalues: v0 (copy)
    return game:GetFastFlag("AppChatCoreUIConflictFix") and v0();
end;