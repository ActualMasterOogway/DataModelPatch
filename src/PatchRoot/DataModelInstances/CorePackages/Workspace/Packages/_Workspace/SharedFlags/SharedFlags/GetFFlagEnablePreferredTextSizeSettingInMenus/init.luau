game:DefineFastFlag("EnablePreferredTextSizeSettingInMenus2", false);
return function() --[[ Line: 3 ]]
    return game:GetEngineFeature("EnablePreferredTextSizeSetting") and game:GetFastFlag("EnablePreferredTextSizeSettingInMenus2");
end;