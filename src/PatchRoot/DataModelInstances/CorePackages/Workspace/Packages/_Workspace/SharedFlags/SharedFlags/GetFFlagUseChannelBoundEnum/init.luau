game:DefineFastFlag("UseChannelBoundEnum", false);
return function() --[[ Line: 3 ]]
    return game:GetFastFlag("UseChannelBoundEnum") and game:GetEngineFeature("NewCallbackForBoundChannel");
end;