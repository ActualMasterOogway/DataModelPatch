local l_VoiceChatService_0 = game:GetService("VoiceChatService");
game:DefineFastFlag("VoiceUseAudioRoutingAPIV3", false);
return function() --[[ Line: 5 ]]
    -- upvalues: l_VoiceChatService_0 (copy)
    return game:GetFastFlag("VoiceUseAudioRoutingAPIV3") and l_VoiceChatService_0.UseNewAudioApi;
end;