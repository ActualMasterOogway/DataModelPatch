game:DefineFastFlag("LuaAppEnableOpenTypeSupport3", false);
return function() --[[ Line: 3 ]]
    return game:GetEngineFeature("SupportOpenTypeFeatures") and game:GetFastFlag("LuaAppEnableOpenTypeSupport3");
end;