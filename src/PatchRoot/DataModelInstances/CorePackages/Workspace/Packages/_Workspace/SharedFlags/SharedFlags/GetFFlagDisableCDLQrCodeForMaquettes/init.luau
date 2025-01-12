game:DefineFastFlag("DisableCDLQrCodeForMaquettes", false);
return function() --[[ Line: 3 ]]
    return game:GetFastFlag("DisableCDLQrCodeForMaquettes") or game:GetEngineFeature("EnableMaquettesSupport");
end;