game:DefineFastFlag("ReenableTextChatForTenFootInterfaces3", false);
game:DefineFastFlag("DebugForceTextChatEnabledForTenFootInterfaces", false);
return function() --[[ Line: 18 ]]
    return game:GetFastFlag("ReenableTextChatForTenFootInterfaces3") and game:GetEngineFeature("ThirdPartyTextChatPermissionsApi") or game:GetFastFlag("DebugForceTextChatEnabledForTenFootInterfaces");
end;