game:DefineFastFlag("ExpChatEnableChannelTabsUI1010", false);
return function() --[[ Line: 3 ]]
    return game:GetEngineFeature("EnableChannelTabsConfiguration") and game:GetFastFlag("ExpChatEnableChannelTabsUI1010");
end;