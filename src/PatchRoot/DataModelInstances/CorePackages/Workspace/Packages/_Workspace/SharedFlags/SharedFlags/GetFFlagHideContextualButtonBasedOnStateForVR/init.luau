game:DefineFastFlag("HideContextualButtonBasedOnStateForVR", false);
return function() --[[ Line: 3 ]]
    return game:GetFastFlag("HideContextualButtonBasedOnStateForVR") or game:GetEngineFeature("EnableMaquettesSupport");
end;