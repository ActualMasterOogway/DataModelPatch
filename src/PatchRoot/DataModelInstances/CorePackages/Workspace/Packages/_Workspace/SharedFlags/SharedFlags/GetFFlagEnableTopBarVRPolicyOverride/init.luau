game:DefineFastFlag("EnableTopBarVRPolicyOverride", false);
return function() --[[ Line: 3 ]]
    return game:GetEngineFeature("EnableMaquettesSupport") or game:GetFastFlag("EnableTopBarVRPolicyOverride");
end;