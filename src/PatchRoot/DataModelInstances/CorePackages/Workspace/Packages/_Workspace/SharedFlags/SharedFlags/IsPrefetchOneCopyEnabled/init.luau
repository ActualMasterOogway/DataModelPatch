game:DefineFastFlag("PrefetchOneCopyEnabledForTesting", false);
return function() --[[ Line: 5 ]]
    return game:GetEngineFeature("PrefetchOneCopy") or game:GetFastFlag("PrefetchOneCopyEnabledForTesting");
end;