game:DefineFastFlag("EnableMultiPageSignup4", false);
return function() --[[ Line: 3 ]]
    return game:GetFastFlag("EnableMultiPageSignup4") and game:GetEngineFeature("MultipageSignupMetadataMapKeyAvailable");
end;