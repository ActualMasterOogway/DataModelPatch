game:DefineFastFlag("UseLargerCDLCodeFontForVRV2", false);
return function() --[[ Line: 3 ]]
    return game:GetEngineFeature("EnableMaquettesSupport") or game:GetFastFlag("UseLargerCDLCodeFontForVRV2");
end;