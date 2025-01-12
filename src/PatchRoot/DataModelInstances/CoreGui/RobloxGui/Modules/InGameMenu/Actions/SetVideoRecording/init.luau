local l_CorePackages_0 = game:GetService("CorePackages");
return require(l_CorePackages_0.Packages.Rodux).makeActionCreator("SET_VIDEO_RECORDING", function(v1) --[[ Line: 5 ]]
    return {
        recording = v1
    };
end);