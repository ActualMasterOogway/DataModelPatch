game:DefineFastFlag("EnqueueVoiceClientJoinOperationLuaV2", false);
return function() --[[ Line: 3 ]]
    return game:GetEngineFeature("VoiceChatEnqueueClientJoinOperation") and game:GetFastFlag("EnqueueVoiceClientJoinOperationLuaV2");
end;