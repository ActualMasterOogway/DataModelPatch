game:DefineFastFlag("RefactorTileTextHeights", false);
return function() --[[ Line: 3 ]]
    return game:GetFastFlag("RefactorTileTextHeights") and game:GetEngineFeature("EnablePreferredTextSizeSetting");
end;