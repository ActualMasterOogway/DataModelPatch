game:DefineFastFlag("HideNotificationIconForVR", false);
return function() --[[ Line: 3 ]]
    return game:GetFastFlag("HideNotificationIconForVR") or game:GetEngineFeature("EnableMaquettesSupport");
end;