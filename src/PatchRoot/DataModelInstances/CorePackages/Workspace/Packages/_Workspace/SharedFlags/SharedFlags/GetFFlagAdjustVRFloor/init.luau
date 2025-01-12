game:DefineFastFlag("AdjustVRFloorV2", false);
return function() --[[ Line: 2 ]]
    return game:GetEngineFeature("EnableMaquettesSupport") or game:GetFastFlag("AdjustVRFloorV2");
end;