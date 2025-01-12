game:DefineFastFlag("VoiceChatClientRewriteMasterLua", false);
return function() --[[ Line: 3 ]]
    return game:GetEngineFeature("VoiceChatClientRewrite_OneFlagToRuleThemAll_Client_DEV") and game:GetFastFlag("VoiceChatClientRewriteMasterLua");
end;