game:DefineFastFlag("DebugVRModeInStudio", false);
return function() --[[ Line: 4 ]] --[[ Name: isVRModeInStudio ]]
    return UserSettings().GameSettings:InStudioMode() and game:GetFastFlag("DebugVRModeInStudio");
end;