game:DefineFastFlag("EnableVoiceSignal2", false);
return function() --[[ Line: 3 ]]
    return game:GetEngineFeature("AvatarChatServiceEnableVoiceEnabled") and game:GetFastFlag("EnableVoiceSignal2");
end;