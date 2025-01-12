game:DefineFastFlag("HideConnectPageWebViewItemsForVRV2", false);
return function() --[[ Line: 3 ]]
    if game:GetFastFlag("HideConnectPageWebViewItemsForVRV2") or game:GetEngineFeature("EnableMaquettesSupport") then
        return true;
    else
        return false;
    end;
end;