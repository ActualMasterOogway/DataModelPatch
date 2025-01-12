game:DefineFastFlag("UseLinkingService", false);
return function() --[[ Line: 3 ]]
    return game:GetFastFlag("UseLinkingService") and game:GetEngineFeature("LinkingServiceEnabled");
end;