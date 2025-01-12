game:DefineFastFlag("VoiceChatTeamTestMuteIconOutOfSyncFixLua", false);
return function() --[[ Line: 3 ]]
    return game:GetEngineFeature("VoiceChatTeamTestMuteIconOutOfSyncFix") and game:GetFastFlag("VoiceChatTeamTestMuteIconOutOfSyncFixLua");
end;