game:DefineFastFlag("ExpChatWhisperSetting", false);
return function() --[[ Line: 3 ]]
    return game:GetEngineFeature("TextChatServiceWhisperCheckEnabled") and game:GetFastFlag("ExpChatWhisperSetting");
end;