game:DefineFastFlag("LuafiedReportEntryPoints", false);
return function() --[[ Line: 3 ]]
    return game:GetEngineFeature("EnableMaquettesSupport") or game:GetFastFlag("LuafiedReportEntryPoints");
end;