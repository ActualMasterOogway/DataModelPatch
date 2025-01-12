game:DefineFastFlag("EnableVRWrapperTransparency", false);
return function() --[[ Line: 2 ]]
    return game:GetEngineFeature("EnableMaquettesSupport") or game:GetFastFlag("EnableVRWrapperTransparency");
end;