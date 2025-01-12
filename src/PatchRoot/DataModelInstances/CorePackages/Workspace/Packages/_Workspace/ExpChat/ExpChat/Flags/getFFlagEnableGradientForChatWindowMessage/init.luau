game:DefineFastFlag("EnableGradientForChatWindowMessage", false);
return function() --[[ Line: 3 ]]
    return game:GetEngineFeature("EnableChatWindowMessageProperties") and game:GetFastFlag("EnableGradientForChatWindowMessage");
end;