game:DefineFastFlag("DisableEditProfileForVRV2", false);
return function() --[[ Line: 3 ]]
    if game:GetFastFlag("DisableEditProfileForVRV2") or game:GetEngineFeature("EnableMaquettesSupport") then
        return true;
    else
        return false;
    end;
end;