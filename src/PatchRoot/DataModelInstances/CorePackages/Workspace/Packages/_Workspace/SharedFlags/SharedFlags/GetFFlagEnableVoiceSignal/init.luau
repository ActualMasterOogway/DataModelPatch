game:DefineFastFlag("EnableVoiceSignal3", false);
return function() --[[ Line: 3 ]]
    return game:GetEngineFeature("AvatarChatServiceEnableVoiceEnabled") and game:GetFastFlag("EnableVoiceSignal3");
end;