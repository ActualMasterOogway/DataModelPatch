game:DefineFastFlag("LuafiedReportFullFlow", false);
return function() --[[ Line: 3 ]]
    return game:GetFastFlag("LuafiedReportFullFlow") or game:GetEngineFeature("EnableMaquettesSupport");
end;